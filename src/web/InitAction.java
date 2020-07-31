package web;

import javax.servlet.http.HttpServletRequest;

public class InitAction {

	public String execute(HttpServletRequest req) {

		String nextPage = "/title.jsp";

		return nextPage;

	}

}
