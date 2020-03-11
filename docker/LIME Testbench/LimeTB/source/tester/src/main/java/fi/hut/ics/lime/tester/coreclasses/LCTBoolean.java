/*
 * Twin Boolean class for instrumentation
 *
 * This is a modified version of java.lang.Boolean from
 * openjdk-6-src-b16-24_apr_2009.
 * Most original comments have been stripped away, see original for them.
 * 
 * Modifications Copyright 2009 Helsinki University of Technology
 *
 * Original Sun License header follows:
 *
 * Copyright 1994-2006 Sun Microsystems, Inc.  All Rights Reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Sun designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Sun in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
 * CA 95054 USA or visit www.sun.com if you need additional information or
 * have any questions.
 */

package fi.hut.ics.lime.tester.coreclasses;

public final class LCTBoolean implements java.io.Serializable,
                                      Comparable<LCTBoolean>
{
   // public static final LCTBoolean TRUE = new LCTBoolean(true);
  //  public static final LCTBoolean FALSE = new LCTBoolean(false);
    private final boolean value;
    private static final long serialVersionUID = -3665804199014368530L;

    public LCTBoolean(boolean value) {
        this.value = value;
    }

    public LCTBoolean(String s) {
        this(toBoolean(s));
    }

    public static boolean parseBoolean(String s) {
        return toBoolean(s);
    }

    public boolean booleanValue() {
        return value;
    }

    public static LCTBoolean valueOf (boolean b) {
       // return (b ? TRUE : FALSE);
       return new LCTBoolean(b);
    }

    public static LCTBoolean valueOf (String s) {
      //  return toBoolean(s) ? TRUE : FALSE;
        if (toBoolean(s))
            return new LCTBoolean(true);
        else
            return new LCTBoolean(false);
    }

    public static String toString(boolean b) {
        return b ? "true" : "false";
    }

    @Override
    public String toString() {
        return value ? "true" : "false";
    }

    // Modified to return the hashcode obtained from Object class
    @Override
    public int hashCode() {
      //  return value ? 1231 : 1237;
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof LCTBoolean) {
            return value == ((LCTBoolean)obj).booleanValue();
        }
        return false;
    }

    public static boolean getBoolean(String name) {
        boolean result = false;
        try {
            result = toBoolean(System.getProperty(name));
        } catch (IllegalArgumentException e) {
        } catch (NullPointerException e) {
        }
        return result;
    }

    public int compareTo(LCTBoolean b) {
        return (b.value == value ? 0 : (value ? 1 : -1));
    }

    private static boolean toBoolean(String name) {
        return ((name != null) && name.equalsIgnoreCase("true"));
    }
}
