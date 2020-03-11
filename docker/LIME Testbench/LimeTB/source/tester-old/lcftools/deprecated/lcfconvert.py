import math
import re
import sys

id = 1
# store constants here (id, value)
constants = []
# store variables here key: name value: (id, bitwidth)
variables = {}
# store extensions here
extensions = []
# store slices here
slices = []
# store operations here (id, operation, bitwidth, var1, var2)
operations = []
# used to keep track of information what clauses in the assignment still need to
# be forced to be true at the end of the output
# key: id value: True if this clause has not been used yet
verified = {}

def parseconstant(string):
	return re.match('^-?\d+$', string)

def addconstant(value):
	global id
	tmpid = id
	constants.append((tmpid, value))
	verified[tmpid] = False
	id += 1
	return tmpid

def addsext(var, bw, diff):
	global id
	tmpid = id
	extensions.append((tmpid, bw, var, diff))
	verified[tmpid] = False
	verified[var] = True
	id += 1
	return tmpid

def addslice(var, bw):
	global id
	tmpid = id
	slices.append((tmpid, bw, var, bw-1, 0))
	verified[tmpid] = False
	verified[var] = True
	id += 1
	return tmpid

def parsevar(string):
	return re.match('^(i|ui|b|O)(\d+)_.+$', string)

def addvar(name, bw):
	global id
	if name in variables:
		if bw != variables[name][1]:
			print 'warning: found two declarations of a variable with', \
			      'different bit widths, using the larger one'
			variables[name][1] = max(variables[name][1], bw)
		return variables[name][0]
	else:
		tmpid = id
		variables[name] = (tmpid, bw)
		verified[tmpid] = False
		id += 1
		return tmpid

def parseop(string):
	return re.match('^==|!=|>|>=|<|<=|\+|-|\*|/|%|<<|>>|\||&|\^$', string)

def addop(op, var1, var2, bw):
	global id
	tmpid = id
	operations.append((tmpid, op, bw, var1, var2))
	verified[tmpid] = False
	verified[var1] = True
	verified[var2] = True
	id += 1
	return tmpid

def opconvert(op, signed):
	if op == '>':
		if signed:
			return 'sgt'
		else:
			return 'ugt'
	elif op == '>=':
		if signed:
			return 'sgte'
		else:
			return 'ugte'
	elif op == '<':
		if signed:
			return 'slt'
		else:
			return 'ult'
	elif op == '<=':
		if signed:
			return 'slte'
		else:
			return 'ulte'
	elif op == '==':
		return 'eq'
	elif op == '!=':
		return 'ne'
	elif op == '+':
		return 'add'
	elif op == '-':
		return 'sub'
	elif op == '*':
		return 'mul'
	elif op == '/':
		if signed:
			return 'sdiv'
		else:
			return 'udiv'
	elif op == '%':
		return 'srem'
	elif op == '<<':
		return 'sll'
	elif op == '>>':
		return 'sra'
	elif op == '|':
		return 'or'
	elif op == '&':
		return 'and'
	elif op == '^':
		return 'xor'
	else:
		print 'unsupported operation: %s' % op
		sys.exit(1)

# return the tuple (id, bit width, signed) for the parsed element (necessary 
# for deciding the parameters for operations correctly)
def parse(constraint):
	tmp = constraint[0]
	if parseconstant(tmp) != None:
		# kari uses -1 as bit width for constants so i hope this works correctly
		# (another safe value would be 32 or something providing the constant is
		# not too large)
		return (addconstant(int(tmp)), -1, True)
	elif parsevar(tmp) != None:
		var = parsevar(tmp)
		bw = 32 # use some sane default
		if var.group(1) == 'b':
			bw = 1
		elif var.group(1) == 'O':
			# this reference bit width seems to be constant 16 in kari's parser
			bw = 16
		else:
			bw = int(var.group(2))
		return (addvar(var.group(0), bw), bw, \
		        True if var.group(1) == 'i' else False)
	elif parseop(tmp) != None:
		var1 = parse(constraint[1:])
		var2 = parse(constraint[2:])
		# check bit widths and add extensions as necessary
		maxbw = max(var1[1], var2[1])
		if var1[1] < maxbw and var1[1] > 0:
			var1 = (addsext(var1[0], maxbw, maxbw-var1[1]), maxbw, var1[2])
		if var2[1] < maxbw and var2[1] > 0:
			var2 = (addsext(var2[0], maxbw, maxbw-var2[1]), maxbw, var2[2])
		signed = var1[2]
		if var1[2] != var2[2]:
			print 'comparing signed and unsigned variables not yet supported'
			signed = False
		if tmp == '>>' or tmp == '<<':
			var2 = (addslice(var2[0], int(math.log(maxbw, 2))), var2[1], var2[2])
		bw = maxbw
		if tmp == '==' or tmp == '!=' or tmp == '>' or tmp == '>=' \
		   or tmp == '<' or tmp == '<=':
			bw = 1
		return (addop(opconvert(tmp, signed), var1[0], var2[0], bw), \
		        bw, signed)
	else:
		print 'could not parse part of constraint: %s' % tmp
		sys.exit(1)

def printconstants():
	for i in constants:
		print '%d constd %d %d' % (i[0], 32, i[1])

def printextensions():
	for i in extensions:
		print '%d sext %d %d %d' % (i[0], i[1], i[2], i[3])

def printslices():
	for i in slices:
		print '%d slice %d %d %d %d' % (i[0], i[1], i[2], i[3], i[4])

def printvariables():
	for name, data in variables.iteritems():
		print '%d var %d %s' % (data[0], data[1], name)

def printoperations():
	for i in operations:
		print '%d %s %d %d %d' % (i[0], i[1], i[2], i[3], i[4])

def printfinish():
	global id
	notforced = [x for x, y in verified.iteritems() if not y]
	while len(notforced) > 1:
		print '%d and 1 %d %d' % (id, notforced[0], notforced[1])
		del notforced[0]
		del notforced[0]
		notforced.append(id)
		id += 1
	if len(notforced) == 1:
		print '%d root 1 %d' % (id, notforced[0])
	else:
		print 'could not find any "free" clauses'
		sys.exit(1)

def parseline(constraintline):
	# boolector does not use true or false so replace them
	constraintline.replace('true', '1')
	constraintline.replace('false', '0')
	parts = [x.split() for x in constraintline.split('D')]
	for constraint in parts:
		parse(constraint)
	printconstants()
	printvariables()
	printextensions()
	printslices()
	printoperations()
	printfinish()

parseline(raw_input())
sys.exit(0)

# from
#== i32_2 124D== i32_2 + i32_0 i32_1D<= i32_1 0D== i32_1 i32_input_2D== i32_0 i32_input_1

# to
#5 constd 32 0
#2 constd 32 124
#3 var 32 i32_0
#4 var 32 i32_1
#1 var 32 i32_2
#7 var 32 i32_input_1
#6 var 32 i32_input_2
#8 add 32 3 4
#9 eq 1 1 2
#10 slte 1 4 5
#11 eq 1 4 6
#12 eq 1 3 7
#13 eq 1 1 8
#14 and 1 9 10
#15 and 1 14 11
#16 and 1 15 12
#17 and 1 16 13
