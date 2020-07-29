package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.SugorokuNormal;

/**
 * Servlet implementation class Sugoroku
 */
@WebServlet("/Sugoroku")
public class SugorokuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SugorokuController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		String buttonId = request.getParameter("page");
		if (buttonId == null) {
			buttonId = "init";
		}
		System.out.println(buttonId);
		String nextPage;
		switch (buttonId) {
			case "init":
				// initialization process
				InitAction initAction = new InitAction();
				initAction.execute(request);
				nextPage = "/init.jsp";
				break;
			case "start":
				nextPage = "selectChara.jsp";
				break;
			case "playDecision":
			case "back":
			case "next":
			case "ultimateDecision":
				if (buttonId.equals("playDecision")) {
					MainAction mainAction = new MainAction();
					mainAction.execute(request);
				}
				if (nPlayer == 1) {
					nextPage = "/main1p.jsp";
				} else if (nPlayer == 2) {
					nextPage = "/main2p.jsp";
				} else if (nPlayer == 3) {
					nextPage = "/main3p.jsp";
				} else if (nPlayer == 4) {
					nextPage = "/main4p.jsp";
				}
				if (SugorokuNormal.isClear) {
					nextPage = "/clear.jsp";
				} else if (SugorokuNormal.isOver) {
					nextPage = "/over.jsp";
				}
				break;
			case "dice":
				RollDiceAction rollDiceAction = new RollDiceAction();
				rollDiceAction.execute(request);
				nextPage = "/event.jsp";
				break;
			case "ultimate":
				UltimateAction ultimateAction = new UltimateAction();
				ultimateAction.execute(request);
				nextPage = "/ultimate.jsp";
				break;
			default:
				System.out.println("error buttonId:" + buttonId);
				nextPage = "";
		}

		RequestDispatcher rd = getServletContext().getRequestDispatcher(nextPage);
		rd.forward(request, response);
	}
}
