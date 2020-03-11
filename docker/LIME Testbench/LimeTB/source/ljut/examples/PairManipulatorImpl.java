
public class PairManipulatorImpl implements PairManipulator {
	
	public PairManipulatorImpl(StringPair pair) {
		this.pair = pair;
	}

	@Override
	public String getLeft() {
		return pair.left;
	}

	@Override
	public String getRight() {
		return pair.right;
	}

	@Override
	public String maybeLeft() {
		return pair.left != null ? pair.left : pair.right;
	}

	private StringPair pair;
}
