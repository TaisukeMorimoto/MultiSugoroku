package entity;

import java.util.ArrayList;
import java.util.Random;

public class Sugoroku1p extends SugorokuNormal {

	private int SQUARE = 999 + 1;

	public Sugoroku1p(String realPath, String csvPath) {
		super(realPath, csvPath);
		ArrayList<Liquor> liquorAllList = getLiquorAllList();
		for (int i = 0; i < SQUARE ; i++) {
			// move liquor instance from allList to liquorList at random
			liquorList.add(liquorAllList.get(new Random().nextInt(liquorAllList.size())));
		}
	}

	public int getSQUARE() {
		return SQUARE;
	}

	public void setSQUARE(int sQUARE) {
		SQUARE = sQUARE;
	}
}
