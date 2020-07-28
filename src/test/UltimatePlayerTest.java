package test;

import java.util.ArrayList;

import practice.Liquor;
import practice.SugorokuNormal;
import practice.UltimatePlayer;

public class UltimatePlayerTest {

	public static void main(String[] args) {

		SugorokuNormal sugoroku = new SugorokuNormal();
//		sugoroku.getLiquorList();
		System.out.println("「すごろくノーマル」を生成しました。");


		ArrayList<UltimatePlayer> playerList = initPlayer();
		UltimatePlayer p1 = playerList.get(0);
		UltimatePlayer p2 = playerList.get(1);
		UltimatePlayer p3 = playerList.get(2);
		UltimatePlayer p4 = playerList.get(3);
		System.out.println("");

		// 一人ずつサイコロふる
		onePlay(p1, sugoroku);
		onePlay(p2, sugoroku);
		onePlay(p3, sugoroku);

	}

	public static ArrayList<UltimatePlayer> initPlayer() {
		UltimatePlayer miyashita = new UltimatePlayer(26, 6, "Miyashita");
		System.out.println("<" + miyashita.getName() + ">　を生成しました。");

		UltimatePlayer otake = new UltimatePlayer(26, 6, "Otake");
		System.out.println("<" + otake.getName() + ">　を生成しました。");

		UltimatePlayer kano = new UltimatePlayer(26, 6, "Kano");
		System.out.println("<" + kano.getName() + ">　を生成しました。");

		UltimatePlayer katada = new UltimatePlayer(26, 6, "Katada");
		System.out.println("<" + katada.getName() + ">　を生成しました。");

		ArrayList<UltimatePlayer> playerList = new ArrayList<UltimatePlayer>();
		playerList.add(miyashita);
		playerList.add(otake);
		playerList.add(kano);
		playerList.add(katada);
		return playerList;
	}

	public static void onePlay(UltimatePlayer player, SugorokuNormal sugoroku) {
		sugoroku.getLiquorList();
		int dice1 = player.rollDice();
		System.out.println(player.getName() + "　は、" + dice1 + "を出しました。");
		player.goForward(dice1);
		System.out.println(player.getName() + "　の現在地は" + player.getLocation() + "です。");
		Liquor liq1 = sugoroku.getLiquorList().get(player.getLocation());
		System.out.println(player.getName() + "　は、" + liq1.getLiquorName() + "(" + liq1.getLiquorAlcLv() + "°)を飲みます。");
		System.out.println("ドリンクテキスト：　" + liq1.getLiquorText());
		player.drinkLiquor(liq1);
		System.out.println(player.getName() + "　の、" + "現在の血中アルコール濃度は" + player.getBloodAlcLv() + "です。");
		player.doUltimate();
	}

}
