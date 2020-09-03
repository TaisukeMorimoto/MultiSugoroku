package model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import entity.EachCharacter;
import entity.Liquor;
import entity.Sugoroku;
import entity.Sugoroku1p;
import entity.SugorokuNormal;
import entity.UltimatePlayer;

public class SugorokuManager {

	private int SQUARE;
	private int DICE_MAX;
	private int limitAlcLv = 20;
	private int overNum = 100;
	private UltimatePlayer player1;
	private UltimatePlayer player2;
	private UltimatePlayer player3;
	private UltimatePlayer player4;
	private Sugoroku sugoroku;
	private int nPlayer;
	private int turn = 0;
	private int selectPlayer = 1;
	private String realPath;
	private ArrayList<String> playerNameList = new ArrayList<String>();
	private ArrayList<UltimatePlayer> playerList = new ArrayList<UltimatePlayer>();
	private ArrayList<EachCharacter> allCharacterList = new ArrayList<EachCharacter>();

	public SugorokuManager() {
	}

	public SugorokuManager(String realPath) {
    	if (realPath == null) {
	    	String path = new File(".").getAbsoluteFile().getParent();
    		this.realPath = path + "/WebContent";
    	} else {
    		this.realPath = realPath;
    	}
	}

	public void InitSugorokuManager(int nPlayer, String course) {
		// create sugoroku board
		if (nPlayer == 1) {
			String csvPath = "/WEB-INF/csv/liquor1p.csv";
			sugoroku = new Sugoroku1p(realPath, csvPath);
			System.out.println("sugoroku board for 1p");
			System.out.println("csvPath: " + csvPath);
			System.out.println(sugoroku.getSQUARE()+" square");
		} else if (course.equals("izakaya")) {
			String csvPath = "/WEB-INF/csv/liquorIzakaya.csv";
			sugoroku = new SugorokuNormal(realPath, csvPath);
			System.out.println("generate normal sugoroku board which has izakaya-type liquor");
			System.out.println("csvPath: " + csvPath);
			System.out.println(sugoroku.getSQUARE()+" square");
		} else if (course.equals("bar")) {
			String csvPath = "/WEB-INF/csv/liquorBar.csv";
			sugoroku = new SugorokuNormal(realPath, csvPath);
			System.out.println("generate normal sugoroku board which has bar-type liquor");
			System.out.println("csvPath: " + csvPath);
			System.out.println(sugoroku.getSQUARE()+" square");
		} else if (course.equals("home")) {
			String csvPath = "/WEB-INF/csv/liquorHome.csv";
			sugoroku = new SugorokuNormal(realPath, csvPath);
			System.out.println("generate normal sugoroku board which has home-type liquor");
			System.out.println("csvPath: " + csvPath);
			System.out.println(sugoroku.getSQUARE()+" square");
		} else {
			System.out.println("the course hasn't implemented yet");
		}
		SQUARE = sugoroku.getSQUARE();
		DICE_MAX = SugorokuNormal.getDiceMax();
		this.nPlayer = nPlayer;
		for (int i=0; i<nPlayer; i++) {
			playerNameList.add("");
		}
	}

