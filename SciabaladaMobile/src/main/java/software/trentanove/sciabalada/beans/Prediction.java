package software.trentanove.sciabalada.beans;

public class Prediction {  
 
	private String predictionDate;  
	private String gamer;  
	private double prediction;  
	private double biorhythmP;  
	private double biorhythmE;  
	private double biorhythmI;  
	private double predictionPerc;
	
	public String getPredictionDate() {
		return predictionDate;
	}
	public void setPredictionDate(String predictionDate) {
		this.predictionDate = predictionDate;
	}
	public String getGamer() {
		return gamer;
	}
	public void setGamer(String gamer) {
		this.gamer = gamer;
	}
	public double getPrediction() {
		return prediction;
	}
	public void setPrediction(double prediction) {
		this.prediction = prediction;
	}
	public double getBiorhythmP() {
		return biorhythmP;
	}
	public void setBiorhythmP(double biorhythmP) {
		this.biorhythmP = biorhythmP;
	}
	public double getBiorhythmE() {
		return biorhythmE;
	}
	public void setBiorhythmE(double biorhythmE) {
		this.biorhythmE = biorhythmE;
	}
	public double getBiorhythmI() {
		return biorhythmI;
	}
	public void setBiorhythmI(double biorhythmI) {
		this.biorhythmI = biorhythmI;
	}
	public double getPredictionPerc() {
		return predictionPerc;
	}
	public void setPredictionPerc(double predictionPerc) {
		this.predictionPerc = predictionPerc;
	}


}  