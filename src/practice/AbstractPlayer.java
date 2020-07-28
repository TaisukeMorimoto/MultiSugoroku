package practice;

import java.util.Random;

public abstract class AbstractPlayer implements Player {

	protected int DICE_MAX;
	protected int SQUARE = 0;
	protected int location = 0;
	protected boolean[] locationArray;
	protected int count = 0;
	protected int bloodAlcLv = 0;

	// constractor
	AbstractPlayer(int SQUARE, int DICE_MAX){
		this.SQUARE = SQUARE;
		this.DICE_MAX = DICE_MAX;
		this.locationArray = new boolean[SQUARE];
		initStatus();
	}

	public void initStatus() {
		locationArray = new boolean[SQUARE];
		locationArray[0] = true;
		location = 0;
		count = 0;
		bloodAlcLv = 0;
	}

	@Override
	public int rollDice() {
		int dice = new Random().nextInt(DICE_MAX) + 1;
		return dice;
	}

	public void goForward(int dice) {
		// update location and locationArray
		locationArray[location] = false;
		location += dice;
		// if location is over goal
		if (location >= SQUARE - 1) {
			location = SQUARE - 1;
		}
		locationArray[location] = true;
		count++;
	}

	@Override
	public void drinkLiquor(Liquor liquor) {
		bloodAlcLv += liquor.getLiquorAlcLv();
		if (bloodAlcLv < 0) {
			bloodAlcLv = 0;
		}
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public boolean[] getLocationArray() {
		return locationArray;
	}

	public void setLocationArray(boolean[] locationArray) {
		this.locationArray = locationArray;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getBloodAlcLv() {
		return bloodAlcLv;
	}

	public void setBloodAlcLv(int bloodAlcLv) {
		this.bloodAlcLv = bloodAlcLv;
	}

}