	public void StartPlaying(String playerName) {
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName);
		playerList.add(player1);
		nPlayer = 1;
	}

	public void StartPlaying(String playerName1, String playerName2) {
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName1);
		playerList.add(player1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName2);
		playerList.add(player2);
		nPlayer = 2;
	}

	public void StartPlaying(String playerName1, String playerName2, String playerName3) {
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName1);
		playerList.add(player1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName2);
		playerList.add(player2);
		player3 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName3);
		playerList.add(player3);
		nPlayer = 3;
	}

	public void StartPlaying(String playerName1, String playerName2, String playerName3, String playerName4) {
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName1);
		playerList.add(player1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName2);
		playerList.add(player2);
		player3 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName3);
		playerList.add(player3);
		player4 = new UltimatePlayer(SQUARE, DICE_MAX, realPath, playerName4);
		playerList.add(player4);
		nPlayer = 4;
	}

	public boolean checkAllDie() {
		boolean isAllDie = true;
		for (int i = 0; i<nPlayer; i++) {
			if (playerList.get(i).getNowRest() < 50) {
				isAllDie = false;
				break;
			}
		}
		return isAllDie;
	}

	public void restOnePlayer() {
		for (int i=0; i<=nPlayer; i++) {
			if (turn == i) {
				// if player status is rest
				if (playerList.get(i).getNowRest() != 0) {
					playerList.get(i).restOneTime();
				}
			}
		}
	}

	public void rollDiceOnePlayer() {
		for (int i=0; i<=nPlayer; i++) {
			if (turn == i) {
				// if player status is rest
//				if (playerList.get(i).getNowRest() != 0) {
//					playerList.get(i).restOneTime();
//				} else {
					// roll dice
					int dice = playerList.get(i).rollDice();
					System.out.println("<" + playerList.get(i).getName() + ">サイコロの出た目: " + dice);
					// go forward
					playerList.get(i).goForward(dice);
					// drink liquor which is on the current location
					Liquor liq = sugoroku.getLiquorList().get(playerList.get(i).getLocation());
					playerList.get(i).drinkLiquor(liq);
					System.out.println("<" + playerList.get(i).getName() + ">飲む飲み物: " + liq.getLiquorName()
					+ ": " + liq.getLiquorAlcLv() + "%");
					System.out.println("<" + playerList.get(i).getName() + ">現在地: " + playerList.get(i).getLocation());
					System.out.println("<" + playerList.get(i).getName() + ">アルコールレベル: " + playerList.get(i).getBloodAlcLv() + "%");
//				}
			}
		}
	}

	public void goNextPayer() {
		System.out.println("<"+playerList.get(turn).getName()+"> go next player");
		turn += 1;
		if (turn >= nPlayer) {
			turn = 0;
		}
		System.out.println("<"+playerList.get(turn).getName()+"> start next player");
	}

	// do ultimate when ultimate1 or ultimate2 target is select type
	public void doUltimateOnePlayer(String enName) {
		for (int i=0; i<=nPlayer; i++) {
			if (turn == i) {
				// do ultimate skill
				/**
				 *  res = {param1, ultimate1Square, ultimate1Alc,
				 *  	   param2, ultimate2Square, ultimate2Alc, numRest}
				 * param1 =  1:all 2:me 3:select
				 */
				int[] res = playerList.get(i).doUltimate();

				if (res[0] == 1) {
					reflectUltimate1ToAll(res);
					System.out.println("対象1：全員");
				} else if (res[0] == 2) {
					reflectUltimate1ToMe(res, i);
					System.out.println("対象1：自分");
				} else if (res[0] == 3) {
					reflectUltimate1ToSelect(enName, res);
					System.out.println("対象1：選択");
				}
				if (res[3] == 1) {
					reflectUltimate2ToAll(res);
					System.out.println("対象2：全員");
				} else if (res[3] == 2) {
					reflectUltimate2ToMe(res, i);
					System.out.println("対象2：自分");
				} else if (res[3] == 3) {
					reflectUltimate2ToSelect(enName, res);
					System.out.println("対象2：選択");
				}
				playerList.get(i).setCanUltimate(false);
			}
		}
	}

	public void doUltimateOnePlayer() {
		for (int i=0; i<=nPlayer; i++) {
			if (turn == i) {
				// do ultimate skill
				/**
				 *  res = {param1, ultimate1Square, ultimate1Alc,
				 *  	   param2, ultimate2Square, ultimate2Alc, numRest}
				 * param1 =  1:all 2:me 3:select
				 */
				int[] res = playerList.get(i).doUltimate();

				if (res[0] == 1) {
					reflectUltimate1ToAll(res);
					System.out.println("対象1：全員");
				} else if (res[0] == 2) {
					reflectUltimate1ToMe(res, i);
					System.out.println("対象1：自分");
				} else if (res[0] == 3) {
					System.out.println("logic error: have to input selected name");
//					reflectUltimate1ToSelect(enName, res);
				}
				if (res[3] == 1) {
					reflectUltimate2ToAll(res);
					System.out.println("対象2：全員");
				} else if (res[3] == 2) {
					reflectUltimate2ToMe(res, i);
					System.out.println("対象2：自分");
				} else if (res[3] == 3) {
					System.out.println("logic error: have to input selected name");
//					reflectUltimate2ToSelect(enName, res);
				}
				playerList.get(i).setCanUltimate(false);
			}
		}
	}

	// ultimate1 target is all players
	public void reflectUltimate1ToAll(int[] res) {
		for (int u=0; u<=nPlayer-1; u++) {
			// method which do not count when goforward in ultimate event
			playerList.get(u).goForwardForUltimate(res[1]);
			playerList.get(u).drinkLiquorForUltimate(res[2]);
	}
}

	// ultimate2 target is all players
	public void reflectUltimate2ToAll(int[] res){
		for (int u=0; u<=nPlayer-1 ; u++) {
			// method which do not count when goforward in ultimate event
			playerList.get(u).goForwardForUltimate(res[4]);
			playerList.get(u).drinkLiquorForUltimate(res[5]);
			// set rest status
			playerList.get(u).setNowRest(res[6]);
		}
	}

	// ultimate1 target is me
	public void reflectUltimate1ToMe(int[] res, int i) {
		// method which do not count when goforward in ultimate event
		playerList.get(i).goForwardForUltimate(res[1]);
		playerList.get(i).drinkLiquorForUltimate(res[2]);
}

	// ultimate2 target is me
	public void reflectUltimate2ToMe(int[] res, int i){
		// method which do not count when goforward in ultimate event
		playerList.get(i).goForwardForUltimate(res[4]);
		playerList.get(i).drinkLiquorForUltimate(res[5]);
		// set rest status
		playerList.get(i).setNowRest(res[6]);
	}

	// ultimaete1 target is a select player
	public void reflectUltimate1ToSelect(String enName, int[] res) {
		for (int u=0; u<=nPlayer-1; u++) {
			if (enName.equals(playerList.get(u).getEnName())){
				// method which do not count when goforward in ultimate event
				playerList.get(u).goForwardForUltimate(res[1]);
				playerList.get(u).drinkLiquorForUltimate(res[2]);
			}
		}
	}

	// ultimaete2 target is a select player
	public void reflectUltimate2ToSelect(String enName, int[] res) {
		for (int u=0; u<=nPlayer-1; u++) {
			if (enName.equals(playerList.get(u).getEnName())){
				// method which do not count when goforward in ultimate event
				playerList.get(u).goForwardForUltimate(res[4]);
				playerList.get(u).drinkLiquorForUltimate(res[5]);
				// set rest status
				playerList.get(u).setNowRest(res[6]);
			}
		}
	}

	public void setAllCharacterList() {
	    try {
	    	File f = new File(realPath + "/WEB-INF/csv/specialities.csv");
	        BufferedReader br = new BufferedReader(new FileReader(f));
	        String line;
	        String[] title = br.readLine().split(",", 0);
	        // 1行ずつCSVファイルを読み込む
	        while ((line = br.readLine()) != null) {
	          String[] data = line.split(",", 0); // 行をカンマ区切りで配列に変換
	          EachCharacter character = new EachCharacter(data[0], data[1], data[2], Integer.parseInt(data[4]), Integer.parseInt(data[5]));
	          allCharacterList.add(character);
	        }
	        br.close();
	      } catch (IOException e) {
	        System.out.println(e);
	      }
	}

	public ArrayList<EachCharacter> getAllCharacterList(){
		return allCharacterList;
	}

	public Sugoroku getSugoroku() {
		return sugoroku;
	}

	public void setSugoroku(Sugoroku sugoroku) {
		this.sugoroku = sugoroku;
	}

	public int getnPlayer() {
		return nPlayer;
	}

	public void setnPlayer(int nPlayer) {
		this.nPlayer = nPlayer;
	}

	public int getTurn() {
		return turn;
	}

	public void setTurn(int turn) {
		this.turn = turn;
	}

	public ArrayList<UltimatePlayer> getPlayerList() {
		return playerList;
	}

	public void setPlayerList(ArrayList<UltimatePlayer> playerList) {
		this.playerList = playerList;
	}

	public int getSelectPlayer() {
		return selectPlayer;
	}

	public void setSelectPlayer(int selectPlayer) {
		this.selectPlayer = selectPlayer;
	}

	public ArrayList<String> getPlayerNameList() {
		return playerNameList;
	}

	public void setPlayerNameList(ArrayList<String> playerNameList) {
		this.playerNameList = playerNameList;
	}

	public String getRealPath() {
		return realPath;
	}

	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}

	public int getLimitAlcLv() {
		return limitAlcLv;
	}

	public void setLimitAlcLv(int limitAlcLv) {
		this.limitAlcLv = limitAlcLv;
	}

	public int getSQUARE() {
		return SQUARE;
	}

	public void setSQUARE(int sQUARE) {
		SQUARE = sQUARE;
	}

	public int getDICE_MAX() {
		return DICE_MAX;
	}

	public void setDICE_MAX(int dICE_MAX) {
		DICE_MAX = dICE_MAX;
	}

	public int getOverNum() {
		return overNum;
	}

	public void setOverNum(int overNum) {
		this.overNum = overNum;
	}

}
