package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.RankingException;
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
				StartAction startAction = new StartAction();
				nextPage = startAction.execute(request);
				break;
			case "play":
				String realPath = this.getServletContext().getRealPath("");
				PlayAction playAction = new PlayAction();
				nextPage = playAction.execute(request, realPath);
				break;
			case "playDecision":
				SelectCharaAction selectCharaAction = new SelectCharaAction();
				nextPage = selectCharaAction.execute(request);
				break;
			case "backFromOver":
				BackFromOverAction backAction = new BackFromOverAction();
				nextPage = backAction.execute(request);
				break;
			case "backFromUltimate":
				BackFromUltimateAction backUltimateAction = new BackFromUltimateAction();
				nextPage = backUltimateAction.execute(request);
				break;
			case "next":
				NextAction nextAction = new NextAction();
				nextPage = nextAction.execute(request);
				break;
			case "ultimateDecision":
				UltimateDecisionAction ultimateDecisionAction = new UltimateDecisionAction();
				nextPage = ultimateDecisionAction.execute(request);
				break;
			case "dice":
				RollDiceAction rollDiceAction = new RollDiceAction();
				nextPage = rollDiceAction.execute(request);
				break;
			case "ultimate":
				UltimateAction ultimateAction = new UltimateAction();
				nextPage = ultimateAction.execute(request);
				break;
			case "ranking":
				System.out.println("ranking");
				RankingAction rankingAction = new RankingAction();
				try {
					nextPage = rankingAction.execute(request);
				} catch (RankingException e) {
					e.printStackTrace();
				}
				break;
			default:
				System.out.println("error buttonId:" + buttonId);
				nextPage = "error.jsp";
		}
		System.out.println("nextPage: " + nextPage);
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}
