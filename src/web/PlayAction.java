package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.SugorokuManager;

public class PlayAction {

	public String execute(HttpServletRequest req, String realPath) {

		HttpSession session = req.getSession(true);

		String nextPage = null;

		int nPlayer = Integer.parseInt(req.getParameter("nPlayer"));
		String course = req.getParameter("course");
		System.out.println("selected course is " + course);
		SugorokuManager manager = new SugorokuManager(realPath);
		manager.InitSugorokuManager(nPlayer, course);

		nextPage = "/selectChara.jsp";
		session.setAttribute("manager", manager);

		return nextPage;
	}

}
