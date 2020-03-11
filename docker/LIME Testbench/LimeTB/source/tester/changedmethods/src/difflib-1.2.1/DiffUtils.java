/*
   Copyright 2010 Dmitry Naumenko (dm.naumenko@gmail.com)

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 */
package difflib;

import difflib.myers.MyersDiff;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Implements the difference and patching engine
 *
 * @author <a href="dm.naumenko@gmail.com">Dmitry Naumenko</a>
 * @version 0.4.1
 */
public class DiffUtils {
    private static DiffAlgorithm defaultDiffAlgorithm = new MyersDiff();
    private static Pattern unifiedDiffChunkRe =
            Pattern.compile("^@@\\s+-(?:(\\d+)(?:,(\\d+))?)\\s+\\+(?:(\\d+)(?:,(\\d+))?)\\s+@@$");

    /**
     * Compute the difference between the original and revised texts with default diff algorithm
     *
     * @param original the original text
     * @param revised  the revised text
     * @return the patch describing the difference between the original and revised texts
     */
    public static Patch diff(List<?> original, List<?> revised) {
        return DiffUtils.diff(original, revised, defaultDiffAlgorithm);
    }

    /**
     * Compute the difference between the original and revised texts with given diff algorithm
     *
     * @param original  the original text
     * @param revised   the revised text
     * @param algorithm the given algorithm
     * @return the patch describing the difference between the original and revised texts
     */
    public static Patch diff(List<?> original, List<?> revised, DiffAlgorithm algorithm) {
        return algorithm.diff(original, revised);
    }

    /**
     * Patch the original text with given patch
     *
     * @param original the original text
     * @param patch    the given patch
     * @return the revised text
     * @throws PatchFailedException if can't apply patch
     */
    public static List<?> patch(List<?> original, Patch patch) throws PatchFailedException {
        return patch.applyTo(original);
    }

    /**
     * Unpatch the revised text for a given patch
     *
     * @param revised the revised text
     * @param patch   the given patch
     * @return the original text
     */
    public static List<?> unpatch(List<?> revised, Patch patch) {
        return patch.restore(revised);
    }

    /**
     * Parse the given text in unified format and creates the list of deltas for it.
     *
     * @param diff the text in unified format
     * @return the patch with deltas.
     */
    public static Patch parseUnifiedDiff(List<String> diff) {
        boolean inPrelude = true;
        List<Object[]> rawChunk = new ArrayList<Object[]>();
        Patch patch = new Patch();

        int old_ln = 0, new_ln = 0;
        String tag;
        String rest;
        for (String line : diff) {
            // Skip leading lines until after we've seen one starting with '+++'
            if (inPrelude) {
                if (line.startsWith("+++")) {
                    inPrelude = false;
                }
                continue;
            }
            Matcher m = unifiedDiffChunkRe.matcher(line);
            if (m.find()) {
                // Process the lines in the previous chunk
                if (rawChunk.size() != 0) {
                    List<String> oldChunkLines = new ArrayList<String>();
                    List<String> newChunkLines = new ArrayList<String>();

                    for (Object[] raw_line : rawChunk) {
                        tag = (String) raw_line[0];
                        rest = (String) raw_line[1];
                        if (tag.equals(" ") || tag.equals("-")) {
                            oldChunkLines.add(rest);
                        }
                        if (tag.equals(" ") || tag.equals("+")) {
                            newChunkLines.add(rest);
                        }
                    }
                    patch.addDelta(new ChangeDelta(new Chunk(old_ln - 1, oldChunkLines),
                            new Chunk(new_ln - 1, newChunkLines)));
                    rawChunk.clear();
                }
                // Parse the @@ header
                old_ln = m.group(1) == null ? 1 : Integer.parseInt(m.group(1));
                new_ln = m.group(3) == null ? 1 : Integer.parseInt(m.group(3));

                if (old_ln == 0) {
                    old_ln += 1;
                }
                if (new_ln == 0) {
                    new_ln += 1;
                }
            } else {
                if (line.length() > 0) {
                    tag = line.substring(0, 1);
                    rest = line.substring(1);
                    if (tag.equals(" ") || tag.equals("+") || tag.equals("-")) {
                        rawChunk.add(new Object[]{tag, rest});
                    }
                } else {
                    rawChunk.add(new Object[]{" ", ""});
                }
            }
        }

        // Process the lines in the last chunk
        if (rawChunk.size() != 0) {
            List<String> oldChunkLines = new ArrayList<String>();
            List<String> newChunkLines = new ArrayList<String>();

            for (Object[] raw_line : rawChunk) {
                tag = (String) raw_line[0];
                rest = (String) raw_line[1];
                if (tag.equals(" ") || tag.equals("-")) {
                    oldChunkLines.add(rest);
                }
                if (tag.equals(" ") || tag.equals("+")) {
                    newChunkLines.add(rest);
                }
            }

            patch.addDelta(new ChangeDelta(new Chunk(old_ln - 1, oldChunkLines), new Chunk(
                    new_ln - 1, newChunkLines)));
            rawChunk.clear();
        }

        return patch;
    }

