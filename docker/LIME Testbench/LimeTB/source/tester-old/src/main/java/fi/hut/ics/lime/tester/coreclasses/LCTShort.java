package fi.hut.ics.lime.tester.coreclasses;

/*
 * Twin Short class for instrumentation
 *
 * This is a modified version of java.lang.Short from
 * openjdk-6-src-b16-24_apr_2009.
 * Most original comments have been stripped away, see original for them.
 * 
 * Modifications Copyright 2009 Helsinki University of Technology
 *
 * Original Sun License header follows:
 * Copyright 1996-2006 Sun Microsystems, Inc.  All Rights Reserved.
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

public final class LCTShort extends Number implements Comparable<LCTShort> {

    public static final short   MIN_VALUE = -32768;

    public static final short   MAX_VALUE = 32767;

  //  public static final Class<Short>    TYPE = (Class<Short>) Class.getPrimitiveClass("short");

    public static String toString(short s) {
        return LCTInteger.toString((int)s, 10);
    }


    public static short parseShort(String s, int radix)
        throws NumberFormatException {
        int i = LCTInteger.parseInt(s, radix);
        if (i < MIN_VALUE || i > MAX_VALUE)
            throw new NumberFormatException(
                "Value out of range. Value:\"" + s + "\" Radix:" + radix);
        return (short)i;
    }


    public static short parseShort(String s) throws NumberFormatException {
        return parseShort(s, 10);
    }


    public static LCTShort valueOf(String s, int radix)
        throws NumberFormatException {
        return new LCTShort(parseShort(s, radix));
    }


    public static LCTShort valueOf(String s) throws NumberFormatException {
        return valueOf(s, 10);
    }


    public static LCTShort valueOf(short s) {
        return new LCTShort(s);
    }


    public static LCTShort decode(String nm) throws NumberFormatException {
        int i = LCTInteger.decode(nm).intValue();
        if (i < MIN_VALUE || i > MAX_VALUE)
            throw new NumberFormatException(
                    "Value " + i + " out of range from input " + nm);

        return LCTShort.valueOf((short)i);
    }

    private final short value;


    public LCTShort(short value) {
        this.value = value;
    }


    public LCTShort(String s) throws NumberFormatException {
        this.value = parseShort(s, 10);
    }

    @Override
    public byte byteValue() {
        return (byte)value;
    }


    @Override
    public short shortValue() {
        return value;
    }


    public int intValue() {
        return (int)value;
    }


    public long longValue() {
        return (long)value;
    }


    public float floatValue() {
        return (float)value;
    }


    public double doubleValue() {
        return (double)value;
    }


    @Override
    public String toString() {
        return String.valueOf((int)value);
    }


    @Override
    public int hashCode() {
      //  return (int)value;
         return super.hashCode();
    }


    @Override
    public boolean equals(Object obj) {
        if (obj instanceof LCTShort) {
            return value == ((LCTShort)obj).shortValue();
        }
        return false;
    }


    public int compareTo(LCTShort anotherShort) {
        return this.value - anotherShort.value;
    }


    public static final int SIZE = 16;


    public static short reverseBytes(short i) {
        return (short) (((i & 0xFF00) >> 8) | (i << 8));
    }

    /** use serialVersionUID from JDK 1.1. for interoperability */
    private static final long serialVersionUID = 7515723908773894738L;
}
