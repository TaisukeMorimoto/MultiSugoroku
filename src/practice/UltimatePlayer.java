package practice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Random;

public class UltimatePlayer extends AbstractPlayer {

	// character status
	private String name;
	private String enName;

	// about my specialities
	private int specialitySpuares;
	private int specialityAlc;

	// about my ultimate skill
	private String ultimateName;
	private String ultimate1Target;
	private int ultimate1Squares1;
	private int ultimate1Squares2;
	private int ultimate1Alc;
	private boolean isUltimate2;
	private String ultimate2Target;
	private int ultimate2Squares;
	private int ultimate2Alc;
	private int isRest;
	private int ultimateGage;
	private String ultimateConditions;
	private boolean canUltimate = false;


	public UltimatePlayer(int SQUARE, int DICE_MAX, String enName) {
		super(SQUARE, DICE_MAX);
	    try {
	        File f = new File("src/csv/ultimate.csv");
	        BufferedReader br = new BufferedReader(new FileReader(f));
	        String line;
	        String[] title = br.readLine().split(",", 0);
	        // 1行ずつCSVファイルを読み込む
	        while ((line = br.readLine()) != null) {
	          String[] data = line.split(",", 0); // 行をカンマ区切りで配列に変換
	          if (data[1].equals(enName)){
	        	 name = data[0];
	        	 this.setEnName(data[1]);
	        	 ultimateName = data[2];
	        	 ultimate1Target = data[3];
	        	 ultimate1Squares1 = Integer.parseInt(data[5]);
	        	 ultimate1Squares2 = Integer.parseInt(data[6]);
	        	 ultimate1Alc = Integer.parseInt(data[7]);
	        	 isUltimate2 = Boolean.valueOf(data[8]).booleanValue();
	        	 ultimate2Target = data[9];
	        	 ultimate2Squares = Integer.parseInt(data[10]);
	        	 ultimate2Alc = Integer.parseInt(data[11]);
	        	 isRest = Integer.parseInt(data[12]);
	        	 ultimateGage = Integer.parseInt(data[13]);
	        	 ultimateConditions = data[14];
	          }
	        }
	        br.close();
	      } catch (IOException e) {
	        System.out.println(e + "in ultimate.csv");
	      }
	    try {
	        File f = new File("src/csv/specialities.csv");
	        BufferedReader br = new BufferedReader(new FileReader(f));
	        String line;
	        String[] title = br.readLine().split(",", 0);
	        // 1行ずつCSVファイルを読み込む
	        while ((line = br.readLine()) != null) {
	          String[] data = line.split(",", 0); // 行をカンマ区切りで配列に変換
	          if (data[1].equals(enName)){
	        	 name = data[0];
	        	 specialitySpuares = Integer.parseInt(data[2]);
	        	 specialityAlc = Integer.parseInt(data[3]);
	          }
	        }
	        br.close();
	      } catch (IOException e) {
	        System.out.println(e + "in specialities.csv");
	      }
	}

	/**
	 *  res = {param1, ultimate1Square, ultimate1Alc, isRest}
	 * param1 =  1:all 2:me 3:select
	 */
	public int[] doUltimate() {
		int[] res = {0, 0, 0, 0};
		if (canUltimate == false) {
			System.out.println("必殺技がまだ溜まってないから使えないよ");
		} else {
			System.out.println("<<<<" + name + "の必殺技!>>>>   " + ultimateName);
			res = doUltimate1();
			if (isUltimate2) {
				System.out.println("ultimate2あり");
				doUltimate2();
			}
			canUltimate = false;
		}
		return res;
	}

	/**
	 *  res = {param1, ultimate1Square, ultimate1Alc, isRest}
	 * param1 =  1:all 2:me 3:select
	 */
	public int[] doUltimate1(){
		int res[] = {0, 0, 0, 0};
		if (ultimate1Target.equals("all")) {
			bloodAlcLv += ultimate1Alc;
			int[] array = {ultimate1Squares1, ultimate1Squares2};
			int rnd = new Random().nextInt(array.length);
			goForwardForUltimate(array[rnd]); // go forward square1 or square2 at ramdom
			res[0] = 1;
			res[1] = array[rnd];
			res[2] = ultimate1Alc;
		} else if (ultimate1Target.equals("me")) {
			bloodAlcLv += ultimate1Alc;
			int[] array = {ultimate1Squares1, ultimate1Squares2};
			int rnd = new Random().nextInt(array.length);
			goForwardForUltimate(array[rnd]); // go forward square1 or square2 at ramdom
			res[0] = 2;
			res[1] = 0;
			res[2] = 0;
		} else {
			int[] array = {ultimate1Squares1, ultimate1Squares2};
			int rnd = new Random().nextInt(array.length);
			res[0] = 3;
			res[1] = array[rnd];
			res[2] = ultimate1Alc;
 		}
		return res;
	}

