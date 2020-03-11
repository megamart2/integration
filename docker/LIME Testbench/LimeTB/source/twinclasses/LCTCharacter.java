/*
 * Twin Character class for instrumentation
 *
 * This is a modified version of java.lang.Character from
 * openjdk-6-src-b16-24_apr_2009.
 * Most original comments have been stripped away, see original for them.
 * 
 * Modifications Copyright 2009 Helsinki University of Technology
 *
 * Original Sun License header follows:
 *
 * Copyright 2002-2006 Sun Microsystems, Inc.  All Rights Reserved.
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

package java.lang;
import java.util.Map;
import java.util.HashMap;
import java.util.Locale;

public final
class Character extends Object implements java.io.Serializable, Comparable<Character> {
    public static final int MIN_RADIX = 2;
    public static final int MAX_RADIX = 36;
    public static final char   MIN_VALUE = '\u0000';
    public static final char   MAX_VALUE = '\uffff';
    public static final Class<Character> TYPE = Class.getPrimitiveClass("char");
    public static final byte
        UNASSIGNED                  = 0;
    public static final byte
        UPPERCASE_LETTER            = 1;
    public static final byte
        LOWERCASE_LETTER            = 2;
    public static final byte
        TITLECASE_LETTER            = 3;
    public static final byte
        MODIFIER_LETTER             = 4;
    public static final byte
        OTHER_LETTER                = 5;
    public static final byte
        NON_SPACING_MARK            = 6;
    public static final byte
        ENCLOSING_MARK              = 7;
    public static final byte
        COMBINING_SPACING_MARK      = 8;
    public static final byte
        DECIMAL_DIGIT_NUMBER        = 9;
    public static final byte
        LETTER_NUMBER               = 10;
    public static final byte
        OTHER_NUMBER                = 11;
    public static final byte
        SPACE_SEPARATOR             = 12;
    public static final byte
        LINE_SEPARATOR              = 13;
    public static final byte
        PARAGRAPH_SEPARATOR         = 14;
    public static final byte
        CONTROL                     = 15;
    public static final byte
        FORMAT                      = 16;
    public static final byte
        PRIVATE_USE                 = 18;
    public static final byte
        SURROGATE                   = 19;
    public static final byte
        DASH_PUNCTUATION            = 20;
    public static final byte
        START_PUNCTUATION           = 21;
    public static final byte
        END_PUNCTUATION             = 22;
    public static final byte
        CONNECTOR_PUNCTUATION       = 23;
    public static final byte
        OTHER_PUNCTUATION           = 24;
    public static final byte
        MATH_SYMBOL                 = 25;
    public static final byte
        CURRENCY_SYMBOL             = 26;
    public static final byte
        MODIFIER_SYMBOL             = 27;
    public static final byte
        OTHER_SYMBOL                = 28;
    public static final byte
        INITIAL_QUOTE_PUNCTUATION   = 29;
    public static final byte
        FINAL_QUOTE_PUNCTUATION     = 30;
    static final int ERROR = 0xFFFFFFFF;
    public static final byte DIRECTIONALITY_UNDEFINED = -1;
    public static final byte DIRECTIONALITY_LEFT_TO_RIGHT = 0;
    public static final byte DIRECTIONALITY_RIGHT_TO_LEFT = 1;
    public static final byte DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC = 2;
    public static final byte DIRECTIONALITY_EUROPEAN_NUMBER = 3;
    public static final byte DIRECTIONALITY_EUROPEAN_NUMBER_SEPARATOR = 4;
    public static final byte DIRECTIONALITY_EUROPEAN_NUMBER_TERMINATOR = 5;
    public static final byte DIRECTIONALITY_ARABIC_NUMBER = 6;
    public static final byte DIRECTIONALITY_COMMON_NUMBER_SEPARATOR = 7;
    public static final byte DIRECTIONALITY_NONSPACING_MARK = 8;
    public static final byte DIRECTIONALITY_BOUNDARY_NEUTRAL = 9;
    public static final byte DIRECTIONALITY_PARAGRAPH_SEPARATOR = 10;
    public static final byte DIRECTIONALITY_SEGMENT_SEPARATOR = 11;
    public static final byte DIRECTIONALITY_WHITESPACE = 12;
    public static final byte DIRECTIONALITY_OTHER_NEUTRALS = 13;
    public static final byte DIRECTIONALITY_LEFT_TO_RIGHT_EMBEDDING = 14;
    public static final byte DIRECTIONALITY_LEFT_TO_RIGHT_OVERRIDE = 15;
    public static final byte DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING = 16;
    public static final byte DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE = 17;
    public static final byte DIRECTIONALITY_POP_DIRECTIONAL_FORMAT = 18;
    public static final char MIN_HIGH_SURROGATE = '\uD800';
    public static final char MAX_HIGH_SURROGATE = '\uDBFF';
    public static final char MIN_LOW_SURROGATE  = '\uDC00';
    public static final char MAX_LOW_SURROGATE  = '\uDFFF';
    public static final char MIN_SURROGATE = MIN_HIGH_SURROGATE;
    public static final char MAX_SURROGATE = MAX_LOW_SURROGATE;
    public static final int MIN_SUPPLEMENTARY_CODE_POINT = 0x010000;
    public static final int MIN_CODE_POINT = 0x000000;
    public static final int MAX_CODE_POINT = 0x10ffff;

    public static class Subset  {
        private String name;

        protected Subset(String name) {
            if (name == null) {
                throw new NullPointerException("name");
            }
            this.name = name;
        }

        public final boolean equals(Object obj) {
            return (this == obj);
        }

        public final int hashCode() {
            return super.hashCode();
        }

        public final String toString() {
            return name;
        }
    }

    public static final class UnicodeBlock extends Subset {
        private static Map map = new HashMap();

        private UnicodeBlock(String idName) {
            super(idName);
            map.put(idName.toUpperCase(Locale.US), this);
        }

        private UnicodeBlock(String idName, String alias) {
            this(idName);
            map.put(alias.toUpperCase(Locale.US), this);
        }

        private UnicodeBlock(String idName, String[] aliasName) {
            this(idName);
            if (aliasName != null) {
                for(int x=0; x<aliasName.length; ++x) {
                    map.put(aliasName[x].toUpperCase(Locale.US), this);
                }
            }
        }

        public static final UnicodeBlock  BASIC_LATIN =
            new UnicodeBlock("BASIC_LATIN", new String[] {"Basic Latin", "BasicLatin" });
        public static final UnicodeBlock LATIN_1_SUPPLEMENT =
            new UnicodeBlock("LATIN_1_SUPPLEMENT", new String[]{ "Latin-1 Supplement", "Latin-1Supplement"});
        public static final UnicodeBlock LATIN_EXTENDED_A =
            new UnicodeBlock("LATIN_EXTENDED_A", new String[]{ "Latin Extended-A", "LatinExtended-A"});
        public static final UnicodeBlock LATIN_EXTENDED_B =
            new UnicodeBlock("LATIN_EXTENDED_B", new String[] {"Latin Extended-B", "LatinExtended-B"});
        public static final UnicodeBlock IPA_EXTENSIONS =
            new UnicodeBlock("IPA_EXTENSIONS", new String[] {"IPA Extensions", "IPAExtensions"});
        public static final UnicodeBlock SPACING_MODIFIER_LETTERS =
            new UnicodeBlock("SPACING_MODIFIER_LETTERS", new String[] { "Spacing Modifier Letters",
                                                                        "SpacingModifierLetters"});
        public static final UnicodeBlock COMBINING_DIACRITICAL_MARKS =
            new UnicodeBlock("COMBINING_DIACRITICAL_MARKS", new String[] {"Combining Diacritical Marks",
                                                                          "CombiningDiacriticalMarks" });
        public static final UnicodeBlock GREEK
            = new UnicodeBlock("GREEK", new String[] {"Greek and Coptic", "GreekandCoptic"});
        public static final UnicodeBlock CYRILLIC =
            new UnicodeBlock("CYRILLIC");
        public static final UnicodeBlock ARMENIAN =
            new UnicodeBlock("ARMENIAN");
        public static final UnicodeBlock HEBREW =
            new UnicodeBlock("HEBREW");
        public static final UnicodeBlock ARABIC =
            new UnicodeBlock("ARABIC");
        public static final UnicodeBlock DEVANAGARI =
            new UnicodeBlock("DEVANAGARI");
        public static final UnicodeBlock BENGALI =
            new UnicodeBlock("BENGALI");
        public static final UnicodeBlock GURMUKHI =
            new UnicodeBlock("GURMUKHI");
        public static final UnicodeBlock GUJARATI =
            new UnicodeBlock("GUJARATI");
        public static final UnicodeBlock ORIYA =
            new UnicodeBlock("ORIYA");
        public static final UnicodeBlock TAMIL =
            new UnicodeBlock("TAMIL");
        public static final UnicodeBlock TELUGU =
            new UnicodeBlock("TELUGU");
        public static final UnicodeBlock KANNADA =
            new UnicodeBlock("KANNADA");
        public static final UnicodeBlock MALAYALAM =
            new UnicodeBlock("MALAYALAM");
        public static final UnicodeBlock THAI =
            new UnicodeBlock("THAI");
        public static final UnicodeBlock LAO =
            new UnicodeBlock("LAO");
        public static final UnicodeBlock TIBETAN =
            new UnicodeBlock("TIBETAN");
        public static final UnicodeBlock GEORGIAN =
            new UnicodeBlock("GEORGIAN");
        public static final UnicodeBlock HANGUL_JAMO =
            new UnicodeBlock("HANGUL_JAMO", new String[] {"Hangul Jamo", "HangulJamo"});
        public static final UnicodeBlock LATIN_EXTENDED_ADDITIONAL =
            new UnicodeBlock("LATIN_EXTENDED_ADDITIONAL", new String[] {"Latin Extended Additional",
                                                                        "LatinExtendedAdditional"});
        public static final UnicodeBlock GREEK_EXTENDED =
            new UnicodeBlock("GREEK_EXTENDED", new String[] {"Greek Extended", "GreekExtended"});
        public static final UnicodeBlock GENERAL_PUNCTUATION =
            new UnicodeBlock("GENERAL_PUNCTUATION", new String[] {"General Punctuation", "GeneralPunctuation"});
        public static final UnicodeBlock SUPERSCRIPTS_AND_SUBSCRIPTS =
            new UnicodeBlock("SUPERSCRIPTS_AND_SUBSCRIPTS", new String[] {"Superscripts and Subscripts",
                                                                          "SuperscriptsandSubscripts" });
        public static final UnicodeBlock CURRENCY_SYMBOLS =
            new UnicodeBlock("CURRENCY_SYMBOLS", new String[] { "Currency Symbols", "CurrencySymbols"});
        public static final UnicodeBlock COMBINING_MARKS_FOR_SYMBOLS =
            new UnicodeBlock("COMBINING_MARKS_FOR_SYMBOLS", new String[] {"Combining Diacritical Marks for Symbols",
									  "CombiningDiacriticalMarksforSymbols",
                                                                          "Combining Marks for Symbols",
                                                                          "CombiningMarksforSymbols" });
        public static final UnicodeBlock LETTERLIKE_SYMBOLS =
            new UnicodeBlock("LETTERLIKE_SYMBOLS", new String[] { "Letterlike Symbols", "LetterlikeSymbols"});
        public static final UnicodeBlock NUMBER_FORMS =
            new UnicodeBlock("NUMBER_FORMS", new String[] {"Number Forms", "NumberForms"});
        public static final UnicodeBlock ARROWS =
            new UnicodeBlock("ARROWS");
        public static final UnicodeBlock MATHEMATICAL_OPERATORS =
            new UnicodeBlock("MATHEMATICAL_OPERATORS", new String[] {"Mathematical Operators",
                                                                     "MathematicalOperators"});
        public static final UnicodeBlock MISCELLANEOUS_TECHNICAL =
            new UnicodeBlock("MISCELLANEOUS_TECHNICAL", new String[] {"Miscellaneous Technical",
                                                                      "MiscellaneousTechnical"});
        public static final UnicodeBlock CONTROL_PICTURES =
            new UnicodeBlock("CONTROL_PICTURES", new String[] {"Control Pictures", "ControlPictures"});
        public static final UnicodeBlock OPTICAL_CHARACTER_RECOGNITION =
            new UnicodeBlock("OPTICAL_CHARACTER_RECOGNITION", new String[] {"Optical Character Recognition",
                                                                            "OpticalCharacterRecognition"});
        public static final UnicodeBlock ENCLOSED_ALPHANUMERICS =
            new UnicodeBlock("ENCLOSED_ALPHANUMERICS", new String[] {"Enclosed Alphanumerics",
                                                                     "EnclosedAlphanumerics"});
        public static final UnicodeBlock BOX_DRAWING =
            new UnicodeBlock("BOX_DRAWING", new String[] {"Box Drawing", "BoxDrawing"});
        public static final UnicodeBlock BLOCK_ELEMENTS =
            new UnicodeBlock("BLOCK_ELEMENTS", new String[] {"Block Elements", "BlockElements"});
        public static final UnicodeBlock GEOMETRIC_SHAPES =
            new UnicodeBlock("GEOMETRIC_SHAPES", new String[] {"Geometric Shapes", "GeometricShapes"});
        public static final UnicodeBlock MISCELLANEOUS_SYMBOLS =
            new UnicodeBlock("MISCELLANEOUS_SYMBOLS", new String[] {"Miscellaneous Symbols",
                                                                    "MiscellaneousSymbols"});
        public static final UnicodeBlock DINGBATS =
            new UnicodeBlock("DINGBATS");
        public static final UnicodeBlock CJK_SYMBOLS_AND_PUNCTUATION =
            new UnicodeBlock("CJK_SYMBOLS_AND_PUNCTUATION", new String[] {"CJK Symbols and Punctuation",
                                                                          "CJKSymbolsandPunctuation"});
        public static final UnicodeBlock HIRAGANA =
            new UnicodeBlock("HIRAGANA");
        public static final UnicodeBlock KATAKANA =
            new UnicodeBlock("KATAKANA");
        public static final UnicodeBlock BOPOMOFO =
            new UnicodeBlock("BOPOMOFO");
        public static final UnicodeBlock HANGUL_COMPATIBILITY_JAMO =
            new UnicodeBlock("HANGUL_COMPATIBILITY_JAMO", new String[] {"Hangul Compatibility Jamo",
                                                                        "HangulCompatibilityJamo"});
        public static final UnicodeBlock KANBUN =
            new UnicodeBlock("KANBUN");
        public static final UnicodeBlock ENCLOSED_CJK_LETTERS_AND_MONTHS =
            new UnicodeBlock("ENCLOSED_CJK_LETTERS_AND_MONTHS", new String[] {"Enclosed CJK Letters and Months",
                                                                              "EnclosedCJKLettersandMonths"});
        public static final UnicodeBlock CJK_COMPATIBILITY =
            new UnicodeBlock("CJK_COMPATIBILITY", new String[] {"CJK Compatibility", "CJKCompatibility"});
        public static final UnicodeBlock CJK_UNIFIED_IDEOGRAPHS =
            new UnicodeBlock("CJK_UNIFIED_IDEOGRAPHS", new String[] {"CJK Unified Ideographs",
                                                                     "CJKUnifiedIdeographs"});
        public static final UnicodeBlock HANGUL_SYLLABLES =
            new UnicodeBlock("HANGUL_SYLLABLES", new String[] {"Hangul Syllables", "HangulSyllables"});
        public static final UnicodeBlock PRIVATE_USE_AREA =
            new UnicodeBlock("PRIVATE_USE_AREA", new String[] {"Private Use Area", "PrivateUseArea"});
        public static final UnicodeBlock CJK_COMPATIBILITY_IDEOGRAPHS =
            new UnicodeBlock("CJK_COMPATIBILITY_IDEOGRAPHS",
                             new String[] {"CJK Compatibility Ideographs",
                                           "CJKCompatibilityIdeographs"});
        public static final UnicodeBlock ALPHABETIC_PRESENTATION_FORMS =
            new UnicodeBlock("ALPHABETIC_PRESENTATION_FORMS", new String[] {"Alphabetic Presentation Forms",
                                                                            "AlphabeticPresentationForms"});
        public static final UnicodeBlock ARABIC_PRESENTATION_FORMS_A =
            new UnicodeBlock("ARABIC_PRESENTATION_FORMS_A", new String[] {"Arabic Presentation Forms-A",
                                                                          "ArabicPresentationForms-A"});
        public static final UnicodeBlock COMBINING_HALF_MARKS =
            new UnicodeBlock("COMBINING_HALF_MARKS", new String[] {"Combining Half Marks",
                                                                   "CombiningHalfMarks"});
        public static final UnicodeBlock CJK_COMPATIBILITY_FORMS =
            new UnicodeBlock("CJK_COMPATIBILITY_FORMS", new String[] {"CJK Compatibility Forms",
                                                                      "CJKCompatibilityForms"});
        public static final UnicodeBlock SMALL_FORM_VARIANTS =
            new UnicodeBlock("SMALL_FORM_VARIANTS", new String[] {"Small Form Variants",
                                                                  "SmallFormVariants"});
        public static final UnicodeBlock ARABIC_PRESENTATION_FORMS_B =
            new UnicodeBlock("ARABIC_PRESENTATION_FORMS_B", new String[] {"Arabic Presentation Forms-B",
                                                                          "ArabicPresentationForms-B"});
        public static final UnicodeBlock HALFWIDTH_AND_FULLWIDTH_FORMS =
            new UnicodeBlock("HALFWIDTH_AND_FULLWIDTH_FORMS",
                             new String[] {"Halfwidth and Fullwidth Forms",
                                           "HalfwidthandFullwidthForms"});
        public static final UnicodeBlock SPECIALS =
            new UnicodeBlock("SPECIALS");
        @Deprecated
        public static final UnicodeBlock SURROGATES_AREA =
            new UnicodeBlock("SURROGATES_AREA");
        public static final UnicodeBlock SYRIAC =
            new UnicodeBlock("SYRIAC");
        public static final UnicodeBlock THAANA =
            new UnicodeBlock("THAANA");
        public static final UnicodeBlock SINHALA =
            new UnicodeBlock("SINHALA");
        public static final UnicodeBlock MYANMAR =
            new UnicodeBlock("MYANMAR");
        public static final UnicodeBlock ETHIOPIC =
            new UnicodeBlock("ETHIOPIC");
        public static final UnicodeBlock CHEROKEE =
            new UnicodeBlock("CHEROKEE");
        public static final UnicodeBlock UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS =
            new UnicodeBlock("UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS",
                             new String[] {"Unified Canadian Aboriginal Syllabics",
                                           "UnifiedCanadianAboriginalSyllabics"});
        public static final UnicodeBlock OGHAM =
                             new UnicodeBlock("OGHAM");
        public static final UnicodeBlock RUNIC =
                             new UnicodeBlock("RUNIC");
        public static final UnicodeBlock KHMER =
                             new UnicodeBlock("KHMER");
        public static final UnicodeBlock MONGOLIAN =
                             new UnicodeBlock("MONGOLIAN");
        public static final UnicodeBlock BRAILLE_PATTERNS =
            new UnicodeBlock("BRAILLE_PATTERNS", new String[] {"Braille Patterns",
                                                               "BraillePatterns"});
        public static final UnicodeBlock CJK_RADICALS_SUPPLEMENT =
             new UnicodeBlock("CJK_RADICALS_SUPPLEMENT", new String[] {"CJK Radicals Supplement",
                                                                       "CJKRadicalsSupplement"});
        public static final UnicodeBlock KANGXI_RADICALS =
            new UnicodeBlock("KANGXI_RADICALS", new String[] {"Kangxi Radicals", "KangxiRadicals"});
        public static final UnicodeBlock IDEOGRAPHIC_DESCRIPTION_CHARACTERS =
            new UnicodeBlock("IDEOGRAPHIC_DESCRIPTION_CHARACTERS", new String[] {"Ideographic Description Characters",
                                                                                 "IdeographicDescriptionCharacters"});
        public static final UnicodeBlock BOPOMOFO_EXTENDED =
            new UnicodeBlock("BOPOMOFO_EXTENDED", new String[] {"Bopomofo Extended",
                                                                "BopomofoExtended"});
        public static final UnicodeBlock CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A =
            new UnicodeBlock("CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A", new String[] {"CJK Unified Ideographs Extension A",
                                                                                 "CJKUnifiedIdeographsExtensionA"});
        public static final UnicodeBlock YI_SYLLABLES =
            new UnicodeBlock("YI_SYLLABLES", new String[] {"Yi Syllables", "YiSyllables"});
        public static final UnicodeBlock YI_RADICALS =
            new UnicodeBlock("YI_RADICALS", new String[] {"Yi Radicals", "YiRadicals"});
        public static final UnicodeBlock CYRILLIC_SUPPLEMENTARY =
            new UnicodeBlock("CYRILLIC_SUPPLEMENTARY", new String[] {"Cyrillic Supplementary",
                                                                     "CyrillicSupplementary"});
        public static final UnicodeBlock TAGALOG =
            new UnicodeBlock("TAGALOG");
        public static final UnicodeBlock HANUNOO =
            new UnicodeBlock("HANUNOO");
        public static final UnicodeBlock BUHID =
            new UnicodeBlock("BUHID");
        public static final UnicodeBlock TAGBANWA =
            new UnicodeBlock("TAGBANWA");
        public static final UnicodeBlock LIMBU =
            new UnicodeBlock("LIMBU");
        public static final UnicodeBlock TAI_LE =
            new UnicodeBlock("TAI_LE", new String[] {"Tai Le", "TaiLe"});
        public static final UnicodeBlock KHMER_SYMBOLS =
            new UnicodeBlock("KHMER_SYMBOLS", new String[] {"Khmer Symbols", "KhmerSymbols"});
        public static final UnicodeBlock PHONETIC_EXTENSIONS =
            new UnicodeBlock("PHONETIC_EXTENSIONS", new String[] {"Phonetic Extensions", "PhoneticExtensions"});
        public static final UnicodeBlock MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A =
            new UnicodeBlock("MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A",
                             new String[]{"Miscellaneous Mathematical Symbols-A",
                                          "MiscellaneousMathematicalSymbols-A"});
        public static final UnicodeBlock SUPPLEMENTAL_ARROWS_A =
            new UnicodeBlock("SUPPLEMENTAL_ARROWS_A", new String[] {"Supplemental Arrows-A",
                                                                    "SupplementalArrows-A"});
        public static final UnicodeBlock SUPPLEMENTAL_ARROWS_B =
            new UnicodeBlock("SUPPLEMENTAL_ARROWS_B", new String[] {"Supplemental Arrows-B",
                                                                    "SupplementalArrows-B"});
        public static final UnicodeBlock MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B
                = new UnicodeBlock("MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B",
                                   new String[] {"Miscellaneous Mathematical Symbols-B",
                                                 "MiscellaneousMathematicalSymbols-B"});
        public static final UnicodeBlock SUPPLEMENTAL_MATHEMATICAL_OPERATORS =
            new UnicodeBlock("SUPPLEMENTAL_MATHEMATICAL_OPERATORS",
                             new String[]{"Supplemental Mathematical Operators",
                                          "SupplementalMathematicalOperators"} );
        public static final UnicodeBlock MISCELLANEOUS_SYMBOLS_AND_ARROWS =
            new UnicodeBlock("MISCELLANEOUS_SYMBOLS_AND_ARROWS", new String[] {"Miscellaneous Symbols and Arrows",
                                                                               "MiscellaneousSymbolsandArrows"});
        public static final UnicodeBlock KATAKANA_PHONETIC_EXTENSIONS =
            new UnicodeBlock("KATAKANA_PHONETIC_EXTENSIONS", new String[] {"Katakana Phonetic Extensions",
                                                                           "KatakanaPhoneticExtensions"});
        public static final UnicodeBlock YIJING_HEXAGRAM_SYMBOLS =
            new UnicodeBlock("YIJING_HEXAGRAM_SYMBOLS", new String[] {"Yijing Hexagram Symbols",
                                                                      "YijingHexagramSymbols"});
        public static final UnicodeBlock VARIATION_SELECTORS =
            new UnicodeBlock("VARIATION_SELECTORS", new String[] {"Variation Selectors", "VariationSelectors"});
        public static final UnicodeBlock LINEAR_B_SYLLABARY =
            new UnicodeBlock("LINEAR_B_SYLLABARY", new String[] {"Linear B Syllabary", "LinearBSyllabary"});
        public static final UnicodeBlock LINEAR_B_IDEOGRAMS =
            new UnicodeBlock("LINEAR_B_IDEOGRAMS", new String[] {"Linear B Ideograms", "LinearBIdeograms"});
        public static final UnicodeBlock AEGEAN_NUMBERS =
            new UnicodeBlock("AEGEAN_NUMBERS", new String[] {"Aegean Numbers", "AegeanNumbers"});
        public static final UnicodeBlock OLD_ITALIC =
            new UnicodeBlock("OLD_ITALIC", new String[] {"Old Italic", "OldItalic"});
        public static final UnicodeBlock GOTHIC = new UnicodeBlock("GOTHIC");
        public static final UnicodeBlock UGARITIC = new UnicodeBlock("UGARITIC");
        public static final UnicodeBlock DESERET = new UnicodeBlock("DESERET");
        public static final UnicodeBlock SHAVIAN = new UnicodeBlock("SHAVIAN");
        public static final UnicodeBlock OSMANYA = new UnicodeBlock("OSMANYA");
        public static final UnicodeBlock CYPRIOT_SYLLABARY =
            new UnicodeBlock("CYPRIOT_SYLLABARY", new String[] {"Cypriot Syllabary", "CypriotSyllabary"});
        public static final UnicodeBlock BYZANTINE_MUSICAL_SYMBOLS =
            new UnicodeBlock("BYZANTINE_MUSICAL_SYMBOLS", new String[] {"Byzantine Musical Symbols",
                                                                        "ByzantineMusicalSymbols"});
        public static final UnicodeBlock MUSICAL_SYMBOLS =
            new UnicodeBlock("MUSICAL_SYMBOLS", new String[] {"Musical Symbols", "MusicalSymbols"});
        public static final UnicodeBlock TAI_XUAN_JING_SYMBOLS =
            new UnicodeBlock("TAI_XUAN_JING_SYMBOLS", new String[] {"Tai Xuan Jing Symbols",
                                                                     "TaiXuanJingSymbols"});
        public static final UnicodeBlock MATHEMATICAL_ALPHANUMERIC_SYMBOLS =
            new UnicodeBlock("MATHEMATICAL_ALPHANUMERIC_SYMBOLS",
                             new String[] {"Mathematical Alphanumeric Symbols", "MathematicalAlphanumericSymbols"});
        public static final UnicodeBlock CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B =
            new UnicodeBlock("CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B",
                             new String[] {"CJK Unified Ideographs Extension B", "CJKUnifiedIdeographsExtensionB"});
        public static final UnicodeBlock CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT =
            new UnicodeBlock("CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT",
                             new String[]{"CJK Compatibility Ideographs Supplement",
                                          "CJKCompatibilityIdeographsSupplement"});
        public static final UnicodeBlock TAGS = new UnicodeBlock("TAGS");
        public static final UnicodeBlock VARIATION_SELECTORS_SUPPLEMENT =
            new UnicodeBlock("VARIATION_SELECTORS_SUPPLEMENT", new String[] {"Variation Selectors Supplement",
                                                                             "VariationSelectorsSupplement"});
        public static final UnicodeBlock SUPPLEMENTARY_PRIVATE_USE_AREA_A =
            new UnicodeBlock("SUPPLEMENTARY_PRIVATE_USE_AREA_A",
                             new String[] {"Supplementary Private Use Area-A",
                                           "SupplementaryPrivateUseArea-A"});
        public static final UnicodeBlock SUPPLEMENTARY_PRIVATE_USE_AREA_B =
            new UnicodeBlock("SUPPLEMENTARY_PRIVATE_USE_AREA_B",
                             new String[] {"Supplementary Private Use Area-B",
                                           "SupplementaryPrivateUseArea-B"});
        public static final UnicodeBlock HIGH_SURROGATES =
            new UnicodeBlock("HIGH_SURROGATES", new String[] {"High Surrogates", "HighSurrogates"});
        public static final UnicodeBlock HIGH_PRIVATE_USE_SURROGATES =
            new UnicodeBlock("HIGH_PRIVATE_USE_SURROGATES", new String[] { "High Private Use Surrogates",
                                                                           "HighPrivateUseSurrogates"});
        public static final UnicodeBlock LOW_SURROGATES =
            new UnicodeBlock("LOW_SURROGATES", new String[] {"Low Surrogates", "LowSurrogates"});

        private static final int blockStarts[] = {
            0x0000, // Basic Latin
            0x0080, // Latin-1 Supplement
            0x0100, // Latin Extended-A
            0x0180, // Latin Extended-B
            0x0250, // IPA Extensions
            0x02B0, // Spacing Modifier Letters
            0x0300, // Combining Diacritical Marks
            0x0370, // Greek and Coptic
            0x0400, // Cyrillic
            0x0500, // Cyrillic Supplementary
            0x0530, // Armenian
            0x0590, // Hebrew
            0x0600, // Arabic
            0x0700, // Syriac
            0x0750, // unassigned
            0x0780, // Thaana
            0x07C0, // unassigned
            0x0900, // Devanagari
            0x0980, // Bengali
            0x0A00, // Gurmukhi
            0x0A80, // Gujarati
            0x0B00, // Oriya
            0x0B80, // Tamil
            0x0C00, // Telugu
            0x0C80, // Kannada
            0x0D00, // Malayalam
            0x0D80, // Sinhala
            0x0E00, // Thai
            0x0E80, // Lao
            0x0F00, // Tibetan
            0x1000, // Myanmar
            0x10A0, // Georgian
            0x1100, // Hangul Jamo
            0x1200, // Ethiopic
            0x1380, // unassigned
            0x13A0, // Cherokee
            0x1400, // Unified Canadian Aboriginal Syllabics
            0x1680, // Ogham
            0x16A0, // Runic
            0x1700, // Tagalog
            0x1720, // Hanunoo
            0x1740, // Buhid
            0x1760, // Tagbanwa
            0x1780, // Khmer
            0x1800, // Mongolian
            0x18B0, // unassigned
            0x1900, // Limbu
            0x1950, // Tai Le
            0x1980, // unassigned
            0x19E0, // Khmer Symbols
            0x1A00, // unassigned
            0x1D00, // Phonetic Extensions
            0x1D80, // unassigned
            0x1E00, // Latin Extended Additional
            0x1F00, // Greek Extended
            0x2000, // General Punctuation
            0x2070, // Superscripts and Subscripts
            0x20A0, // Currency Symbols
            0x20D0, // Combining Diacritical Marks for Symbols
            0x2100, // Letterlike Symbols
            0x2150, // Number Forms
            0x2190, // Arrows
            0x2200, // Mathematical Operators
            0x2300, // Miscellaneous Technical
            0x2400, // Control Pictures
            0x2440, // Optical Character Recognition
            0x2460, // Enclosed Alphanumerics
            0x2500, // Box Drawing
            0x2580, // Block Elements
            0x25A0, // Geometric Shapes
            0x2600, // Miscellaneous Symbols
            0x2700, // Dingbats
            0x27C0, // Miscellaneous Mathematical Symbols-A
            0x27F0, // Supplemental Arrows-A
            0x2800, // Braille Patterns
            0x2900, // Supplemental Arrows-B
            0x2980, // Miscellaneous Mathematical Symbols-B
            0x2A00, // Supplemental Mathematical Operators
            0x2B00, // Miscellaneous Symbols and Arrows
            0x2C00, // unassigned
            0x2E80, // CJK Radicals Supplement
            0x2F00, // Kangxi Radicals
            0x2FE0, // unassigned
            0x2FF0, // Ideographic Description Characters
            0x3000, // CJK Symbols and Punctuation
            0x3040, // Hiragana
            0x30A0, // Katakana
            0x3100, // Bopomofo
            0x3130, // Hangul Compatibility Jamo
            0x3190, // Kanbun
            0x31A0, // Bopomofo Extended
            0x31C0, // unassigned
            0x31F0, // Katakana Phonetic Extensions
            0x3200, // Enclosed CJK Letters and Months
            0x3300, // CJK Compatibility
            0x3400, // CJK Unified Ideographs Extension A
            0x4DC0, // Yijing Hexagram Symbols
            0x4E00, // CJK Unified Ideographs
            0xA000, // Yi Syllables
            0xA490, // Yi Radicals
            0xA4D0, // unassigned
            0xAC00, // Hangul Syllables
            0xD7B0, // unassigned
            0xD800, // High Surrogates
            0xDB80, // High Private Use Surrogates
            0xDC00, // Low Surrogates
            0xE000, // Private Use
            0xF900, // CJK Compatibility Ideographs
            0xFB00, // Alphabetic Presentation Forms
            0xFB50, // Arabic Presentation Forms-A
            0xFE00, // Variation Selectors
            0xFE10, // unassigned
            0xFE20, // Combining Half Marks
            0xFE30, // CJK Compatibility Forms
            0xFE50, // Small Form Variants
            0xFE70, // Arabic Presentation Forms-B
            0xFF00, // Halfwidth and Fullwidth Forms
            0xFFF0, // Specials
            0x10000, // Linear B Syllabary
            0x10080, // Linear B Ideograms
            0x10100, // Aegean Numbers
            0x10140, // unassigned
            0x10300, // Old Italic
            0x10330, // Gothic
            0x10350, // unassigned
            0x10380, // Ugaritic
            0x103A0, // unassigned
            0x10400, // Deseret
            0x10450, // Shavian
            0x10480, // Osmanya
            0x104B0, // unassigned
            0x10800, // Cypriot Syllabary
            0x10840, // unassigned
            0x1D000, // Byzantine Musical Symbols
            0x1D100, // Musical Symbols
            0x1D200, // unassigned
            0x1D300, // Tai Xuan Jing Symbols
            0x1D360, // unassigned
            0x1D400, // Mathematical Alphanumeric Symbols
            0x1D800, // unassigned
            0x20000, // CJK Unified Ideographs Extension B
            0x2A6E0, // unassigned
            0x2F800, // CJK Compatibility Ideographs Supplement
            0x2FA20, // unassigned
            0xE0000, // Tags
            0xE0080, // unassigned
            0xE0100, // Variation Selectors Supplement
            0xE01F0, // unassigned
            0xF0000, // Supplementary Private Use Area-A
            0x100000, // Supplementary Private Use Area-B
        };

        private static final UnicodeBlock[] blocks = {
            BASIC_LATIN,
            LATIN_1_SUPPLEMENT,
            LATIN_EXTENDED_A,
            LATIN_EXTENDED_B,
            IPA_EXTENSIONS,
            SPACING_MODIFIER_LETTERS,
            COMBINING_DIACRITICAL_MARKS,
            GREEK,
            CYRILLIC,
            CYRILLIC_SUPPLEMENTARY,
            ARMENIAN,
            HEBREW,
            ARABIC,
            SYRIAC,
            null,
            THAANA,
            null,
            DEVANAGARI,
            BENGALI,
            GURMUKHI,
            GUJARATI,
            ORIYA,
            TAMIL,
            TELUGU,
            KANNADA,
            MALAYALAM,
            SINHALA,
            THAI,
            LAO,
            TIBETAN,
            MYANMAR,
            GEORGIAN,
            HANGUL_JAMO,
            ETHIOPIC,
            null,
            CHEROKEE,
            UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS,
            OGHAM,
            RUNIC,
            TAGALOG,
            HANUNOO,
            BUHID,
            TAGBANWA,
            KHMER,
            MONGOLIAN,
            null,
            LIMBU,
            TAI_LE,
            null,
            KHMER_SYMBOLS,
            null,
            PHONETIC_EXTENSIONS,
            null,
            LATIN_EXTENDED_ADDITIONAL,
            GREEK_EXTENDED,
            GENERAL_PUNCTUATION,
            SUPERSCRIPTS_AND_SUBSCRIPTS,
            CURRENCY_SYMBOLS,
            COMBINING_MARKS_FOR_SYMBOLS,
            LETTERLIKE_SYMBOLS,
            NUMBER_FORMS,
            ARROWS,
            MATHEMATICAL_OPERATORS,
            MISCELLANEOUS_TECHNICAL,
            CONTROL_PICTURES,
            OPTICAL_CHARACTER_RECOGNITION,
            ENCLOSED_ALPHANUMERICS,
            BOX_DRAWING,
            BLOCK_ELEMENTS,
            GEOMETRIC_SHAPES,
            MISCELLANEOUS_SYMBOLS,
            DINGBATS,
            MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A,
            SUPPLEMENTAL_ARROWS_A,
            BRAILLE_PATTERNS,
            SUPPLEMENTAL_ARROWS_B,
            MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B,
            SUPPLEMENTAL_MATHEMATICAL_OPERATORS,
            MISCELLANEOUS_SYMBOLS_AND_ARROWS,
            null,
            CJK_RADICALS_SUPPLEMENT,
            KANGXI_RADICALS,
            null,
            IDEOGRAPHIC_DESCRIPTION_CHARACTERS,
            CJK_SYMBOLS_AND_PUNCTUATION,
            HIRAGANA,
            KATAKANA,
            BOPOMOFO,
            HANGUL_COMPATIBILITY_JAMO,
            KANBUN,
            BOPOMOFO_EXTENDED,
            null,
            KATAKANA_PHONETIC_EXTENSIONS,
            ENCLOSED_CJK_LETTERS_AND_MONTHS,
            CJK_COMPATIBILITY,
            CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A,
            YIJING_HEXAGRAM_SYMBOLS,
            CJK_UNIFIED_IDEOGRAPHS,
            YI_SYLLABLES,
            YI_RADICALS,
            null,
            HANGUL_SYLLABLES,
            null,
            HIGH_SURROGATES,
            HIGH_PRIVATE_USE_SURROGATES,
            LOW_SURROGATES,
            PRIVATE_USE_AREA,
            CJK_COMPATIBILITY_IDEOGRAPHS,
            ALPHABETIC_PRESENTATION_FORMS,
            ARABIC_PRESENTATION_FORMS_A,
            VARIATION_SELECTORS,
            null,
            COMBINING_HALF_MARKS,
            CJK_COMPATIBILITY_FORMS,
            SMALL_FORM_VARIANTS,
            ARABIC_PRESENTATION_FORMS_B,
            HALFWIDTH_AND_FULLWIDTH_FORMS,
            SPECIALS,
            LINEAR_B_SYLLABARY,
            LINEAR_B_IDEOGRAMS,
            AEGEAN_NUMBERS,
            null,
            OLD_ITALIC,
            GOTHIC,
            null,
            UGARITIC,
            null,
            DESERET,
            SHAVIAN,
            OSMANYA,
            null,
            CYPRIOT_SYLLABARY,
            null,
            BYZANTINE_MUSICAL_SYMBOLS,
            MUSICAL_SYMBOLS,
            null,
            TAI_XUAN_JING_SYMBOLS,
            null,
            MATHEMATICAL_ALPHANUMERIC_SYMBOLS,
            null,
            CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B,
            null,
            CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT,
            null,
            TAGS,
            null,
            VARIATION_SELECTORS_SUPPLEMENT,
            null,
            SUPPLEMENTARY_PRIVATE_USE_AREA_A,
            SUPPLEMENTARY_PRIVATE_USE_AREA_B
        };

        public static UnicodeBlock of(char c) {
            return of((int)c);
        }

        public static UnicodeBlock of(int codePoint) {
            if (!isValidCodePoint(codePoint)) {
                throw new IllegalArgumentException();
            }

            int top, bottom, current;
            bottom = 0;
            top = blockStarts.length;
            current = top/2;

            // invariant: top > current >= bottom && codePoint >= unicodeBlockStarts[bottom]
            while (top - bottom > 1) {
                if (codePoint >= blockStarts[current]) {
                    bottom = current;
                } else {
                    top = current;
                }
                current = (top + bottom) / 2;
            }
            return blocks[current];
        }

        public static final UnicodeBlock forName(String blockName) {
            UnicodeBlock block = (UnicodeBlock)map.get(blockName.toUpperCase(Locale.US));
            if (block == null) {
                throw new IllegalArgumentException();
            }
            return block;
        }
    }

    private final char value;
    private static final long serialVersionUID = 3786198910865385080L;

    public Character(char value) {
        this.value = value;
    }

    public static Character valueOf(char c) {
        return new Character(c);
    }

    public char charValue() {
        return value;
    }

    public int hashCode() {
        return (int)value;
    }

    public boolean equals(Object obj) {
        if (obj instanceof Character) {
            return value == ((Character)obj).charValue();
        }
        return false;
    }

    public String toString() {
        char buf[] = {value};
        return String.valueOf(buf);
    }

    public static String toString(char c) {
        return String.valueOf(c);
    }

    public static boolean isValidCodePoint(int codePoint) {
        return codePoint >= MIN_CODE_POINT && codePoint <= MAX_CODE_POINT;
    }

    public static boolean isSupplementaryCodePoint(int codePoint) {
        return codePoint >= MIN_SUPPLEMENTARY_CODE_POINT
            && codePoint <= MAX_CODE_POINT;
    }

    public static boolean isHighSurrogate(char ch) {
        return ch >= MIN_HIGH_SURROGATE && ch <= MAX_HIGH_SURROGATE;
    }

    public static boolean isLowSurrogate(char ch) {
        return ch >= MIN_LOW_SURROGATE && ch <= MAX_LOW_SURROGATE;
    }

    public static boolean isSurrogatePair(char high, char low) {
        return isHighSurrogate(high) && isLowSurrogate(low);
    }

    public static int charCount(int codePoint) {
        return codePoint >= MIN_SUPPLEMENTARY_CODE_POINT? 2 : 1;
    }

    public static int toCodePoint(char high, char low) {
        return ((high - MIN_HIGH_SURROGATE) << 10)
            + (low - MIN_LOW_SURROGATE) + MIN_SUPPLEMENTARY_CODE_POINT;
    }

    public static int codePointAt(CharSequence seq, int index) {
        char c1 = seq.charAt(index++);
        if (isHighSurrogate(c1)) {
            if (index < seq.length()) {
                char c2 = seq.charAt(index);
                if (isLowSurrogate(c2)) {
                    return toCodePoint(c1, c2);
                }
            }
        }
        return c1;
    }

    public static int codePointAt(char[] a, int index) {
        return codePointAtImpl(a, index, a.length);
    }

    public static int codePointAt(char[] a, int index, int limit) {
        if (index >= limit || limit < 0 || limit > a.length) {
            throw new IndexOutOfBoundsException();
        }
        return codePointAtImpl(a, index, limit);
    }

    static int codePointAtImpl(char[] a, int index, int limit) {
        char c1 = a[index++];
        if (isHighSurrogate(c1)) {
            if (index < limit) {
                char c2 = a[index];
                if (isLowSurrogate(c2)) {
                    return toCodePoint(c1, c2);
                }
            }
        }
        return c1;
    }

    public static int codePointBefore(CharSequence seq, int index) {
        char c2 = seq.charAt(--index);
        if (isLowSurrogate(c2)) {
            if (index > 0) {
                char c1 = seq.charAt(--index);
                if (isHighSurrogate(c1)) {
                    return toCodePoint(c1, c2);
                }
            }
        }
        return c2;
    }

    public static int codePointBefore(char[] a, int index) {
        return codePointBeforeImpl(a, index, 0);
    }

    public static int codePointBefore(char[] a, int index, int start) {
        if (index <= start || start < 0 || start >= a.length) {
            throw new IndexOutOfBoundsException();
        }
        return codePointBeforeImpl(a, index, start);
    }

    static int codePointBeforeImpl(char[] a, int index, int start) {
        char c2 = a[--index];
        if (isLowSurrogate(c2)) {
            if (index > start) {
                char c1 = a[--index];
                if (isHighSurrogate(c1)) {
                    return toCodePoint(c1, c2);
                }
            }
        }
        return c2;
    }

    public static int toChars(int codePoint, char[] dst, int dstIndex) {
        if (codePoint < 0 || codePoint > MAX_CODE_POINT) {
            throw new IllegalArgumentException();
        }
        if (codePoint < MIN_SUPPLEMENTARY_CODE_POINT) {
            dst[dstIndex] = (char) codePoint;
            return 1;
        }
        toSurrogates(codePoint, dst, dstIndex);
        return 2;
    }

    public static char[] toChars(int codePoint) {
        if (codePoint < 0 || codePoint > MAX_CODE_POINT) {
            throw new IllegalArgumentException();
        }
        if (codePoint < MIN_SUPPLEMENTARY_CODE_POINT) {
                return new char[] { (char) codePoint };
        }
        char[] result = new char[2];
        toSurrogates(codePoint, result, 0);
        return result;
    }

    static void toSurrogates(int codePoint, char[] dst, int index) {
        int offset = codePoint - MIN_SUPPLEMENTARY_CODE_POINT;
        dst[index+1] = (char)((offset & 0x3ff) + MIN_LOW_SURROGATE);
        dst[index] = (char)((offset >>> 10) + MIN_HIGH_SURROGATE);
    }

    public static int codePointCount(CharSequence seq, int beginIndex, int endIndex) {
        int length = seq.length();
        if (beginIndex < 0 || endIndex > length || beginIndex > endIndex) {
            throw new IndexOutOfBoundsException();
        }
        int n = 0;
        for (int i = beginIndex; i < endIndex; ) {
            n++;
            if (isHighSurrogate(seq.charAt(i++))) {
                if (i < endIndex && isLowSurrogate(seq.charAt(i))) {
                    i++;
                }
            }
        }
        return n;
    }

    public static int codePointCount(char[] a, int offset, int count) {
        if (count > a.length - offset || offset < 0 || count < 0) {
            throw new IndexOutOfBoundsException();
        }
        return codePointCountImpl(a, offset, count);
    }

    static int codePointCountImpl(char[] a, int offset, int count) {
        int endIndex = offset + count;
        int n = 0;
        for (int i = offset; i < endIndex; ) {
            n++;
            if (isHighSurrogate(a[i++])) {
                if (i < endIndex && isLowSurrogate(a[i])) {
                    i++;
                }
            }
        }
        return n;
    }

    public static int offsetByCodePoints(CharSequence seq, int index,
                                         int codePointOffset) {
        int length = seq.length();
        if (index < 0 || index > length) {
            throw new IndexOutOfBoundsException();
        }

        int x = index;
        if (codePointOffset >= 0) {
            int i;
            for (i = 0; x < length && i < codePointOffset; i++) {
                if (isHighSurrogate(seq.charAt(x++))) {
                    if (x < length && isLowSurrogate(seq.charAt(x))) {
                        x++;
                    }
                }
            }
            if (i < codePointOffset) {
                throw new IndexOutOfBoundsException();
            }
        } else {
            int i;
            for (i = codePointOffset; x > 0 && i < 0; i++) {
                if (isLowSurrogate(seq.charAt(--x))) {
                    if (x > 0 && isHighSurrogate(seq.charAt(x-1))) {
                        x--;
                    }
                }
            }
            if (i < 0) {
                throw new IndexOutOfBoundsException();
            }
        }
        return x;
    }

    public static int offsetByCodePoints(char[] a, int start, int count,
                                         int index, int codePointOffset) {
        if (count > a.length-start || start < 0 || count < 0
            || index < start || index > start+count) {
            throw new IndexOutOfBoundsException();
        }
        return offsetByCodePointsImpl(a, start, count, index, codePointOffset);
    }

    static int offsetByCodePointsImpl(char[]a, int start, int count,
                                      int index, int codePointOffset) {
        int x = index;
        if (codePointOffset >= 0) {
            int limit = start + count;
            int i;
            for (i = 0; x < limit && i < codePointOffset; i++) {
                if (isHighSurrogate(a[x++])) {
                    if (x < limit && isLowSurrogate(a[x])) {
                        x++;
                    }
                }
            }
            if (i < codePointOffset) {
                throw new IndexOutOfBoundsException();
            }
        } else {
            int i;
            for (i = codePointOffset; x > start && i < 0; i++) {
                if (isLowSurrogate(a[--x])) {
                    if (x > start && isHighSurrogate(a[x-1])) {
                        x--;
                    }
                }
            }
            if (i < 0) {
                throw new IndexOutOfBoundsException();
            }
        }
        return x;
    }

    public static boolean isLowerCase(char ch) {
        return isLowerCase((int)ch);
    }

    public static boolean isLowerCase(int codePoint) {
        return getType(codePoint) == Character.LOWERCASE_LETTER;
    }

    public static boolean isUpperCase(char ch) {
        return isUpperCase((int)ch);
    }

    public static boolean isUpperCase(int codePoint) {
        return getType(codePoint) == Character.UPPERCASE_LETTER;
    }

    public static boolean isTitleCase(char ch) {
        return isTitleCase((int)ch);
    }

    public static boolean isTitleCase(int codePoint) {
        return getType(codePoint) == Character.TITLECASE_LETTER;
    }

    public static boolean isDigit(char ch) {
        return isDigit((int)ch);
    }

    public static boolean isDigit(int codePoint) {
        return getType(codePoint) == Character.DECIMAL_DIGIT_NUMBER;
    }

    public static boolean isDefined(char ch) {
        return isDefined((int)ch);
    }

    public static boolean isDefined(int codePoint) {
        return getType(codePoint) != Character.UNASSIGNED;
    }

    public static boolean isLetter(char ch) {
        return isLetter((int)ch);
    }

    public static boolean isLetter(int codePoint) {
        return ((((1 << Character.UPPERCASE_LETTER) |
            (1 << Character.LOWERCASE_LETTER) |
            (1 << Character.TITLECASE_LETTER) |
            (1 << Character.MODIFIER_LETTER) |
            (1 << Character.OTHER_LETTER)) >> getType(codePoint)) & 1)
            != 0;
    }

    public static boolean isLetterOrDigit(char ch) {
        return isLetterOrDigit((int)ch);
    }

    public static boolean isLetterOrDigit(int codePoint) {
        return ((((1 << Character.UPPERCASE_LETTER) |
            (1 << Character.LOWERCASE_LETTER) |
            (1 << Character.TITLECASE_LETTER) |
            (1 << Character.MODIFIER_LETTER) |
            (1 << Character.OTHER_LETTER) |
            (1 << Character.DECIMAL_DIGIT_NUMBER)) >> getType(codePoint)) & 1)
            != 0;
    }

    @Deprecated
    public static boolean isJavaLetter(char ch) {
        return isJavaIdentifierStart(ch);
    }

    @Deprecated
    public static boolean isJavaLetterOrDigit(char ch) {
        return isJavaIdentifierPart(ch);
    }

    public static boolean isJavaIdentifierStart(char ch) {
        return isJavaIdentifierStart((int)ch);
    }

    public static boolean isJavaIdentifierStart(int codePoint) {
        return CharacterData.of(codePoint).isJavaIdentifierStart(codePoint);
    }

    public static boolean isJavaIdentifierPart(char ch) {
        return isJavaIdentifierPart((int)ch);
    }

    public static boolean isJavaIdentifierPart(int codePoint) {
        return CharacterData.of(codePoint).isJavaIdentifierPart(codePoint);
    }

    public static boolean isUnicodeIdentifierStart(char ch) {
        return isUnicodeIdentifierStart((int)ch);
    }

    public static boolean isUnicodeIdentifierStart(int codePoint) {
        return CharacterData.of(codePoint).isUnicodeIdentifierStart(codePoint);
    }

    public static boolean isUnicodeIdentifierPart(char ch) {
        return isUnicodeIdentifierPart((int)ch);
    }

    public static boolean isUnicodeIdentifierPart(int codePoint) {
        return CharacterData.of(codePoint).isUnicodeIdentifierPart(codePoint);
    }

    public static boolean isIdentifierIgnorable(char ch) {
        return isIdentifierIgnorable((int)ch);
    }

    public static boolean isIdentifierIgnorable(int codePoint) {
        return CharacterData.of(codePoint).isIdentifierIgnorable(codePoint);
    }

    public static char toLowerCase(char ch) {
        return (char)toLowerCase((int)ch);
    }

    public static int toLowerCase(int codePoint) {
        return CharacterData.of(codePoint).toLowerCase(codePoint);
    }

    public static char toUpperCase(char ch) {
        return (char)toUpperCase((int)ch);
    }

    public static int toUpperCase(int codePoint) {
        return CharacterData.of(codePoint).toUpperCase(codePoint);
    }

    public static char toTitleCase(char ch) {
        return (char)toTitleCase((int)ch);
    }

    public static int toTitleCase(int codePoint) {
        return CharacterData.of(codePoint).toTitleCase(codePoint);
    }

    public static int digit(char ch, int radix) {
        return digit((int)ch, radix);
    }

    public static int digit(int codePoint, int radix) {
        return CharacterData.of(codePoint).digit(codePoint, radix);
    }

    public static int getNumericValue(char ch) {
        return getNumericValue((int)ch);
    }

    public static int getNumericValue(int codePoint) {
        return CharacterData.of(codePoint).getNumericValue(codePoint);
    }

    @Deprecated
    public static boolean isSpace(char ch) {
        return (ch <= 0x0020) &&
            (((((1L << 0x0009) |
            (1L << 0x000A) |
            (1L << 0x000C) |
            (1L << 0x000D) |
            (1L << 0x0020)) >> ch) & 1L) != 0);
    }

    public static boolean isSpaceChar(char ch) {
        return isSpaceChar((int)ch);
    }

    public static boolean isSpaceChar(int codePoint) {
        return ((((1 << Character.SPACE_SEPARATOR) |
                  (1 << Character.LINE_SEPARATOR) |
                  (1 << Character.PARAGRAPH_SEPARATOR)) >> getType(codePoint)) & 1)
            != 0;
    }

    public static boolean isWhitespace(char ch) {
        return isWhitespace((int)ch);
    }

     public static boolean isWhitespace(int codePoint) {
        return CharacterData.of(codePoint).isWhitespace(codePoint);
    }

    public static boolean isISOControl(char ch) {
        return isISOControl((int)ch);
    }

    public static boolean isISOControl(int codePoint) {
        return (codePoint >= 0x0000 && codePoint <= 0x001F) ||
            (codePoint >= 0x007F && codePoint <= 0x009F);
    }

    public static int getType(char ch) {
        return getType((int)ch);
    }

    public static int getType(int codePoint) {
        return CharacterData.of(codePoint).getType(codePoint);
    }

    public static char forDigit(int digit, int radix) {
        if ((digit >= radix) || (digit < 0)) {
            return '\0';
        }
        if ((radix < Character.MIN_RADIX) || (radix > Character.MAX_RADIX)) {
            return '\0';
        }
        if (digit < 10) {
            return (char)('0' + digit);
        }
        return (char)('a' - 10 + digit);
    }

    public static byte getDirectionality(char ch) {
        return getDirectionality((int)ch);
    }

    public static byte getDirectionality(int codePoint) {
        return CharacterData.of(codePoint).getDirectionality(codePoint);
    }

    public static boolean isMirrored(char ch) {
        return isMirrored((int)ch);
    }

    public static boolean isMirrored(int codePoint) {
        return CharacterData.of(codePoint).isMirrored(codePoint);
    }

    public int compareTo(Character anotherCharacter) {
        return this.value - anotherCharacter.value;
    }

    static int toUpperCaseEx(int codePoint) {
        assert isValidCodePoint(codePoint);
        return CharacterData.of(codePoint).toUpperCaseEx(codePoint);
    }

    static char[] toUpperCaseCharArray(int codePoint) {
        assert isValidCodePoint(codePoint) &&
               !isSupplementaryCodePoint(codePoint);
        return CharacterData.of(codePoint).toUpperCaseCharArray(codePoint);
    }

    public static final int SIZE = 16;

    public static char reverseBytes(char ch) {
        return (char) (((ch & 0xFF00) >> 8) | (ch << 8));
    }
}
