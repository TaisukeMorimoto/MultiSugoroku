package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import logic.SugorokuManager;

public class StartAction {

	public String execute(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		int nPlayer = Integer.parseInt(req.getParameter("nPlayer"));

		if (manager == null) {
			manager = new SugorokuManager(nPlayer);
		}

		req.setAttribute("player", 0);
		req.setAttribute("manager", manager);

		return "selectChara.jsp";
	}

}
