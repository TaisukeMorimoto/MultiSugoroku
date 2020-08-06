package entity;

public class SugorokuLong extends SugorokuNormal {

	private int SQUARE = 40 + 1;

	public SugorokuLong(String realPath) {
		super(realPath);
		super.SQUARE = this.SQUARE;
	}

	public int getSQUARE() {
		return SQUARE;
	}

	public void setSQUARE(int sQUARE) {
		SQUARE = sQUARE;
	}
}
