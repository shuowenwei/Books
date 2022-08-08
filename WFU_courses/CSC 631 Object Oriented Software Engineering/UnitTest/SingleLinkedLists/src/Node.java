
public class Node {

	private Node next;
	private Object data;
	
	public Node (Node n, Object o){
		this.next = n;
		
		this.data = o;
		
	}
	
	public Object getData()
	{
		return data;
		
	}
	public Object getNext()
	{
		return next;
		
	}
	public void setData(Object o)
	{
		data = o;
	}
	
	public void setNext(Node n )
	{
		next = n;
	}
	
	
	
}
