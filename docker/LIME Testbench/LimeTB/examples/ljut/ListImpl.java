
public class ListImpl implements List {
	
	public ListImpl(ListNode list) {
		first = list;
	}

	@Override
	public void add(ListNode newNode) {
		newNode.next = first;
		first = newNode;
	}

	@Override
	public int first() {
		return first.value;
	}

	@Override
	public ListNode tail(int index) {
		ListNode current = first;
		for (int i = 0; i < index && current != null && i < 50; ++i)
			current = current.next;
		return current;
	}

	private ListNode first;
}
