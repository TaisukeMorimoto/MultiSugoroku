package web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.RankingException;
import entity.Result;
import logic.RankingInfoLogic;
import model.SugorokuManager;

public class DeleteRankingAction {

	public String execute(HttpServletRequest req) throws RankingException {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		String nextPage = null;

//		parameterの取得
		int id = Integer.parseInt(req.getParameter("id"));

//		rankingDBに登録
		RankingInfoLogic logic = new RankingInfoLogic();
		logic.deleteRankingRecord(id);

//		rankingDBから一覧を取得
		ArrayList<Result> resultList = logic.getRanking();
		System.out.println("name:  " + resultList.get(2).getName());

		System.out.println("number of result: " + resultList.size());
		req.setAttribute("id", id);
		req.setAttribute("resultList", resultList);
		session.setAttribute("manager", manager);

		nextPage = "/ranking.jsp";

		return nextPage;
	}

}
