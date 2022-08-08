
public class WeatherStationObservable 
{

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		WeatherDataObservable w = new WeatherDataObservable();
		CurrentConditionDisplayObservable currentConditions = 
				new CurrentConditionDisplayObservable(w);
		StatisticsDisplayObservable statisticsDisplay = 
				new StatisticsDisplayObservable(w);
		ForecastDisplayObserable forecastDisplay = new ForecastDisplayObserable(w);

		w.setMeasurements(80, 65, 30.4f);
		w.setMeasurements(82, 70, 29.2f);
		w.setMeasurements(78, 90, 29.2f);
	}
}

