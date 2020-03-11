/*
Copyright (c) 2010 Helsinki University of Technology (TKK)

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

package fi.hut.ics.lime.tester.threading;

import java.lang.ref.WeakReference;

/**
 * Represents the identity of an object used for locking.
 * 
 * @author osaariki
 */
// Declared final because the equals implementation doesn't support subclasses.
public final class LockObject extends CommunicationObject
{
    private WeakReference<Object> objectReference;
    private int                   objectHash;

    /**
     * Constructs a new instance of {@link LockObject} with the specified lock object.
     * 
     * @param object
     */
    public LockObject(Object object)
    {
        objectReference = new WeakReference<Object>(object);
        objectHash = System.identityHashCode(object);
    }

    @Override
    public boolean equals(Object obj)
    {
        if (this == obj)
            return true;
        if (!(LockObject.class.equals(obj.getClass())))
            return false;
        LockObject other = (LockObject) obj;
        Object myObject = objectReference.get();
        Object otherObject = other.objectReference.get();
        return (myObject != null) && (otherObject != null) && (myObject == otherObject);
    }

    @Override
    public int hashCode()
    {
        return objectHash;
    }
}
