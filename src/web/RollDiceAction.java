package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class RollDiceAction {

	public String execute(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		String nextPage =  "/event.jsp";

		System.out.println("now rest: " + manager.getPlayerList().get(manager.getTurn()).getNowRest());



		if (manager.getPlayerList().get(manager.getTurn()).getNowRest() > 0) {
			manager.restOnePlayer();
			manager.goNextPayer();
			if (manager.getnPlayer() ==1) {
				nextPage = "/main1p.jsp";
			} else {
				nextPage = "/main.jsp";
			}
		} else if (manager.checkAllDie()) {
			manager.rollDiceOnePlayer();
			nextPage = "/allOver.jsp";
		} else {
			//when player roll dice usually
			manager.rollDiceOnePlayer();
			nextPage = "/event.jsp";
		}

		session.setAttribute("manager", manager);

		return nextPage;
	}


}
