package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class UltimateDecisionAction {

	public String execute(HttpServletRequest req) {


		String nextPage = null;

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		// selected player
		String selectPlayer = req.getParameter("select");

		// do ultimate
		if (selectPlayer == null) {
			manager.doUltimateOnePlayer();
		} else {
			String enName = manager.getPlayerList().get(Integer.parseInt(selectPlayer) - 1).getEnName();
			manager.doUltimateOnePlayer(enName);
		}


		if (manager.getnPlayer() == 1) {
//			nextPage = "/main1p.jsp";
			nextPage = "/error.jsp";
		} else if (manager.getnPlayer() == 2) {
//			nextPage = "/main2p.jsp";
			nextPage = "/error.jsp";
		} else if (manager.getnPlayer() == 3) {
//			nextPage = "/main3p.jsp";
			nextPage = "/error.jsp";
		} else if (manager.getnPlayer() == 4) {
			nextPage = "/main4p.jsp";
		}

		session.setAttribute("manager", manager);

		return nextPage;
	}

}
