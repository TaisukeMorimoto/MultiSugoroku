package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import logic.SugorokuManager;

public class ChooseCharaAction {

	public String execute(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		int player = Integer.parseInt(req.getParameter("player"));
		String name = req.getParameter("chara");

		manager.playerNameArray[player - 1] = name;

		String nextPage = null;
		// if all player finish to select character
		if (manager.getnPlayer() == player) {
			if (manager.getnPlayer() == 1) {
				manager.StartPlaying(manager.playerNameArray[0]);
				nextPage = "main1p.jsp";
			} else if (manager.getnPlayer() == 2) {
				manager.StartPlaying(manager.playerNameArray[0], manager.playerNameArray[1]);
				nextPage = "main2p.jsp";
			} else if (manager.getnPlayer() == 3) {
				manager.StartPlaying(manager.playerNameArray[0], manager.playerNameArray[1], manager.playerNameArray[2]);
				nextPage = "main3p.jsp";
			} else if (manager.getnPlayer() == 4) {
				manager.StartPlaying(manager.playerNameArray[0], manager.playerNameArray[1],
									 manager.playerNameArray[2], manager.playerNameArray[3]);
				nextPage = "main4p.jsp";
			}
		} else {
			nextPage = "selectChara.jsp";
		}
		req.setAttribute("manager", manager);

		return nextPage;
	}

}
