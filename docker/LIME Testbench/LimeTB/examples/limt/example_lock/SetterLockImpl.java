package example_lock;

public class SetterLockImpl implements SetterLock {
	private boolean locked = false;
	public boolean setLocked(boolean locked) {
		boolean l = this.locked;
		this.locked = locked;
		return l;
	}

}
