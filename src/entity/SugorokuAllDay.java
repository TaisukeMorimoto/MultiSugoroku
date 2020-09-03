package entity;

public class SugorokuAllDay extends SugorokuNormal {

	private int SQUARE = 60 + 1;

	public SugorokuAllDay(String realPath, String csvPath) {
		super(realPath, csvPath);
		super.SQUARE = this.SQUARE;
	}

	@Override
	public int getSQUARE() {
		return SQUARE;
	}

	public void setSQUARE(int sQUARE) {
		SQUARE = sQUARE;
	}
}