	/**
	 *  res = {param1, ultimate1Square, ultimate1Alc, isRest}
	 * param1 =  1:all 2:me 3:select
	 */
	public int[] doUltimate2(){
		int res[] = {0, 0, 0, 0};
		if (ultimate2Target.equals("all")) {
			System.out.println("the ultimate2 case is not yet implemented");
		} else if (ultimate2Target.equals("me")) {
			System.out.println("the ultimate2 case is not yet implemented");
		} else {
			res[0] = 3;
			res[1] = ultimate2Squares;
			res[2] = ultimate2Alc;
			res[3] = isRest;
 		}
		return res;
	}

	@Override
	public void goForward(int dice) {
		// update location and locationArray
		locationArray[location] = false;
		System.out.println(name + "の特性により、さいころの目が" + specialitySpuares);
		location += dice + specialitySpuares;
		// if location is over goal
		if (location >= SQUARE - 1) {
			location = SQUARE - 1;
		}
		locationArray[location] = true;
		count++;
	}

	/**
	 * do not count when go forward in ultimate event
	 * @param dice
	 */
	public void goForwardForUltimate(int dice) {
		// update location and locationArray
		locationArray[location] = false;
		System.out.println(name + "の特性により、さいころの目が" + specialitySpuares);
		location += dice + specialitySpuares;
		// if location is over goal
		if (location >= SQUARE - 1) {
			location = SQUARE - 1;
		}
		locationArray[location] = true;
	}

	@Override
	public void drinkLiquor(Liquor liquor) {
		System.out.println(name + "の特性により、アルコール濃度が" + specialityAlc);
		bloodAlcLv += liquor.getLiquorAlcLv() + specialityAlc;
		if (bloodAlcLv < 0) {
			bloodAlcLv = 0;
		}
		if ("above".equals(ultimateConditions)) {
			if (bloodAlcLv > ultimateGage) {
				canUltimate = true;
			}
		} else {
			if (bloodAlcLv < ultimateGage) {
				canUltimate = true;
			}
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSpecialitySpuares() {
		return specialitySpuares;
	}

	public void setSpecialitySpuares(int specialitySpuares) {
		this.specialitySpuares = specialitySpuares;
	}

	public int getSpecialityAlc() {
		return specialityAlc;
	}

	public void setSpecialityAlc(int specialityAlc) {
		this.specialityAlc = specialityAlc;
	}

	public String getUltimateName() {
		return ultimateName;
	}

	public void setUltimateName(String ultimateName) {
		this.ultimateName = ultimateName;
	}

	public String getUltimate1Target() {
		return ultimate1Target;
	}

	public void setUltimate1Target(String ultimate1Target) {
		this.ultimate1Target = ultimate1Target;
	}

	public int getUltimate1Squares1() {
		return ultimate1Squares1;
	}

	public void setUltimate1Squares1(int ultimate1Squares1) {
		this.ultimate1Squares1 = ultimate1Squares1;
	}

	public int getUltimate1Squares2() {
		return ultimate1Squares2;
	}

	public void setUltimate1Squares2(int ultimate1Squares2) {
		this.ultimate1Squares2 = ultimate1Squares2;
	}

	public int getUltimate1Alc() {
		return ultimate1Alc;
	}

	public void setUltimate1Alc(int ultimate1Alc) {
		this.ultimate1Alc = ultimate1Alc;
	}

	public boolean isUltimate2() {
		return isUltimate2;
	}

	public void setUltimate2(boolean isUltimate2) {
		this.isUltimate2 = isUltimate2;
	}

	public String getUltimate2Target() {
		return ultimate2Target;
	}

	public void setUltimate2Target(String ultimate2Target) {
		this.ultimate2Target = ultimate2Target;
	}

	public int getUltimate2Squares() {
		return ultimate2Squares;
	}

	public void setUltimate2Squares(int ultimate2Squares) {
		this.ultimate2Squares = ultimate2Squares;
	}

	public int getUltimate2Alc() {
		return ultimate2Alc;
	}

	public void setUltimate2Alc(int ultimate2Alc) {
		this.ultimate2Alc = ultimate2Alc;
	}

	public int getIsRest() {
		return isRest;
	}

	public void setIsRest(int isRest) {
		this.isRest = isRest;
	}

	public int getUltimateGage() {
		return ultimateGage;
	}

	public void setUltimateGage(int ultimateGage) {
		this.ultimateGage = ultimateGage;
	}

	public String getUltimateConditions() {
		return ultimateConditions;
	}

	public void setUltimateConditions(String ultimateConditions) {
		this.ultimateConditions = ultimateConditions;
	}

	public boolean isCanUltimate() {
		return canUltimate;
	}

	public void setCanUltimate(boolean canUltimate) {
		this.canUltimate = canUltimate;
	}

	public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}


}