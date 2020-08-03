package test;

import model.SugorokuManager;

public class SugorokuManagerTest {

	public static void main(String[] args) {

		// プレイヤー数の指定
		int nPlayer = 4;
		String realPath = null;
		SugorokuManager mgr = new SugorokuManager(realPath);
		mgr.InitSugorokuManager(nPlayer);

		// キャラクターの指定（プレイヤー数分）
		mgr.StartPlaying("miyashita", "katada", "suzuki", "otake");

		String selectName = "miyashita";

		// サイコロをふる
		for (int i=0; i<=100; i++) {
			mgr.rollDiceOnePlayer();
			System.out.println("===== 必殺技前　======");
			System.out.println("miyashitaのアルコールレベル: " + mgr.getPlayerList().get(0).getBloodAlcLv());
			System.out.println("katadaのアルコールレベル: " + mgr.getPlayerList().get(1).getBloodAlcLv());
			System.out.println("suzukiのアルコールレベル: " + mgr.getPlayerList().get(2).getBloodAlcLv());
			System.out.println("otakeのアルコールレベル: " + mgr.getPlayerList().get(3).getBloodAlcLv());
			System.out.println("===== 必殺技前　======");

			if (mgr.getPlayerList().get(mgr.getTurn()).getEnName().contentEquals("Katada") ||
			   (mgr.getPlayerList().get(mgr.getTurn()).getEnName().contentEquals("Suzuki")) ||
			   (mgr.getPlayerList().get(mgr.getTurn()).getEnName().contentEquals("Otake"))){
				mgr.doUltimateOnePlayer(selectName);
			} else {
				mgr.doUltimateOnePlayer();
			}
			System.out.println("===== 必殺技後　======");
			System.out.println("miyashitaのアルコールレベル: " + mgr.getPlayerList().get(0).getBloodAlcLv());
			System.out.println("katadaのアルコールレベル: " + mgr.getPlayerList().get(1).getBloodAlcLv());
			System.out.println("suzukiのアルコールレベル: " + mgr.getPlayerList().get(2).getBloodAlcLv());
			System.out.println("otakeのアルコールレベル: " + mgr.getPlayerList().get(3).getBloodAlcLv());
			System.out.println("===== 必殺技後　======");
			mgr.goNextPayer();
		}
	}
}