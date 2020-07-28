package practice;

public class SugorokuManager {

	private UltimatePlayer player1;
	private UltimatePlayer player2;
	private UltimatePlayer player3;
	private UltimatePlayer player4;
	private Sugoroku sugoroku;
	private int[] turn;

	public SugorokuManager(String playerName) {

		// create sugoroku board
		SugorokuNormal sugoroku = new SugorokuNormal();
		int SQUARE = SugorokuNormal.getSquare();
		int DICE_MAX = SugorokuNormal.getDiceMax();
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, playerName);
	}

	public SugorokuManager(String playerName1, String playerName2) {

		// create sugoroku board
		sugoroku = new SugorokuNormal();
		int SQUARE = SugorokuNormal.getSquare();
		int DICE_MAX = SugorokuNormal.getDiceMax();
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, playerName1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, playerName2);
	}

	public SugorokuManager(String playerName1, String playerName2, String playerName3) {

		// create sugoroku board
		sugoroku = new SugorokuNormal();
		int SQUARE = SugorokuNormal.getSquare();
		int DICE_MAX = SugorokuNormal.getDiceMax();
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, playerName1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, playerName2);
		player3 = new UltimatePlayer(SQUARE, DICE_MAX, playerName3);
	}

	public SugorokuManager(String playerName1, String playerName2, String playerName3, String playerName4) {

		// create sugoroku board
		sugoroku = new SugorokuNormal();
		int SQUARE = SugorokuNormal.getSquare();
		int DICE_MAX = SugorokuNormal.getDiceMax();
		// generate player
		player1 = new UltimatePlayer(SQUARE, DICE_MAX, playerName1);
		player2 = new UltimatePlayer(SQUARE, DICE_MAX, playerName2);
		player3 = new UltimatePlayer(SQUARE, DICE_MAX, playerName3);
		player4 = new UltimatePlayer(SQUARE, DICE_MAX, playerName4);
	}



}
