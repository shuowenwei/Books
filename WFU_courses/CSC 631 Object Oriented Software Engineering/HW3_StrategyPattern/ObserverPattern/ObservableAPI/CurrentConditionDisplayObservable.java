import java.util.Observable;
import java.util.Observer;

public class CurrentConditionDisplayObservable implements Observer, DisplayElement {

	Observable observable;
	private float temperature;
	private float humidity;
//	private float pressure;

	public CurrentConditionDisplayObservable(Observable observable){
		
		this.observable = observable;
		observable.addObserver(this);
	}

	@Override
	public void update(Observable obs, Object arg) {
		// TODO Auto-generated method stub
		if(obs instanceof WeatherDataObservable){
			WeatherDataObservable w = (WeatherDataObservable) obs;
		this.temperature = w.getTemperature();
		this.humidity = w.getHumidity();
		
		display();
		}
	}
	
	@Override
	public void display() {
		// TODO Auto-generated method stub
		System.out.println("Current conditions: "+temperature + 
				" F degrees and " + humidity + "% humidity");
	}

}
