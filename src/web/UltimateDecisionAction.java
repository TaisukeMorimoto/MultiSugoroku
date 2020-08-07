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

		System.out.println("selected player: " + selectPlayer);
		// do ultimate
		if (selectPlayer == null) {
			manager.doUltimateOnePlayer();
		} else {
			String enName = manager.getPlayerList().get(Integer.parseInt(selectPlayer) - 1).getEnName();
			manager.doUltimateOnePlayer(enName);
		}

		nextPage = "/main.jsp";

		session.setAttribute("manager", manager);

		return nextPage;
	}

}
