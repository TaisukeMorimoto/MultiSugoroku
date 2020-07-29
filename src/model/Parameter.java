package model;

import java.io.Serializable;

public class Parameter implements Serializable {

    private int nPlayer;

    public Parameter() {

    }

	public int getnPlayer() {
		return nPlayer;
	}

	public void setnPlayer(int nPlayer) {
		this.nPlayer = nPlayer;
	}
}
