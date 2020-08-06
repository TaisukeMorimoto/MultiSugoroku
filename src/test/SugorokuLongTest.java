package test;

import model.SugorokuManager;

public class SugorokuLongTest {

	public static void main(String[] args) {
		// プレイヤー数の指定
		int nPlayer = 4;
		String realPath = null;
		SugorokuManager mgr = new SugorokuManager(realPath);
		mgr.InitSugorokuManager(nPlayer, "long");

		System.out.println(mgr.getSQUARE());

		// キャラクターの指定（プレイヤー数分）
		mgr.StartPlaying("miyashita", "katada", "suzuki", "otake");

	}

}
