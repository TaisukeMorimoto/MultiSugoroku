package practice;

public class Miyashita extends AbstractPlayer {

	// character status
	private String name = "幹事の宮下";

	// about own specialities
	private int specialitySpuares = -1;
	private int specialityAlc = -2;

	// about own ultimate skill
	private String ultimateName = "さよならは悲しい言葉じゃない";
	private String ultimateTarget = "all";
	private int ultimateSquares = 0;
	private int ultimateAlc = 4;
	private int ultimateGage = 10;
	private String ultimateConditions = "below";
	private boolean canUltimate = false;


	public Miyashita(int SQUARE, int DICE_MAX) {
		super(SQUARE, DICE_MAX);
	}

	public void doUltimate() {
		if (canUltimate == false) {
			System.out.println("ultimateGage in not full");
		} else {
			canUltimate = false;
		}

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

	public String getUltimateTarget() {
		return ultimateTarget;
	}

	public void setUltimateTarget(String ultimateTarget) {
		this.ultimateTarget = ultimateTarget;
	}

	public int getUltimateSquares() {
		return ultimateSquares;
	}

	public void setUltimateSquares(int ultimateSquares) {
		this.ultimateSquares = ultimateSquares;
	}

	public int getUltimateAlc() {
		return ultimateAlc;
	}

	public void setUltimateAlc(int ultimateAlc) {
		this.ultimateAlc = ultimateAlc;
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

	public boolean getCanUltimate() {
		return canUltimate;
	}

	public void setCanUltimate(boolean canUltimate) {
		this.canUltimate = canUltimate;
	}

}
