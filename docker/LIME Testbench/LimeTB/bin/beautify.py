#!/usr/bin/python
#
# Beautifies stack traces like
#
# Exception in thread "main" fi.hut.ics.lime.aspectmonitor.CallSpecificationException: notNaN
#    at example_arithmetic.CALLSpecificationPointnotNaN.ajc$around$example_arithmetic_CALLSpecificationPointnotNaN$1$186ccfbc(CALLSpecificationPointnotNaN.aj:28)
#    at example_arithmetic.PointImpl.setXY(PointImpl.java:10)
#    at example_arithmetic.PointImpl.<init>(PointImpl.java:7)
#    at example_arithmetic.LineImpl.intersect(LineImpl.java:92)
#    at example_arithmetic.Main.main(Main.java:9)
#
# by giving a more human-readable description of a specification violation
# and hiding the aspects (which are internal to LIME).
#
# Also tries to be nice to programs whose stdout isn't line buffered.
# Actually this is the source of complexity in this program. I wonder
# if it was worth it, but it's done.
#
#
# You can direct the output in a file and open it in emacs with
# `emacs file.out -e compilation-mode'
#


import fcntl, os, select, sys, re


class LineProcessor:
    def __init__(self):
        # Whether we are currently handling an exception targeted at us
        self.in_backtrace = False
        self.trace = []
        self.thread = None
        self.spectype = None
        self.specname = None

    # See if a line is a stack trace line. If not, return False.
    # Else add its data to self.trace and return True.
    def __processbtline(self, line):
        assert self.in_backtrace
        STKLINE = re.compile(
            r'\s+at (?P<method>[^(]+)\((?P<sourcepoint>[^)]+)\)')
        ma = STKLINE.match(line)
        if ma == None:
            return False
        meth = ma.group('method')
        point = ma.group('sourcepoint')
        if (meth.find('ajc$') != -1 or meth.find('$Ajc') != -1 or
            meth.find('_aroundBody') != -1):
            # internal method, do not record
            return True
        self.trace.append((meth,point))
        return True

    # Gets a fully qualified method name and and tries to find a file that
    # matches it. Sourcepos is of format "Filename.java:82".
    # Returns a string of the format $PATH:$LINENUM.
    def __get_filename(self, methname, sourcepos):
        if not ':' in sourcepos:
            return '<unknown:'+sourcepos+'>'
        
        assertedFilename = sourcepos[0:sourcepos.index(':')]
        lnum = sourcepos[sourcepos.rindex(':')+1:]
        methname = methname.split('.')
        # strip the method name from the FQN and convert into something
        # path-like
        
        fname = '/'.join(methname[:-2])+'/'+assertedFilename
        
        # try to open
        try:
            open(fname)
            # success, return file name
            return fname+':'+lnum
        except IOError:
            # failed
            return '<'+assertedFilename+'>:'+lnum

    def __dump_trace(self):
        assert self.trace != []

        trace = [(self.__get_filename(*x), x[0]) for x in self.trace]
        maxlen = max([len(x[0]) for x in trace])

        fpos = trace[0][0]
        beg = "%s:%s" % (fpos, ' '*(maxlen-len(fpos)))
        print "%s %s specification `%s' violated at this point." % (
            beg, self.spectype, self.specname)
        print "%s Stack trace:" % beg

        extra = '   <-- violation happened here'
        for fpos,meth in trace:
            spacer = ' '*(maxlen-len(fpos))
            print "%s:%s    %s%s" % (fpos, spacer, meth, extra)
            extra = ''
        self.trace = []
        self.in_backtrace = False
        self.thread = None
        self.spectype = None
        self.specname = None
    
    def finished(self):
        if self.in_backtrace:
            self.__dump_trace()

    def processline(self, line):
        EXCRE = re.compile(
            r'^(?P<junk>.*)Exception in thread "(?P<thread>\w+)" '+
            r'fi\.hut\.ics\.lime\.aspectmonitor\.'+
            r'(?P<spectype>Call|Return)SpecificationException: '+
            r'(?P<specname>\w+)\s*$')
        if self.in_backtrace:
            if self.__processbtline(line):
                return
            else:
                self.__dump_trace()
        ma = EXCRE.search(line)
        if ma == None:
            #print "processline: '%s'" % line
            sys.stdout.write(line)
            sys.stdout.flush()
            return
        # we have a match
        if ma.group('junk') != '':
            print ma.group('junk') # force a newline
        self.thread = ma.group('thread')
        self.spectype = ma.group('spectype')
        self.specname = ma.group('specname')
        self.in_backtrace = True


class BufferingProcessor:
    def __init__(self):
        # The ignore flag is true iff we have already determined for the
        # current line that it cannot be the start of an exception trace
        self.ignore = False
        self.currline = ''
        self.lproc = LineProcessor()

    # Flush any remaining data
    def finished(self):
        sys.stdout.write(self.currline)
        self.currline = ''
        self.ignore = False
        self.lproc.finished()

    # We need to implement our own line buffering which buffers only lines
    # that look like (our) exceptions. This function does that.
    def processdata(self, data):
        assert data != ''

        BEG = 'Exception in thread '

        while data != '':
            if self.ignore:
                # We have already determined this line is not of interest.
                # Do not buffer this line.
                i = data.find('\n')
                if i == -1:
                    # Not a whole line.
                    sys.stdout.write(data)
                else:
                    # Contains a newline. Output until EOL, then see if
                    # the next line would be more interesting.
                    sys.stdout.write(data[0:i+1])
                    sys.stdout.flush()
                    data = data[i+1:]
                    self.ignore = False
                    #print "-ignore"
            else:
                # We have not seen yet enough of this line to have determined
                # if it can be the first line of a stack trace.
                i = data.find('\n')
                if i == -1:
                    # Not a whole line. Inspect to see if it looks like the start
                    # of a stack trace.
                    if not BEG.startswith(self.currline[0:len(BEG)]):
                        # It doesn't. Flush and don't buffer the rest of the line.
                        sys.stdout.write(self.currline)
                        sys.stdout.write(data)
                        sys.stdout.flush()
                        self.currline=''
                        self.ignore = True
                        #print "+ignore"
                    else:
                        #print "could be; got "+str(len(data))
                        # Still not sure.
                        self.currline += data
                        #print "currline now: '%s'" % self.currline
                        data = ''
                else:
                    self.currline += data[:i+1]
                    self.lproc.processline(self.currline)
                    self.currline = ''
                    data = data[i+1:]


def main():
    # make stdin non-blocking
    fcntl.fcntl(0, fcntl.F_SETFL, os.O_NONBLOCK)

    proc = BufferingProcessor()

    while True:
        rdy = select.select([0], [], [])[0]
        assert rdy == [0]
        data = os.read(0, 4096)
        if data == '':
            # EOF
            break
        proc.processdata(data)
    proc.finished()


if __name__ == '__main__':
    main()
