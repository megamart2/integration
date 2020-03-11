package example_lock;

public class LockImpl implements Lock {
    private Boolean locked;
    public LockImpl() {
    	locked = false;
    }
    public void lock() {
    	locked = true;
    }
    public void unlock() {
    	locked = false;
    }
    public void done() {
    }
    public Boolean getLocked() {
    	return locked;
    }
}
