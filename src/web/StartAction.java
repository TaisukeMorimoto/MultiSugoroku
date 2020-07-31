package web;

import javax.servlet.http.HttpServletRequest;

public class StartAction {

	public String execute(HttpServletRequest req) {

		String nextPage = "/start.jsp";

		return nextPage;

	}

}
