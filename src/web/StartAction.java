package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class StartAction {

	public String execute(HttpServletRequest req, String realPath) {

		HttpSession session = req.getSession(true);

		String nextPage = null;

		int nPlayer = Integer.parseInt(req.getParameter("nPlayer"));
		SugorokuManager manager = new SugorokuManager(realPath);
		manager.InitSugorokuManager(nPlayer);

		nextPage = "/selectChara.jsp";
		session.setAttribute("manager", manager);

		return nextPage;
	}

}
