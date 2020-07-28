package practice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

public class SugorokuNormal implements Sugoroku {

	private static final int SQUARE = 25 + 1;
	private static final int DICE_MAX = 6;
	private ArrayList<Liquor> liquorList = new ArrayList<Liquor>();

	public SugorokuNormal() {

		ArrayList<Liquor> liquorAllList = getLiquorAllList();
		for (int i = 0; i < SQUARE ; i++) {
			// move liquor instance from allList to liquorList at random
			liquorList.add(liquorAllList.get(new Random().nextInt(liquorAllList.size())));
		}
	}

	static ArrayList<Liquor> getLiquorAllList() {
		ArrayList<Liquor> liquorAllList = new ArrayList<Liquor>();
	    try {
	        File f = new File("src/csv/liquor.csv");
	        BufferedReader br = new BufferedReader(new FileReader(f));
	        String line;
	        String[] title = br.readLine().split(",", 0);
	        // 1行ずつCSVファイルを読み込む
	        while ((line = br.readLine()) != null) {
	          String[] data = line.split(",", 0); // 行をカンマ区切りで配列に変換
	          Liquor liquor = new Liquor(data[0], Integer.parseInt(data[1]), data[2]);
	          liquorAllList.add(liquor);
	        }
	        br.close();
	      } catch (IOException e) {
	        System.out.println(e);
	      }
		return liquorAllList;
	}

	@Override
	public ArrayList<Liquor> getLiquorList() {
		return liquorList;
	}

	public static int getSquare() {
		return SQUARE;
	}

	public static int getDiceMax() {
		return DICE_MAX;
	}

}
