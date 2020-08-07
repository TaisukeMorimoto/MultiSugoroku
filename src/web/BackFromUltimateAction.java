package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class BackFromUltimateAction {

	public String execute(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		String nextPage = null;

		// when player is over
		if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() >= manager.getLimitAlcLv()) {
			manager.getPlayerList().get(manager.getTurn()).setNowRest(manager.getOverNum());
			nextPage = "over.jsp" ;
		// when player is clear
		} else if (manager.getPlayerList().get(manager.getTurn()).getLocation() >= manager.getSQUARE() - 1) {
			nextPage = "clear.jsp";
		} else if (manager.getnPlayer() == 1) {
			nextPage = "/main1p.jsp";
		} else {
			nextPage = "/main.jsp";
		}

		session.setAttribute("manager", manager);

		return nextPage;
	}

}
