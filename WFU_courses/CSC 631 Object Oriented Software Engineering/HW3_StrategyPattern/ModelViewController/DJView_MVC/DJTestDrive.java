
import java.util.Observable;
import java.util.Observer;


public class DJTestDrive {

    public static void main (String[] args) {
    	Observable model = new BeatModel();
		ControllerInterface controller = new BeatController(model);
    }
}