package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class RollDiceAction {

	public String execute(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		String nextPage = null;

		manager.rollDiceOnePlayer();
		if (manager.getPlayerList().get(manager.getTurn()).getNowRest() > 0) {
			if (manager.getnPlayer() == 1) {
//				nextPage = "/main1p.jsp";
				nextPage = "/error.jsp";
			} else if (manager.getnPlayer() == 2) {
//				nextPage = "/main2p.jsp";
				nextPage = "/error.jsp";
			} else if (manager.getnPlayer() == 3) {
//				nextPage = "/main3p.jsp";
				nextPage = "/error.jsp";
			} else if (manager.getnPlayer() == 4) {
				nextPage = "/main4p.jsp";
			}
		// whether game is over bracause of ultimate
		} else if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() >= manager.getLimitAlcLv()) {
			manager.getPlayerList().get(manager.getTurn()).setNowRest(manager.getOverNum());
			nextPage = "over.jsp" ;
		} else if (manager.getPlayerList().get(manager.getTurn()).getLocation() >= manager.getSQUARE() - 1) {
			nextPage = "clear.jsp";
		} else {
			nextPage = "/event.jsp";
		}

		nextPage = "/selectChara.jsp";
		session.setAttribute("manager", manager);

		return nextPage;
	}


}