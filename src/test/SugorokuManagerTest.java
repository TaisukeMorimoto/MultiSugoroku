package test;

import java.io.File;

import model.SugorokuManager;

public class SugorokuManagerTest {

	public static void main(String[] args) {

		// プレイヤー名の指定
		String[] players = {"ogata", "akase", "uesaka", "mori"};

		int nPlayer = players.length;
        String path = new File(".").getAbsoluteFile().getParent();
		String realPath = path + "/WebContent";
		SugorokuManager mgr = new SugorokuManager(realPath);
		mgr.InitSugorokuManager(nPlayer, "izakaya");

		System.out.println("");
		System.out.println("<<< 各キャラクターの生成 >>>");
		System.out.println("");
		try {
			 Thread.sleep(1000); // 10秒(1万ミリ秒)間だけ処理を止める
			} catch (InterruptedException e) {
			}
		// キャラクターの指定（プレイヤー数分）
		mgr.StartPlaying(players[0], players[1], players[2], players[3]);
		try {
			 Thread.sleep(3000); // 10秒(1万ミリ秒)間だけ処理を止める
			} catch (InterruptedException e) {
			}
		String selectName = "ogata";

		// サイコロをふる
		for (int i=0; i<nPlayer; i++) {
			System.out.println("");
			System.out.println("");
			System.out.println(mgr.getPlayerList().get(i).getName() + "のターン");
			System.out.println("");
			System.out.println("");
			try {
				 Thread.sleep(1000); // 10秒(1万ミリ秒)間だけ処理を止める
				} catch (InterruptedException e) {
				}
			System.out.println("<<< サイコロをふる >>>");
			System.out.println("");
			try {
				 Thread.sleep(1000); // 10秒(1万ミリ秒)間だけ処理を止める
				} catch (InterruptedException e) {
				}
			mgr.rollDiceOnePlayer();
			System.out.println("<<< サイコロをふった >>>");
			System.out.println("");
			try {
			 Thread.sleep(3000); // 10秒(1万ミリ秒)間だけ処理を止める
			} catch (InterruptedException e) {
			}
			System.out.println("");
			System.out.println("");
			System.out.println("===== 必殺技前のそれぞれの状態　======");
			for (int u=0; u<nPlayer; u++) {
				System.out.print(mgr.getPlayerList().get(u).getName());
				System.out.println(" の現在の状態");
				System.out.println("アルコール：" + mgr.getPlayerList().get(u).getBloodAlcLv() + "%");
				System.out.println("現在地：" + mgr.getPlayerList().get(u).getLocation() + "マス");
			}
			System.out.println("");
			System.out.println("");
			try {
				 Thread.sleep(3000); // 10秒(1万ミリ秒)間だけ処理を止める
				} catch (InterruptedException e) {
				}
			if ((mgr.getPlayerList().get(i).getUltimate1Target().equals("select") || (mgr.getPlayerList().get(i).getUltimate2Target().equals("select")))){
				mgr.doUltimateOnePlayer(selectName);
			} else {
				mgr.doUltimateOnePlayer();
			}
			try {
				 Thread.sleep(3000); // 10秒(1万ミリ秒)間だけ処理を止める
				} catch (InterruptedException e) {
				}
			}
			System.out.println("");
			System.out.println("");
			System.out.println("===== 必殺技後　======");
			for (int u=0; u<nPlayer; u++) {
				System.out.print(mgr.getPlayerList().get(u).getName());
				System.out.println(" の現在の状態");
				System.out.println("アルコール：" + mgr.getPlayerList().get(u).getBloodAlcLv() + "%");
				System.out.println("現在地：" + mgr.getPlayerList().get(u).getLocation() + "マス");
			}
			try {
				 Thread.sleep(4000); // 10秒(1万ミリ秒)間だけ処理を止める
				} catch (InterruptedException e) {
			}
			mgr.goNextPayer();
		}
	}


