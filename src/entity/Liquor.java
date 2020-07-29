package entity;

public class Liquor {

	private String liquorName;
	private int liquorAlcLv;
	private String liquorText;

	Liquor(String liquorName, int liquorAlcLv, String liquorText){
		this.liquorName = liquorName;
		this.liquorAlcLv = liquorAlcLv;
		this.liquorText = liquorText;
	}

	public String getLiquorName() {
		return liquorName;
	}

	public int getLiquorAlcLv() {
		return liquorAlcLv;
	}

	public void setLiquorAlcLv(int liquorAlcLv) {
		this.liquorAlcLv = liquorAlcLv;
	}

	public String getLiquorText() {
		return liquorText;
	}

	public void setLiquorText(String liquorText) {
		this.liquorText = liquorText;
	}

	public void setLiquorName(String liquorName) {
		this.liquorName = liquorName;
	}



}
