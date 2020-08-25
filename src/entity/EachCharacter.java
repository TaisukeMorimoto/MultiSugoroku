package entity;

public class EachCharacter {

	// character status
	private String name;
	private String enName;

	// about my specialities
	private int specialitySpuares;
	private int specialityAlc;
	private String specialityText;

	private String type;

	public EachCharacter(String name, String enName,  String type, int specialitySpuares, int specialityAlc){
			this.enName = enName;
			this.name = name;
			this.type = type;
			this.specialitySpuares = specialitySpuares;
			this.specialityAlc = specialityAlc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
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

	public String getSpecialityText() {
		return specialityText;
	}

	public void setSpecialityText(String specialityText) {
		this.specialityText = specialityText;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
