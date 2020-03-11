/*
Copyright (c) 2008 Helsinki University of Technology (TKK)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
 */

package fi.hut.ics.lime.tester.server.strategies;

public class BasicTree {

    //TODO: change to private
    public BasicTree left;
    public BasicTree right;
    public BasicTree parent;
    public String pathConstraint;
    public String objectConstraints;
    public boolean isFinished;
    public String pathString;

    public String inputString;
    public String objectString;


    public BasicTree()// (SystemInformation si)
    {
        isFinished          = false;
        pathString          = "";

        inputString         = "";
        objectString        = "";

        pathConstraint      = "empty";
        objectConstraints   = "empty";
    }



    public BasicTree (BasicTree parent)
    {
        isFinished          = false;
        this.parent         = parent;
        pathString          = "";

        inputString         = "";
        objectString        = "";
    }



    public void addConstraint (String constraint)
    {
        if (pathConstraint == null || pathConstraint.equals("") || pathConstraint.equals("empty"))
            pathConstraint = constraint;
        else
            pathConstraint = pathConstraint + "D" + constraint;

        if (objectConstraints == null)
            objectConstraints = "";
    }



    public void addObjectConstraint (String constraint)
    {
        if (objectConstraints == null || objectConstraints.equals("") || objectConstraints.equals("empty"))
            objectConstraints = constraint;
        else
            objectConstraints = objectConstraints + "D" + constraint;

        if (pathConstraint == null)
            pathConstraint = "";
    }


    
    public void addPathString (String path)
    {
        pathString = path;
    }
}
