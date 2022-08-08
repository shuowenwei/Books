import java.util.Observable;
import java.util.Observable;
import java.util.Observer;


//public class BeatController implements ControllerInterface {
public class BeatController implements ControllerInterface, Observer {
	
	//BeatModelInterface model;
	Observable model;
	DJView view;
   
	//public BeatController(BeatModelInterface model) {
	public BeatController(Observable model) {
		
		this.model = model;
		view = new DJView(this, model);
        view.createView();
        view.createControls();
		view.disableStopMenuItem();
		view.enableStartMenuItem();
		//model.initialize();
		((BeatModel) model).initialize();
	}
  
	public void start() {
		//model.on();
		((BeatModel) model).on();
		view.disableStartMenuItem();
		view.enableStopMenuItem();
	}
  
	public void stop() {
		//model.off();
		((BeatModel) model).off();
		view.disableStopMenuItem();
		view.enableStartMenuItem();
	}
    
	public void increaseBPM() {
        //int bpm = model.getBPM();
        //model.setBPM(bpm + 1);
        int bpm = ((BeatModel) model).getBPM();
        ((BeatModel) model).setBPM(bpm + 1);
	}
    
	public void decreaseBPM() {
		//int bpm = model.getBPM();
        //model.setBPM(bpm - 1);
        int bpm = ((BeatModel) model).getBPM();
        ((BeatModel) model).setBPM(bpm - 1);
  	}
  
 	public void setBPM(int bpm) {
		//model.setBPM(bpm);
 		((BeatModel) model).setBPM(bpm);
 		
 	}

	@Override
	public void update(Observable o, Object arg) {
		// TODO Auto-generated method stub
		
		// this method must be override, but it does nothing here, just like the original program
	}
}