package entity;

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
	private String specialityText;

	// about my ultimate skill
	private String ultimateName;
	private String ultimateText;
	private boolean isUltimate1;
	private String ultimate1Target;
	private int ultimate1Squares1;
	private int ultimate1Squares2;
	private int ultimate1Alc;
	private boolean isUltimate2;
	private String ultimate2Target;
	private int ultimate2Squares;
	private int ultimate2Alc;
	private int numRest;
	private int nowRest = 0; // 0:normal 1:last rest tern 2:...
	private int ultimateAlcGage;
	private int ultimateSquaresGage;
	private String ultimateConditions;
	private boolean canUltimate = false;
	private int numUltimate = 1;


	public UltimatePlayer(int SQUARE, int DICE_MAX, String realPath, String enName) {
		super(SQUARE, DICE_MAX);
		File f;
	    try {
	    	f = new File(realPath + "/WEB-INF/csv/ultimate3.csv");
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
	        	 ultimateText = data[3];
	        	 isUltimate1 = Boolean.valueOf(data[4]).booleanValue();;
	        	 ultimate1Target = data[5];
	        	 ultimate1Squares1 = Integer.parseInt(data[6]);
	        	 ultimate1Squares2 = Integer.parseInt(data[7]);
	        	 ultimate1Alc = Integer.parseInt(data[8]);
	        	 isUltimate2 = Boolean.valueOf(data[9]).booleanValue();
	        	 ultimate2Target = data[10];
	        	 ultimate2Squares = Integer.parseInt(data[11]);
	        	 ultimate2Alc = Integer.parseInt(data[12]);
	        	 numRest = Integer.parseInt(data[13]);
	        	 ultimateAlcGage = Integer.parseInt(data[14]);
	        	 ultimateSquaresGage = Integer.parseInt(data[15]);
	        	 ultimateConditions = data[16];
	          }
	        }
	        System.out.println(name + "を生成した。");
	        System.out.println(name + " は必殺技 " + ultimateName + " を持っている");
	        br.close();
	      } catch (IOException e) {
	        System.out.println(e + "in ultimate.csv");
	      }
	    try {
	    	f = new File(realPath + "/WEB-INF/csv/specialities.csv");
	        BufferedReader br = new BufferedReader(new FileReader(f));
	        String line;
	        String[] title = br.readLine().split(",", 0);
	        // 1行ずつCSVファイルを読み込む
	        while ((line = br.readLine()) != null) {
	          String[] data = line.split(",", 0); // 行をカンマ区切りで配列に変換
	          if (data[1].equals(enName)){
	        	 name = data[0];
	        	 specialityText = data[3];
	        	 specialitySpuares = Integer.parseInt(data[4]);
	        	 specialityAlc = Integer.parseInt(data[5]);
	          }
	        }
	        br.close();
	      } catch (IOException e) {
	        System.out.println(e + "in specialities.csv");
	      }
	}

	/**
	 *  res = {param1, ultimate1Square, ultimate1Alc,
	 *  	   param2, ultimate2Square, ultimateAlc, numRest}
	 * param1 =  1:all 2:me 3:select
	 */
	public int[] doUltimate() {
		int[] res1 = {0, 0, 0};
		int[] res2 = {0, 0, 0, 0};
		if (canUltimate) {
			System.out.println("<<<<" + name + "の必殺技>>>>   " + ultimateName);
			if(isUltimate1) {
				System.out.println("必殺技①あり");
				res1 = doUltimate1();
			}
			if (isUltimate2) {
				System.out.println("必殺技②あり");
				res2 = doUltimate2();
			}
			canUltimate = false;
			numUltimate -= 1;
		} else {
			System.out.println("必殺技がまだ溜まってないから使えない");
		}
		int[] res = new int[res1.length + res2.length];
		System.arraycopy(res1, 0, res, 0, res1.length);
		System.arraycopy(res2, 0, res, res1.length, res2.length);
//		System.out.println("isUltimate1: " + isUltimate1);
//		System.out.println("isUltimate2: " + isUltimate2);
//		System.out.println("ultimate1 target: " + res[0]);
//		System.out.println("ultimate1 square: " + res[1]);
//		System.out.println("ultimate1 alc: " + res[2]);
//		System.out.println("ultimate2 target: " + res[3]);
//		System.out.println("ultimate2 square: " + res[4]);
//		System.out.println("ultimate2 alc: " + res[5]);
//		System.out.println("ultimate2 rest: " + res[6]);
		return res;
	}

	/**
	 *  res = {param1, ultimate1Square, ultimate1Alc, numRest}
	 * param1 =  1:all 2:me 3:select
	 */
	public int[] doUltimate1(){
		int res[] = {0, 0, 0};
		if (ultimate1Target.equals("all")) {
//			drinkLiquorForUltimate(ultimate1Alc);
			int[] array = {ultimate1Squares1, ultimate1Squares2};
			int rnd = new Random().nextInt(array.length);
//			goForwardForUltimate(array[rnd]); // go forward square1 or square2 at ramdom
			res[0] = 1;
			res[1] = array[rnd];
			res[2] = ultimate1Alc;
		} else if (ultimate1Target.equals("me")) {
//			drinkLiquorForUltimate(ultimate1Alc);
			int[] array = {ultimate1Squares1, ultimate1Squares2};
			int rnd = new Random().nextInt(array.length);
//			goForwardForUltimate(array[rnd]); // go forward square1 or square2 at ramdom
			res[0] = 2;
			res[1] = array[rnd];
			res[2] = ultimate1Alc;
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
	 *  res = {param2, ultimate2Square, ultimate2Alc, numRest}
	 * param1 =  1:all 2:me 3:select
	 */
	public int[] doUltimate2(){
		int res[] = {0, 0, 0, 0};
		if (ultimate2Target.equals("all")) {
//			drinkLiquorForUltimate(ultimate2Alc);
//			goForwardForUltimate(ultimate2Squares);
//			nowRest += numRest;
			res[0] = 1;
			res[1] = ultimate2Squares;
			res[2] = ultimate2Alc;
			res[3] = numRest;
		} else if (ultimate2Target.equals("me")) {
//			bloodAlcLv += ultimate2Alc;
//			goForwardForUltimate(ultimate2Squares);
//			nowRest += numRest;
			res[0] = 2;
			res[1] = ultimate2Squares;
			res[2] = ultimate2Alc;
			res[3] = numRest;
		} else {
			res[0] = 3;
			res[1] = ultimate2Squares;
			res[2] = ultimate2Alc;
			res[3] = numRest;
 		}
		return res;
	}

	public void restOneTime() {
		if (nowRest != 0) {
			System.out.println("<"+this.getName()+"> 一回休む");
			nowRest--;
			count++;
		}
	}

	@Override
	public void goForward(int dice) {
		// update location and locationArray
		locationArray[location] = false;
		System.out.println("<" + name + "> マス特性: " + specialitySpuares);
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
		location += dice;
		// if location is over goal
		if (location >= SQUARE - 1) {
			location = SQUARE - 1;
		} else if (location < 0) {
			location = 0;
		}
		locationArray[location] = true;
	}

	@Override
	public void drinkLiquor(Liquor liquor) {
		System.out.println("<" + name + ">アルコール特性: " + specialityAlc);
		bloodAlcLv += liquor.getLiquorAlcLv() + specialityAlc;
		if (bloodAlcLv < 0) {
			bloodAlcLv = 0;
		}
		System.out.println("以上か以下か: " + ultimateConditions);
		System.out.println("マス条件: " + ultimateSquaresGage);
		System.out.println("アルコール条件: " + ultimateAlcGage);
		// ＜以上＞の必殺技判定
		if ("above".equals(ultimateConditions)) {
			// ＜マス＞の判定
			if ((ultimateAlcGage == 0) && (numUltimate != 0))  {
				if (location >= ultimateSquaresGage) {
					System.out.println("マス条件（以上）true：" + location);
					canUltimate = true;
				} else {
					System.out.println("マス条件（以下）false：" + location);
					canUltimate = false;
				}
			}
			// <アルコール>の判定
			if ((ultimateSquaresGage == 0) && (numUltimate != 0)) {
				if (bloodAlcLv >= ultimateAlcGage) {
					System.out.println("アルコール条件（以上）true：" + bloodAlcLv);
					canUltimate = true;
				} else {
					System.out.println("アルコール条件（以下）false：" + bloodAlcLv);
					canUltimate = false;
				}
			}
		}
		// ＜以下＞の必殺技判定
		if ("below".equals(ultimateConditions)) {
			// ＜マス＞の判定
			if ((ultimateAlcGage == 0) && (numUltimate != 0))  {
				if (location <= ultimateSquaresGage) {
					System.out.println("マス条件（以下）true：" + location);
					canUltimate = true;
				} else {
					System.out.println("マス条件（以上）false：" + location);
					canUltimate = false;
				}
			}
			// <ゲージ>の判定
			if ((ultimateSquaresGage == 0) && (numUltimate != 0)) {
				if (bloodAlcLv <= ultimateAlcGage) {
					System.out.println("アルコール条件（以下）true：" + bloodAlcLv);
					canUltimate = true;
				} else {
					System.out.println("アルコール条件（以下）false：" + bloodAlcLv);
					canUltimate = false;
				}
			}
		}

	}


	public void drinkLiquorForUltimate(int alc) {
		System.out.println(name + "は現在" + bloodAlcLv + "%");
		System.out.println(name + "は必殺技により" + alc +"%飲む");
		bloodAlcLv += alc;
		if (bloodAlcLv < 0) {
			bloodAlcLv = 0;
		}
		if ("above".equals(ultimateConditions)) {
			if ((ultimateAlcGage == 0) && (location >= ultimateSquaresGage) && (numUltimate != 0))  {
				canUltimate = true;
			} else if ((ultimateSquaresGage == 0) && (bloodAlcLv >= ultimateAlcGage) && (numUltimate != 0)){
				canUltimate = true;
			}
		} else {
			if ((ultimateAlcGage == 0) && (location <= ultimateSquaresGage) && (numUltimate != 0))  {
				canUltimate = true;
			} else if ((ultimateSquaresGage == 0) && (bloodAlcLv <= ultimateAlcGage) && (numUltimate != 0)){
				canUltimate = true;
			}
		}
		System.out.println(name + "は現在" + bloodAlcLv + "%");
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

	public int getnumRest() {
		return numRest;
	}

	public void setNumRest(int numRest) {
		this.numRest = numRest;
	}



	public int getUltimateAlcGage() {
		return ultimateAlcGage;
	}

	public void setUltimateAlcGage(int ultimateAlcGage) {
		this.ultimateAlcGage = ultimateAlcGage;
	}

	public int getUltimateSquaresGage() {
		return ultimateSquaresGage;
	}

	public void setUltimateSquaresGage(int ultimateSquaresGage) {
		this.ultimateSquaresGage = ultimateSquaresGage;
	}

	public String getUltimateConditions() {
		return ultimateConditions;
	}

	public void setUltimateConditions(String ultimateConditions) {
		this.ultimateConditions = ultimateConditions;
	}

	public boolean getCanUltimate() {
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

	public int getNowRest() {
		System.out.println("<" + name + "> nowrest: " + nowRest);
		return nowRest;
	}

	public void setNowRest(int nowRest) {
		this.nowRest = nowRest;
	}

	public int getNumRest() {
		return numRest;
	}

	public String getUltimateText() {
		return ultimateText;
	}

	public void setUltimateText(String ultimateText) {
		this.ultimateText = ultimateText;
	}

	public int getNumUltimate() {
		return numUltimate;
	}

	public void setNumUltimate(int numUltimate) {
		this.numUltimate = numUltimate;
	}

	public String getSpecialityText() {
		return specialityText;
	}

	public void setSpecialityText(String specialityText) {
		this.specialityText = specialityText;
	}


}
