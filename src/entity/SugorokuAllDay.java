package entity;

public class SugorokuAllDay extends SugorokuNormal {

	private int SQUARE = 60 + 1;

	public SugorokuAllDay(String realPath) {
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
