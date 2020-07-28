package practice;

import java.util.ArrayList;

public class SugorokuManager {

	private static int SQUARE;
	private static int DICE_MAX;
	private UltimatePlayer player1;
	private UltimatePlayer player2;
	private UltimatePlayer player3;
	private UltimatePlayer player4;
	private Sugoroku sugoroku;
	private int nPlayer;
	private int turn = 1;
	private ArrayList<UltimatePlayer> playerList = new ArrayList<UltimatePlayer>();

	public SugorokuManager(int nPlayer) {
		// create sugoroku board
		sugoroku = new SugorokuNormal();
		SQUARE = SugorokuNormal.getSquare();
		DICE_MAX = SugorokuNormal.getDiceMax();
		this.nPlayer = nPlayer;
	}

	public void StartPlaying(String playerName) {
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, playerName);
		playerList.add(player1);
		nPlayer = 1;
	}

	public void StartPlaying(String playerName1, String playerName2) {
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, playerName1);
		playerList.add(player1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, playerName2);
		playerList.add(player2);
		nPlayer = 2;
	}

	public void StartPlaying(String playerName1, String playerName2, String playerName3) {
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, playerName1);
		playerList.add(player1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, playerName2);
		playerList.add(player2);
		player3 = new UltimatePlayer(SQUARE, DICE_MAX, playerName3);
		playerList.add(player3);
		nPlayer = 3;
	}

	public void StartPlaying(String playerName1, String playerName2, String playerName3, String playerName4) {
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, playerName1);
		playerList.add(player1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, playerName2);
		playerList.add(player2);
		player3 = new UltimatePlayer(SQUARE, DICE_MAX, playerName3);
		playerList.add(player3);
		player4 = new UltimatePlayer(SQUARE, DICE_MAX, playerName4);
		playerList.add(player4);
		nPlayer = 4;
	}

	public void rollDiceOnePlayer() {
		for (int i=1; i<=nPlayer; i++) {
			if (turn == i) {
				// if player status is rest
				if (playerList.get(i).getNowRest() != 0) {
					playerList.get(i).restOneTime();
				} else {
					// roll dice
					int dice = playerList.get(i).rollDice();
					// go forward
					playerList.get(i).goForward(dice);
					// drink liquor which is on the current location
					Liquor liq = sugoroku.getLiquorList().get(playerList.get(i).getLocation());
					playerList.get(i).drinkLiquor(liq);
					System.out.println("<" + playerList.get(i).getName() + ">dice: " + dice);
					System.out.println("<" + playerList.get(i).getName() + ">liquor name: " + liq.getLiquorName());
					System.out.println("<" + playerList.get(i).getName() + ">location: " + playerList.get(i).getLocation());
					System.out.println("<" + playerList.get(i).getName() + ">location: " + playerList.get(i).getBloodAlcLv());
				}
			}
		}
	}

	public void doUltimateOnePlayer(String enName) {
		for (int i=1; i<=nPlayer; i++) {
			if (turn == i) {
				// do ultimate skill
				/**
				 *  res = {param1, ultimate1Square, ultimate1Alc, numRest}
				 *  param1 =  1:all 2:me 3:select
				 */
				int[] res = playerList.get(i).doUltimate();

				// ultimate target is all players
				if (res[0] == 1) {
					for (int u=1; u<=nPlayer; u++) {
						// method which do not count when goforward in ultimate event
						playerList.get(i).goForwardForUltimate(res[1]);
						playerList.get(i).drinkLiquorForUltimate(res[2]);
						// set rest status
						playerList.get(i).setNowRest(res[3]);
					}
				}

				// ultimaete target is a select player　　ここから！！！
				if (res[0] == 3) {
					for (int u=1; u<=nPlayer; u++) {
						// method which do not count when goforward in ultimate event
						playerList.get(i).goForwardForUltimate(res[1]);
						playerList.get(i).drinkLiquorForUltimate(res[2]);
						// set rest status
						playerList.get(i).setNowRest(res[3]);
					}
				}
			}
		}
	}

	public void goNextPayer() {
		turn += 1;
		if (turn > nPlayer) {
			turn = 1;
		}
	}


}
