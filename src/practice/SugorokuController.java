package practice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
				session = initBean(session);
				nextPage = "/main4p.jsp";
				break;
			case "main":
				nextPage = "/main4p.jsp";
				break;
			case "event":
				nextPage = "/event.jsp";
				break;
			case "clear":
				nextPage = "/clear.jsp";
				break;
			case "over":
				nextPage = "/over.jsp";
				break;
			default:
				System.out.println("error buttonId:" + buttonId);
				nextPage = "";
		}

		RequestDispatcher rd = getServletContext().getRequestDispatcher(nextPage);
		rd.forward(request, response);
	}

	private static HttpSession initBean(HttpSession session) {
		// 初回時の処理(Data処理クラスのオブジェクトを生成し、セッションデータとして格納する)
		SugorokuBean bean = new SugorokuBean();
		bean.initial();
		session.setAttribute("sugorokubean", bean);
		System.out.println("generate sugorokubean and setAttribute as sugorokubean");
		return session;
	}

}
