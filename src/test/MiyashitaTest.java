//package test;
//
//import entity.Liquor;
//import entity.SugorokuNormal;
//import entity.UltimatePlayer;
//
//public class MiyashitaTest {
//
//	public static void main(String[] args) {
//		// sugoroku/playerの生成
//		SugorokuNormal sugoroku = new SugorokuNormal(null);
//		System.out.println("「すごろくノーマル」を生成しました。");
//		UltimatePlayer miyashita = new UltimatePlayer(26, 6);
//		System.out.println("player1の名前は" + miyashita.getName() + "です。");
//
//		// roll play
//		System.out.println(miyashita.getName() + "の現在地は、" + miyashita.getLocation() + "です。");
//		System.out.println(miyashita.getName() + "の現在の血中アルコール濃度は" + miyashita.getBloodAlcLv() + "です。");
//		sugoroku.getLiquorList();
//		int dice1 = miyashita.rollDice();
//		System.out.println(miyashita.getName() + "は、" + dice1 + "を出しました。");
//		miyashita.goForward(dice1);
//		System.out.println(miyashita.getName() + "の現在地は" + miyashita.getLocation() + "です。");
//		Liquor liq1 = sugoroku.getLiquorList().get(miyashita.getLocation());
//		System.out.println(miyashita.getName() + "は、" + liq1.getLiquorName() + "(" + liq1.getLiquorAlcLv() + "°)を飲みます。");
//		System.out.println("ドリンクテキスト：　" + liq1.getLiquorText());
//		miyashita.drinkLiquor(liq1);
//		System.out.println("現在の血中アルコール濃度は" + miyashita.getBloodAlcLv() + "です。");
//		// roll play 2
//		System.out.println(miyashita.getName() + "の現在地は、" + miyashita.getLocation() + "です。");
//		System.out.println(miyashita.getName() + "の現在の血中アルコール濃度は" + miyashita.getBloodAlcLv() + "です。");
//		sugoroku.getLiquorList();
//		int dice2 = miyashita.rollDice();
//		System.out.println(miyashita.getName() + "は、" + dice2 + "を出しました。");
//		miyashita.goForward(dice2);
//		System.out.println(miyashita.getName() + "の現在地は" + miyashita.getLocation() + "です。");
//		Liquor liq2 = sugoroku.getLiquorList().get(miyashita.getLocation());
//		System.out.println(miyashita.getName() + "は、" + liq2.getLiquorName() + "(" + liq2.getLiquorAlcLv() + "°)を飲みます。");
//		System.out.println("ドリンクテキスト：　" + liq2.getLiquorText());
//		miyashita.drinkLiquor(liq2);
//		System.out.println("現在の血中アルコール濃度は" + miyashita.getBloodAlcLv() + "です。");
//		// roll play 3
//		System.out.println(miyashita.getName() + "の現在地は、" + miyashita.getLocation() + "です。");
//		System.out.println(miyashita.getName() + "の現在の血中アルコール濃度は" + miyashita.getBloodAlcLv() + "です。");
//		sugoroku.getLiquorList();
//		int dice3 = miyashita.rollDice();
//		System.out.println(miyashita.getName() + "は、" + dice3 + "を出しました。");
//		miyashita.goForward(dice3);
//		System.out.println(miyashita.getName() + "の現在地は" + miyashita.getLocation() + "です。");
//		Liquor liq3 = sugoroku.getLiquorList().get(miyashita.getLocation());
//		System.out.println(miyashita.getName() + "は、" + liq3.getLiquorName() + "(" + liq3.getLiquorAlcLv() + "°)を飲みます。");
//		System.out.println("ドリンクテキスト：　" + liq3.getLiquorText());
//		miyashita.drinkLiquor(liq3);
//		System.out.println("現在の血中アルコール濃度は" + miyashita.getBloodAlcLv() + "です。");
//
//	}
//
//}
