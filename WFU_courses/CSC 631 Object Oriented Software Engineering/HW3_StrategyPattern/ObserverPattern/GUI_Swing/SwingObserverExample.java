import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;


public class SwingObserverExample {

	JFrame frame;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		SwingObserverExample example = new SwingObserverExample();
		example.go();
	}

	private void go() {
		// TODO Auto-generated method stub
		frame = new JFrame();
		JButton button = new JButton("Shuold I do it?");
		button.addActionListener(new AngelListener());
		button.addActionListener(new DevilListener());
		frame.getContentPane().add(BorderLayout.CENTER, button);
		
		// Set frame properties here
		frame.setVisible(true);
		
	}
	
	class AngelListener implements ActionListener {
		public void actionPerformed(ActionEvent event) {
			System.out.println("Don't do it, you might regret it!");
		}
	}

	class DevilListener implements ActionListener {
		public void actionPerformed(ActionEvent event) {
			System.out.println("Come on, do it!");
		}
	}
	
}
