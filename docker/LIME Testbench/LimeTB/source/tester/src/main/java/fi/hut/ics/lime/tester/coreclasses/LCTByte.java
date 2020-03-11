/*
 * Twin Byte class for instrumentation
 *
 * This is a modified version of java.lang.Byte from
 * openjdk-6-src-b16-24_apr_2009.
 * Most original comments have been stripped away, see original for them.
 * 
 * Modifications Copyright 2009 Helsinki University of Technology
 *
 * Original Sun License header follows:
 *
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

package fi.hut.ics.lime.tester.coreclasses;

public final class LCTByte extends Number implements Comparable<LCTByte> {
    public static final byte   MIN_VALUE = -128;
    public static final byte   MAX_VALUE = 127;

    public static String toString(byte b) {
        return Integer.toString((int)b, 10);
    }

    public static LCTByte valueOf(byte b) {
        final int offset = 128;
        return new LCTByte(b);
    }

    public static byte parseByte(String s, int radix)
        throws NumberFormatException {
        int i = Integer.parseInt(s, radix);
        if (i < MIN_VALUE || i > MAX_VALUE)
            throw new NumberFormatException(
                "Value out of range. Value:\"" + s + "\" Radix:" + radix);
        return (byte)i;
    }

    public static byte parseByte(String s) throws NumberFormatException {
        return parseByte(s, 10);
    }

    public static LCTByte valueOf(String s, int radix)
        throws NumberFormatException {
        return new LCTByte(parseByte(s, radix));
    }

    public static LCTByte valueOf(String s) throws NumberFormatException {
        return valueOf(s, 10);
    }

    public static LCTByte decode(String nm) throws NumberFormatException {
        int i = Integer.decode(nm);
        if (i < MIN_VALUE || i > MAX_VALUE)
            throw new NumberFormatException(
                    "Value " + i + " out of range from input " + nm);
        return new LCTByte((byte)i);
    }

    private final byte value;

    public LCTByte(byte value) {
        this.value = value;
    }

    public LCTByte(String s) throws NumberFormatException {
        this.value = parseByte(s, 10);
    }

    @Override
    public byte byteValue() {
        return value;
    }

    @Override
    public short shortValue() {
        return (short)value;
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

    // Modified to return the hashcode obtained from Object class
    @Override
    public int hashCode() {
      //  return (int)value;
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof LCTByte) {
            return value == ((LCTByte)obj).byteValue();
        }
        return false;
    }

    public int compareTo(LCTByte anotherByte) {
        return this.value - anotherByte.value;
    }

    public static final int SIZE = 8;

    private static final long serialVersionUID = -7183698231559129828L;
}
