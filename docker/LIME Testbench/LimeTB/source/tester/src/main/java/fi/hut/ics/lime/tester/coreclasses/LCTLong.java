/*
 * Twin Long class for instrumentation
 *
 * This is a modified version of java.lang.Long from
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

package fi.hut.ics.lime.tester.coreclasses;

public final class LCTLong extends Number implements Comparable<LCTLong> {

    public static final long MIN_VALUE = 0x8000000000000000L;

    
    public static final long MAX_VALUE = 0x7fffffffffffffffL;

 
    public static String toString(long i, int radix) {
        if (radix < Character.MIN_RADIX || radix > Character.MAX_RADIX)
            radix = 10;
        if (radix == 10)
            return toString(i);
        char[] buf = new char[65];
        int charPos = 64;
        boolean negative = (i < 0);

        if (!negative) {
            i = -i;
        }

        while (i <= -radix) {
            buf[charPos--] = LCTInteger.digits[(int)(-(i % radix))];
            i = i / radix;
        }
        buf[charPos] = LCTInteger.digits[(int)(-i)];

        if (negative) {
            buf[--charPos] = '-';
        }

        return new String(buf, charPos, (65 - charPos));
    }

 
    public static String toHexString(long i) {
        return toUnsignedString(i, 4);
    }

  
    public static String toOctalString(long i) {
        return toUnsignedString(i, 3);
    }

  
    public static String toBinaryString(long i) {
        return toUnsignedString(i, 1);
    }

    private static String toUnsignedString(long i, int shift) {
        char[] buf = new char[64];
        int charPos = 64;
        int radix = 1 << shift;
        long mask = radix - 1;
        do {
            buf[--charPos] = LCTInteger.digits[(int)(i & mask)];
            i >>>= shift;
        } while (i != 0);
        return new String(buf, charPos, (64 - charPos));
    }

  
    public static String toString(long i) {
        return Long.toString(i);
    }

   
    static void getChars(long i, int index, char[] buf) {
        long q;
        int r;
        int charPos = index;
        char sign = 0;

        if (i < 0) {
            sign = '-';
            i = -i;
        }

        // Get 2 digits/iteration using longs until quotient fits into an int
        while (i > Integer.MAX_VALUE) {
            q = i / 100;
            // really: r = i - (q * 100);
            r = (int)(i - ((q << 6) + (q << 5) + (q << 2)));
            i = q;
            buf[--charPos] = LCTInteger.DigitOnes[r];
            buf[--charPos] = LCTInteger.DigitTens[r];
        }

        // Get 2 digits/iteration using ints
        int q2;
        int i2 = (int)i;
        while (i2 >= 65536) {
            q2 = i2 / 100;
            // really: r = i2 - (q * 100);
            r = i2 - ((q2 << 6) + (q2 << 5) + (q2 << 2));
            i2 = q2;
            buf[--charPos] = LCTInteger.DigitOnes[r];
            buf[--charPos] = LCTInteger.DigitTens[r];
        }

        // Fall thru to fast mode for smaller numbers
        // assert(i2 <= 65536, i2);
        for (;;) {
            q2 = (i2 * 52429) >>> (16+3);
            r = i2 - ((q2 << 3) + (q2 << 1));  // r = i2-(q2*10) ...
            buf[--charPos] = LCTInteger.digits[r];
            i2 = q2;
            if (i2 == 0) break;
        }
        if (sign != 0) {
            buf[--charPos] = sign;
        }
    }

    // Requires positive x
    static int stringSize(long x) {
        long p = 10;
        for (int i=1; i<19; i++) {
            if (x < p)
                return i;
            p = 10*p;
        }
        return 19;
    }

 
    public static long parseLong(String s, int radix)
              throws NumberFormatException
    {
        return Long.parseLong(s, radix);
    }

  
    public static long parseLong(String s) throws NumberFormatException {
        return parseLong(s, 10);
    }

 
    public static LCTLong valueOf(String s, int radix) throws NumberFormatException {
        return new LCTLong(parseLong(s, radix));
    }

  
    public static LCTLong valueOf(String s) throws NumberFormatException
    {
        return new LCTLong(parseLong(s, 10));
    }

 
    public static LCTLong valueOf(long l) {
        return new LCTLong(l);
    }

   
    public static LCTLong decode(String nm) throws NumberFormatException {
        int radix = 10;
        int index = 0;
        boolean negative = false;
        LCTLong result;

        if (nm.length() == 0)
            throw new NumberFormatException("Zero length string");
        char firstChar = nm.charAt(0);
        // Handle sign, if present
        if (firstChar == '-') {
            negative = true;
            index++;
        }

        // Handle radix specifier, if present
        if (nm.startsWith("0x", index) || nm.startsWith("0X", index)) {
            index += 2;
            radix = 16;
        }
        else if (nm.startsWith("#", index)) {
            index ++;
            radix = 16;
        }
        else if (nm.startsWith("0", index) && nm.length() > 1 + index) {
            index ++;
            radix = 8;
        }

        if (nm.startsWith("-", index))
            throw new NumberFormatException("Sign character in wrong position");

        try {
            result = LCTLong.valueOf(nm.substring(index), radix);
            result = negative ? new LCTLong((long)-result.longValue()) : result;
        } catch (NumberFormatException e) {
            // If number is LCTLong.MIN_VALUE, we'll end up here. The next line
            // handles this case, and causes any genuine format error to be
            // rethrown.
            String constant = negative ? ("-" + nm.substring(index))
                                       : nm.substring(index);
            result = LCTLong.valueOf(constant, radix);
        }
        return result;
    }

    /**
     * The value of the {@code LCTLong}.
     *
     * @serial
     */
    private final long value;

    
    
    public LCTLong(long value) {
        this.value = value;
    }

  
    public LCTLong(String s) throws NumberFormatException {
        this.value = parseLong(s, 10);
    }

    /**
     * Returns the value of this {@code LCTLong} as a
     * {@code byte}.
     */
    public byte byteValue() {
        return (byte)value;
    }

    /**
     * Returns the value of this {@code LCTLong} as a
     * {@code short}.
     */
    public short shortValue() {
        return (short)value;
    }

    /**
     * Returns the value of this {@code LCTLong} as an
     * {@code int}.
     */
    public int intValue() {
        return (int)value;
    }

    /**
     * Returns the value of this {@code LCTLong} as a
     * {@code long} value.
     */
    public long longValue() {
        return (long)value;
    }

    /**
     * Returns the value of this {@code LCTLong} as a
     * {@code float}.
     */
    public float floatValue() {
        return (float)value;
    }

    /**
     * Returns the value of this {@code LCTLong} as a
     * {@code double}.
     */
    public double doubleValue() {
        return (double)value;
    }

    /**
     * Returns a {@code String} object representing this
     * {@code LCTLong}'s value.  The value is converted to signed
     * decimal representation and returned as a string, exactly as if
     * the {@code long} value were given as an argument to the
     * {@link java.lang.LCTLong#toString(long)} method.
     *
     * @return  a string representation of the value of this object in
     *          base&nbsp;10.
     */
    public String toString() {
        return String.valueOf(value);
    }

    /**
     * Returns a hash code for this {@code LCTLong}. The result is
     * the exclusive OR of the two halves of the primitive
     * {@code long} value held by this {@code LCTLong}
     * object. That is, the hashcode is the value of the expression:
     *
     * <blockquote>
     *  {@code (int)(this.longValue()^(this.longValue()>>>32))}
     * </blockquote>
     *
     * @return  a hash code value for this object.
     */
    public int hashCode() {
       // return (int)(value ^ (value >>> 32));
         return super.hashCode();
    }

    /**
     * Compares this object to the specified object.  The result is
     * {@code true} if and only if the argument is not
     * {@code null} and is a {@code LCTLong} object that
     * contains the same {@code long} value as this object.
     *
     * @param   obj   the object to compare with.
     * @return  {@code true} if the objects are the same;
     *          {@code false} otherwise.
     */
    public boolean equals(Object obj) {
        if (obj instanceof LCTLong) {
            return value == ((LCTLong)obj).longValue();
        }
        return false;
    }

    /**
     * Determines the {@code long} value of the system property
     * with the specified name.
     *
     * <p>The first argument is treated as the name of a system property.
     * System properties are accessible through the {@link
     * java.lang.System#getProperty(java.lang.String)} method. The
     * string value of this property is then interpreted as a
     * {@code long} value and a {@code LCTLong} object
     * representing this value is returned.  Details of possible
     * numeric formats can be found with the definition of
     * {@code getProperty}.
     *
     * <p>If there is no property with the specified name, if the
     * specified name is empty or {@code null}, or if the
     * property does not have the correct numeric format, then
     * {@code null} is returned.
     *
     * <p>In other words, this method returns a {@code LCTLong} object equal to
     * the value of:
     *
     * <blockquote>
     *  {@code getLong(nm, null)}
     * </blockquote>
     *
     * @param   nm   property name.
     * @return  the {@code LCTLong} value of the property.
     * @see     java.lang.System#getProperty(java.lang.String)
     * @see     java.lang.System#getProperty(java.lang.String, java.lang.String)
     */
    public static LCTLong getLong(String nm) {
        return getLong(nm, null);
    }

    /**
     * Determines the {@code long} value of the system property
     * with the specified name.
     *
     * <p>The first argument is treated as the name of a system property.
     * System properties are accessible through the {@link
     * java.lang.System#getProperty(java.lang.String)} method. The
     * string value of this property is then interpreted as a
     * {@code long} value and a {@code LCTLong} object
     * representing this value is returned.  Details of possible
     * numeric formats can be found with the definition of
     * {@code getProperty}.
     *
     * <p>The second argument is the default value. A {@code LCTLong} object
     * that represents the value of the second argument is returned if there
     * is no property of the specified name, if the property does not have
     * the correct numeric format, or if the specified name is empty or null.
     *
     * <p>In other words, this method returns a {@code LCTLong} object equal
     * to the value of:
     *
     * <blockquote>
     *  {@code getLong(nm, new LCTLong(val))}
     * </blockquote>
     *
     * but in practice it may be implemented in a manner such as:
     *
     * <blockquote><pre>
     * LCTLong result = getLong(nm, null);
     * return (result == null) ? new LCTLong(val) : result;
     * </pre></blockquote>
     *
     * to avoid the unnecessary allocation of a {@code LCTLong} object when
     * the default value is not needed.
     *
     * @param   nm    property name.
     * @param   val   default value.
     * @return  the {@code LCTLong} value of the property.
     * @see     java.lang.System#getProperty(java.lang.String)
     * @see     java.lang.System#getProperty(java.lang.String, java.lang.String)
     */
    public static LCTLong getLong(String nm, long val) {
        LCTLong result = LCTLong.getLong(nm, null);
        return (result == null) ? new LCTLong(val) : result;
    }

    /**
     * Returns the {@code long} value of the system property with
     * the specified name.  The first argument is treated as the name
     * of a system property.  System properties are accessible through
     * the {@link java.lang.System#getProperty(java.lang.String)}
     * method. The string value of this property is then interpreted
     * as a {@code long} value, as per the
     * {@code LCTLong.decode} method, and a {@code LCTLong} object
     * representing this value is returned.
     *
     * <ul>
     * <li>If the property value begins with the two ASCII characters
     * {@code 0x} or the ASCII character {@code #}, not followed by
     * a minus sign, then the rest of it is parsed as a hexadecimal integer
     * exactly as for the method {@link #valueOf(java.lang.String, int)}
     * with radix 16.
     * <li>If the property value begins with the ASCII character
     * {@code 0} followed by another character, it is parsed as
     * an octal integer exactly as by the method {@link
     * #valueOf(java.lang.String, int)} with radix 8.
     * <li>Otherwise the property value is parsed as a decimal
     * integer exactly as by the method
     * {@link #valueOf(java.lang.String, int)} with radix 10.
     * </ul>
     *
     * <p>Note that, in every case, neither {@code L}
     * (<code>'&#92;u004C'</code>) nor {@code l}
     * (<code>'&#92;u006C'</code>) is permitted to appear at the end
     * of the property value as a type indicator, as would be
     * permitted in Java programming language source code.
     *
     * <p>The second argument is the default value. The default value is
     * returned if there is no property of the specified name, if the
     * property does not have the correct numeric format, or if the
     * specified name is empty or {@code null}.
     *
     * @param   nm   property name.
     * @param   val   default value.
     * @return  the {@code LCTLong} value of the property.
     * @see     java.lang.System#getProperty(java.lang.String)
     * @see java.lang.System#getProperty(java.lang.String, java.lang.String)
     * @see java.lang.LCTLong#decode
     */
    public static LCTLong getLong(String nm, LCTLong val) {
        String v = null;
        try {
            v = System.getProperty(nm);
        } catch (IllegalArgumentException e) {
        } catch (NullPointerException e) {
        }
        if (v != null) {
            try {
                return LCTLong.decode(v);
            } catch (NumberFormatException e) {
            }
        }
        return val;
    }

   
    public int compareTo(LCTLong anotherLong) {
        long thisVal = this.value;
        long anotherVal = anotherLong.value;
        return (thisVal<anotherVal ? -1 : (thisVal==anotherVal ? 0 : 1));
    }


  
    public static final int SIZE = 64;

   
    public static long highestOneBit(long i) {
        // HD, Figure 3-1
        i |= (i >>  1);
        i |= (i >>  2);
        i |= (i >>  4);
        i |= (i >>  8);
        i |= (i >> 16);
        i |= (i >> 32);
        return i - (i >>> 1);
    }

 
    public static long lowestOneBit(long i) {
        // HD, Section 2-1
        return i & -i;
    }

  
    public static int numberOfLeadingZeros(long i) {
        // HD, Figure 5-6
         if (i == 0)
            return 64;
        int n = 1;
        int x = (int)(i >>> 32);
        if (x == 0) { n += 32; x = (int)i; }
        if (x >>> 16 == 0) { n += 16; x <<= 16; }
        if (x >>> 24 == 0) { n +=  8; x <<=  8; }
        if (x >>> 28 == 0) { n +=  4; x <<=  4; }
        if (x >>> 30 == 0) { n +=  2; x <<=  2; }
        n -= x >>> 31;
        return n;
    }

   
    public static int numberOfTrailingZeros(long i) {
        // HD, Figure 5-14
        int x, y;
        if (i == 0) return 64;
        int n = 63;
        y = (int)i; if (y != 0) { n = n -32; x = y; } else x = (int)(i>>>32);
        y = x <<16; if (y != 0) { n = n -16; x = y; }
        y = x << 8; if (y != 0) { n = n - 8; x = y; }
        y = x << 4; if (y != 0) { n = n - 4; x = y; }
        y = x << 2; if (y != 0) { n = n - 2; x = y; }
        return n - ((x << 1) >>> 31);
    }

    
     public static int bitCount(long i) {
        // HD, Figure 5-14
        i = i - ((i >>> 1) & 0x5555555555555555L);
        i = (i & 0x3333333333333333L) + ((i >>> 2) & 0x3333333333333333L);
        i = (i + (i >>> 4)) & 0x0f0f0f0f0f0f0f0fL;
        i = i + (i >>> 8);
        i = i + (i >>> 16);
        i = i + (i >>> 32);
        return (int)i & 0x7f;
     }

  
    public static long rotateLeft(long i, int distance) {
        return (i << distance) | (i >>> -distance);
    }

   
    public static long rotateRight(long i, int distance) {
        return (i >>> distance) | (i << -distance);
    }

   
    public static long reverse(long i) {
        // HD, Figure 7-1
        i = (i & 0x5555555555555555L) << 1 | (i >>> 1) & 0x5555555555555555L;
        i = (i & 0x3333333333333333L) << 2 | (i >>> 2) & 0x3333333333333333L;
        i = (i & 0x0f0f0f0f0f0f0f0fL) << 4 | (i >>> 4) & 0x0f0f0f0f0f0f0f0fL;
        i = (i & 0x00ff00ff00ff00ffL) << 8 | (i >>> 8) & 0x00ff00ff00ff00ffL;
        i = (i << 48) | ((i & 0xffff0000L) << 16) |
            ((i >>> 16) & 0xffff0000L) | (i >>> 48);
        return i;
    }

   
    public static int signum(long i) {
        // HD, Section 2-7
        return (int) ((i >> 63) | (-i >>> 63));
    }

   
    public static long reverseBytes(long i) {
        i = (i & 0x00ff00ff00ff00ffL) << 8 | (i >>> 8) & 0x00ff00ff00ff00ffL;
        return (i << 48) | ((i & 0xffff0000L) << 16) |
            ((i >>> 16) & 0xffff0000L) | (i >>> 48);
    }

    /** use serialVersionUID from JDK 1.0.2 for interoperability */
    private static final long serialVersionUID = 4290774380558885855L;
}
