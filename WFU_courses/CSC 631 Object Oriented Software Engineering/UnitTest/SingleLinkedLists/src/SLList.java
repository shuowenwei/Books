
public class SLList {
	
	Node head;
	Node last; 
	
	public SLList(){
		head = new Node(null, 0);
		last = head;	
	}
	
	public Node getLast(){
		return last;
	}
	
	public void Insert(Object obj){
		Node newNode = new Node(null, obj);
		last.setNext(newNode);
		last = newNode;
	}
	
	public void Append(Object obj){
		
	}
	
	public boolean Delete(Object obj){
		return true;
	
	}
	
	public Node Search(Object obj){
		return new Node(null, 0); 
	}
}
