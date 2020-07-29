package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    public void doPost (HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException
    		{
    		this.doGet(request, response);
    		}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String buttonId = request.getParameter("page");
		if (buttonId == null) {
			buttonId = "init";
		}

		System.out.println(buttonId);
		String nextPage = null;
		switch (buttonId) {
			case "init":
				// initialization process
				InitAction initAction = new InitAction();
				nextPage = initAction.execute(request);
				break;
			case "start":
				String realPath = this.getServletContext().getRealPath("");
				StartAction startAction = new StartAction();
				nextPage = startAction.execute(request, realPath);
				break;
			case "playDecision":
			case "back":
			case "next":
			case "ultimateDecision":
				if (buttonId.equals("playDecision")) {
					SelectCharaAction selectCharaAction = new SelectCharaAction();
					nextPage = selectCharaAction.execute(request);
				}
				break;
//			case "dice":
//				RollDiceAction rollDiceAction = new RollDiceAction();
//				rollDiceAction.execute(request);
//				nextPage = "/event.jsp";
//				break;
//			case "ultimate":
//				UltimateAction ultimateAction = new UltimateAction();
//				ultimateAction.execute(request);
//				nextPage = "/ultimate.jsp";
//				break;
			default:
				System.out.println("error buttonId:" + buttonId);
				nextPage = "error.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}
