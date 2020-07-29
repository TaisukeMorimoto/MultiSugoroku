package test;

import model.SugorokuManager;

public class SugorokuManagerTest {

	public static void main(String[] args) {

		// プレイヤー数の指定
		int nPlayer = 3;
		SugorokuManager sugorokuManager = new SugorokuManager(nPlayer);



		// キャラクターの指定（プレイヤー数分）
		sugorokuManager.StartPlaying("Miyashita", "Katada", "Suzuki", "Otake");

		String selectName = "Miyashita";
		// サイコロをふる
		for (int i=0; i<=100; i++) {
			sugorokuManager.rollDiceOnePlayer();
			if (sugorokuManager.getPlayerList().get(sugorokuManager.getTurn()).getEnName().contentEquals("Katada") ||
			   (sugorokuManager.getPlayerList().get(sugorokuManager.getTurn()).getEnName().contentEquals("Suzuki")) ||
			   (sugorokuManager.getPlayerList().get(sugorokuManager.getTurn()).getEnName().contentEquals("Otake"))){
				sugorokuManager.doUltimateOnePlayer(selectName);
			} else {
				sugorokuManager.doUltimateOnePlayer();
			}
			sugorokuManager.goNextPayer();
		}
	}

}
