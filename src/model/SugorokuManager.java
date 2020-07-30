package model;

import java.util.ArrayList;

import entity.Liquor;
import entity.Sugoroku;
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

	public SugorokuManager() {
	}

	public SugorokuManager(String realPath) {
		this.realPath = realPath;
	}

	public void InitSugorokuManager(int nPlayer) {
		// create sugoroku board
		sugoroku = new SugorokuNormal(realPath);
		SQUARE = SugorokuNormal.getSquare();
		DICE_MAX = SugorokuNormal.getDiceMax();
		this.nPlayer = nPlayer;
		for (int i=0; i<nPlayer; i++) {
			playerNameList.add("a");
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

	public void rollDiceOnePlayer() {
		for (int i=0; i<=nPlayer; i++) {
			if (turn == i) {
				// if player status is rest
				if (playerList.get(i).getNowRest() != 0) {
					playerList.get(i).restOneTime();
				} else {
					// roll dice
					int dice = playerList.get(i).rollDice();
					System.out.println("<" + playerList.get(i).getName() + ">dice: " + dice);
					// go forward
					playerList.get(i).goForward(dice);
					// drink liquor which is on the current location
					Liquor liq = sugoroku.getLiquorList().get(playerList.get(i).getLocation());
					playerList.get(i).drinkLiquor(liq);
					System.out.println("<" + playerList.get(i).getName() + ">liquor name: " + liq.getLiquorName()
					+ ": " + liq.getLiquorAlcLv() + "%");
					System.out.println("<" + playerList.get(i).getName() + ">location: " + playerList.get(i).getLocation());
					System.out.println("<" + playerList.get(i).getName() + ">bloodAlcLv: " + playerList.get(i).getBloodAlcLv() + "%");
				}
			}
		}
	}

	public void goNextPayer() {
		turn += 1;
		if (turn >= nPlayer) {
			turn = 0;
		}
	}

	// do ultimate when ultimate1 target is select type
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
				} else if (res[0] == 2) {
					reflectUltimate1ToMe(res, i);
				} else if (res[0] == 3) {
					reflectUltimate1ToSelect(enName, res);
				}
				if (res[3] == 1) {
					reflectUltimate2ToAll(res);
				} else if (res[3] == 2) {
					reflectUltimate2ToMe(res, i);
				} else if (res[3] == 3) {
					reflectUltimate2ToSelect(enName, res);
				}
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
				} else if (res[0] == 2) {
					reflectUltimate1ToMe(res, i);
				} else if (res[0] == 3) {
					System.out.println("logic error: branch not specified in doUltimate1");
//					reflectUltimate1ToSelect(enName, res);
				}
				if (res[3] == 1) {
					reflectUltimate2ToAll(res);
				} else if (res[3] == 2) {
					reflectUltimate2ToMe(res, i);
				} else if (res[3] == 3) {
					System.out.println("logic error: branch not specified in doUltimate2");
//					reflectUltimate2ToSelect(enName, res);
				}
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
