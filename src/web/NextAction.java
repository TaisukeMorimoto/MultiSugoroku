package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class NextAction {

	public String execute(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		String nextPage = null;

		// judge whether game is over
		if (manager.getPlayerList().get(manager.getTurn()).getBloodAlcLv() >= manager.getLimitAlcLv()) {
			manager.getPlayerList().get(manager.getTurn()).setNowRest(manager.getOverNum());
			nextPage = "/over.jsp";

		// judge whether game is clear
		} else if(manager.getPlayerList().get(manager.getTurn()).getLocation() >= manager.getSQUARE() - 1){
			nextPage = "/clear.jsp";

		} else if(manager.checkAllDie()) {
			if (manager.getnPlayer() == 1) {
				nextPage = "/allOver1p.jsp";
			} else {
				nextPage = "/allOver.jsp";
			}

		} else if (manager.getnPlayer() == 1) {
			manager.goNextPayer();
			nextPage = "/main1p.jsp";
		} else {
			manager.goNextPayer();
			nextPage = "/main.jsp";
		}

		session.setAttribute("manager", manager);

		return nextPage;
	}

}
