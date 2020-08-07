package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class SelectCharaAction {

	public String execute(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		if (manager == null) {
			System.out.println("manager object is null");
		}

		// set character name
		String name = req.getParameter("chara");
		manager.getPlayerNameList().set(manager.getSelectPlayer() - 1, name);

		String nextPage = null;
		// if all player finish to select character
		if (manager.getnPlayer() == manager.getSelectPlayer()) {
			if (manager.getnPlayer() == 1) {
				manager.StartPlaying(manager.getPlayerNameList().get(0));
				nextPage = "/main1p.jsp";
			} else if (manager.getnPlayer() == 2) {
				manager.StartPlaying(manager.getPlayerNameList().get(0), manager.getPlayerNameList().get(1));
				nextPage = "/main.jsp";
			} else if (manager.getnPlayer() == 3) {
				manager.StartPlaying(manager.getPlayerNameList().get(0), manager.getPlayerNameList().get(1),
									 manager.getPlayerNameList().get(2));
				nextPage = "/main.jsp";
			} else if (manager.getnPlayer() == 4) {
				manager.StartPlaying(manager.getPlayerNameList().get(0), manager.getPlayerNameList().get(1),
									 manager.getPlayerNameList().get(2), manager.getPlayerNameList().get(3));
				nextPage = "/main.jsp";
			}

		} else {
			manager.setSelectPlayer(manager.getSelectPlayer() + 1);
			nextPage = "/selectChara.jsp";
		}
		session.setAttribute("manager", manager);

		return nextPage;
	}

}
