package test;

import practice.SugorokuNormal;

public class SugorokuNormalTest {

	public static void main(String[] args) {
		int nPlayer = 3;
		int[] playerType = {1, 4, 5};
		SugorokuNormal sugoroku = new SugorokuNormal(nPlayer, playerType);

		// liquorListにliquorが格納されているか
		if (sugoroku.getLiquorList() != null) {
			System.out.println(sugoroku.getLiquorList().get(0).getLiquorName());
			System.out.println(sugoroku.getLiquorList().get(0).getLiquorText());
			System.out.println(sugoroku.getLiquorList().get(10).getLiquorName());
			System.out.println(sugoroku.getLiquorList().get(10).getLiquorText());
			System.out.println("getLiquorList is ok");
		}
	}

}
