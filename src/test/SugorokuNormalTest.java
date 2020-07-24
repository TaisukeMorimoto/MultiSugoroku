package test;

import practice.SugorokuNormal;

public class SugorokuNormalTest {

	public static void main(String[] args) {
		SugorokuNormal sugoroku = new SugorokuNormal();

		// liquorListにliquorが格納されているか
		if (sugoroku.getLiquorList() != null) {
			System.out.println(sugoroku.getLiquorList().get(0).getLiquorName());
			System.out.println(sugoroku.getLiquorList().get(10).getLiquorName());
			System.out.println("getLiquorList is ok");
		}
	}

}
