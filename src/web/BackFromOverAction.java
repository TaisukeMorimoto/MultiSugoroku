package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class BackFromOverAction {

	public String execute(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		String nextPage = null;

		manager.goNextPayer();

		if (manager.checkAllDie()) {
			if (manager.getnPlayer() == 1) {
				nextPage = "/allOver1p.jsp";
			} else {
				nextPage = "/allOver.jsp";
			}
		} else if (manager.getnPlayer() == 1) {
			nextPage = "/main1p.jsp";
		} else {
			nextPage = "/main.jsp";
		}

		session.setAttribute("manager", manager);

		return nextPage;
	}

}
