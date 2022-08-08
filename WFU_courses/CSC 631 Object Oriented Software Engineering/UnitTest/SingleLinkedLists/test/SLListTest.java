import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class SLListTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testTestInsert() {
		SLList sll = new SLList();
		sll.Insert(1);
		sll.Insert(2);
		sll.Insert(3);
		
		assertTrue("insert: ", sll.getLast().getData() == (Object)3 );
	}

	@Test
	public void testAppend() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testSearch() {
		fail("Not yet implemented");
	}

}
