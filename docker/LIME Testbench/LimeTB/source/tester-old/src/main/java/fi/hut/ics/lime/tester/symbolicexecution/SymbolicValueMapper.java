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

package fi.hut.ics.lime.tester.symbolicexecution;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.TreeMap;

public class SymbolicValueMapper {
    protected static HashMap<Wrapper, TreeMap<String, String>> fieldMap  = new HashMap<Wrapper, TreeMap<String, String>>();
    protected static HashMap<Wrapper, TreeMap<Integer, String>> arrayMap = new HashMap<Wrapper, TreeMap<Integer, String>>();
    protected static TreeMap<String, String> staticFieldMap                 = new TreeMap<String, String>();

    // TODO: These wrappers are a bit ugly, as they never get removed. Either implement a full WeakIdentityHashMap,
    //       or add a periodic cleanup of the maps.
    private static class Wrapper {
        private WeakReference<Object> objectReference;
        private int objectHash;

        public Wrapper(Object object) {
            objectReference = new WeakReference<Object>(object);
            objectHash = System.identityHashCode(object);
        }

        public Object get() {
            return objectReference.get();
        }

        @Override
        public boolean equals(Object obj)
        {
            if (this == obj)
                return true;
            if (!(Wrapper.class.equals(obj.getClass())))
                return false;
            Wrapper other = (Wrapper) obj;
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
// TODO: rename these methods to something more sensible
    
    public static void addFieldMapping (Object o, String fieldName, String value) {
        Wrapper wrapper = new Wrapper(o);
        TreeMap<String, String> entry = fieldMap.get(wrapper);

        if (entry == null) {
            entry = new TreeMap<String, String>();

            entry.put(fieldName, value);
            fieldMap.put(wrapper, entry);
        }
        else {
            entry.put(fieldName, value);
        }
    }


    public static String getFieldMapping (Object o, String fieldName) {
        Wrapper wrapper = new Wrapper(o);
        TreeMap<String, String> entry = fieldMap.get(wrapper);

        if (entry == null)
            return null;

        return entry.get(fieldName);
    }


    public static void addStaticFieldMapping (String field, String value) {
        if (field != null)
            staticFieldMap.put(field, value);
    }

    public static String getStaticFieldMapping (String field) {
        return staticFieldMap.get(field);
    }


   public static void addArrayElementMapping (Object o, int index, String value) {
        Wrapper wrapper = new Wrapper(o);
        TreeMap<Integer, String> entry = arrayMap.get(wrapper);

        if (entry == null) {
            entry = new TreeMap<Integer, String>();

            entry.put(index, value);
            arrayMap.put(wrapper, entry);
        }
        else {
            entry.put(index, value);
        }
    }


    public static String getArrayElementMapping (Object o, int index) {
        Wrapper wrapper = new Wrapper(o);
        TreeMap<Integer, String> entry = arrayMap.get(wrapper);

        if (entry == null)
            return null;

        return entry.get(index);
    }
}