    /**
     * generateUnifiedDiff takes a Patch and some other arguments, returning the Unified Diff format text representing the Patch.
     *
     * @param original      - Filename of the original (unrevised file)
     * @param revised       - Filename of the revised file
     * @param originalLines - Lines of the original file
     * @param patch         - Patch created by the diff() function
     * @param contextSize   - number of lines of context output around each difference in the file.
     * @return List of strings representing the Unified Diff representation of the Patch argument.
     * @author Bill James (tankerbay@gmail.com)
     */
    public static List<String> generateUnifiedDiff(String original, String revised,
                                                   List<String> originalLines, Patch patch, int contextSize) {
        if (!patch.getDeltas().isEmpty()) {
            List<String> ret = new ArrayList<String>();
            ret.add("--- " + original);
            ret.add("+++ " + revised);

            List<Delta> patchDeltas = new ArrayList<Delta>(patch.getDeltas());

            // code outside the if block also works for single-delta issues.
            List<Delta> deltas = new ArrayList<Delta>(); // current list of Delta's to process
            Delta delta = patchDeltas.get(0);
            deltas.add(delta); // add the first Delta to the current set
            // if there's more than 1 Delta, we may need to output them together
            if (patchDeltas.size() > 1) {
                for (int i = 1; i < patchDeltas.size(); i++) {
                    int position = delta.getOriginal().getPosition(); // store the current position of
                    // the first Delta

                    // Check if the next Delta is too close to the current position.
                    // And if it is, add it to the current set
                    Delta nextDelta = patchDeltas.get(i);
                    if ((position + delta.getOriginal().size() + contextSize) >=
                            (nextDelta.getOriginal().getPosition() - contextSize)) {
                        deltas.add(nextDelta);
                    } else {
                        // if it isn't, output the current set,
                        // then create a new set and add the current Delta to it.
                        List<String> curBlock = processDeltas(originalLines, deltas, contextSize);
                        ret.addAll(curBlock);
                        deltas.clear();
                        deltas.add(nextDelta);
                    }
                    delta = nextDelta;
                }

            }
            // don't forget to process the last set of Deltas
            List<String> curBlock = processDeltas(originalLines, deltas, contextSize);
            ret.addAll(curBlock);
            return ret;
        }
        return new ArrayList<String>();
    }

    /**
     * processDeltas takes a list of Deltas and outputs them together in a single block of Unified-Diff-format text.
     *
     * @param origLines   - the lines of the original file
     * @param deltas      - the Deltas to be output as a single block
     * @param contextSize - the number of lines of context to place around block
     * @return
     * @author Bill James (tankerbay@gmail.com)
     */
    private static List<String> processDeltas(List<String> origLines, List<Delta> deltas,
                                              int contextSize) {
        List<String> buffer = new ArrayList<String>();
        int origTotal = 0; // counter for total lines output from Original
        int revTotal = 0;  // counter for total lines output from Original
        int line;

        Delta curDelta = deltas.get(0);

        // NOTE: +1 to overcome the 0-offset Position
        int origStart = curDelta.getOriginal().getPosition() + 1 - contextSize;
        if (origStart < 1) {
            origStart = 1;
        }

        int revStart = curDelta.getRevised().getPosition() + 1 - contextSize;
        if (revStart < 1) {
            revStart = 1;
        }

        // find the start of the wrapper context code
        int contextStart = curDelta.getOriginal().getPosition() - contextSize;
        if (contextStart < 0) {
            contextStart = 0; // clamp to the start of the file
        }

        // output the context before the first Delta
        for (line = contextStart; line < curDelta.getOriginal().getPosition(); line++) { //
            buffer.add(" " + origLines.get(line));
            origTotal++;
            revTotal++;
        }

        // output the first Delta
        buffer.addAll(getDeltaText(curDelta));
        origTotal += curDelta.getOriginal().getLines().size();
        revTotal += curDelta.getRevised().getLines().size();

        int deltaIndex = 1;
        while (deltaIndex < deltas.size()) { // for each of the other Deltas
            Delta nextDelta = deltas.get(deltaIndex);
            int intermediateStart = curDelta.getOriginal().getPosition()
                    + curDelta.getOriginal().getLines().size();
            for (line = intermediateStart; line < nextDelta.getOriginal().getPosition(); line++) {
                // output the code between the last Delta and this one
                buffer.add(" " + origLines.get(line));
                origTotal++;
                revTotal++;
            }
            buffer.addAll(getDeltaText(nextDelta)); // output the Delta
            origTotal += nextDelta.getOriginal().getLines().size();
            revTotal += nextDelta.getRevised().getLines().size();
            curDelta = nextDelta;
            deltaIndex++;
        }

        // Now output the post-Delta context code, clamping the end of the file
        contextStart = curDelta.getOriginal().getPosition()
                + curDelta.getOriginal().getLines().size();
        for (line = contextStart; (line < (contextStart + contextSize))
                && (line < origLines.size()); line++) {
            buffer.add(" " + origLines.get(line));
            origTotal++;
            revTotal++;
        }

        // Create and insert the block header, conforming to the Unified Diff standard
        StringBuffer header = new StringBuffer();
        header.append("@@ -");
        header.append(origStart);
        header.append(",");
        header.append(origTotal);
        header.append(" +");
        header.append(revStart);
        header.append(",");
        header.append(revTotal);
        header.append(" @@");
        buffer.add(0, header.toString());

        return buffer;
    }

    /**
     * getDeltaText returns the lines to be added to the Unified Diff text from the Delta parameter
     *
     * @param delta - the Delta to output
     * @return list of String lines of code.
     * @author Bill James (tankerbay@gmail.com)
     */
    private static List<String> getDeltaText(Delta delta) {
        List<String> buffer = new ArrayList<String>();
        for (Object line : delta.getOriginal().getLines()) {
            buffer.add("-" + line);
        }
        for (Object line : delta.getRevised().getLines()) {
            buffer.add("+" + line);
        }
        return buffer;
    }

}
