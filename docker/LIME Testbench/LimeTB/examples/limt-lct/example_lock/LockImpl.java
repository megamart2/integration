package example_lock;

public class LockImpl implements Lock {
    private boolean locked;
    
    public LockImpl() {
    	locked = false;
    }

    public void lock() {
    	locked = true;
    }

    public void unlock() {
    	locked = false;
    }

    public boolean getLocked() {
    	return locked;
    }
}
