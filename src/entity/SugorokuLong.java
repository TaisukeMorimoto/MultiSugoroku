package entity;

public class SugorokuLong extends SugorokuNormal {

	private int SQUARE = 40 + 1;

	public SugorokuLong(String realPath, String csvPath) {
		super(realPath, csvPath);
		super.SQUARE = this.SQUARE;
	}

	public int getSQUARE() {
		return SQUARE;
	}

	public void setSQUARE(int sQUARE) {
		SQUARE = sQUARE;
	}
}
