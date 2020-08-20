package entity;

public class Liquor {

	private String liquorName;
	private String liquorEnName;
	private int liquorAlcLv;
	private String liquorText;

	Liquor(String liquorName, String liquorEnName, int liquorAlcLv, String liquorText){
		this.liquorName = liquorName;
		this.liquorEnName = liquorEnName;
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

	public String getLiquorEnName() {
		return liquorEnName;
	}

	public void setLiquorEnName(String liquorEnName) {
		this.liquorEnName = liquorEnName;
	}



}
