package web;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.RankingException;
import entity.Result;
import logic.RankingInfoLogic;
import model.SugorokuManager;

public class RankingAction {

	public String execute(HttpServletRequest req) throws RankingException {

		HttpSession session = req.getSession(true);
		SugorokuManager manager = (SugorokuManager) session.getAttribute("manager");

		String nextPage = null;

//		parameterの取得
		String name = req.getParameter("name");
		int score = Integer.parseInt(req.getParameter("score"));
		String select_character = req.getParameter("select_character");

//		現在時刻の取得
		LocalDateTime nowDateTime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String date = nowDateTime.format(format );

//		rankingDBに登録
		RankingInfoLogic logic = new RankingInfoLogic();
		logic.putRankingRecord(name, date, score, select_character);

//		rankingDBから一覧を取得
		ArrayList<Result> resultList = logic.getRanking();
		System.out.println("name:  " + resultList.get(2).getName());

		System.out.println("number of result: " + resultList.size());
		session.setAttribute("resultList", resultList);
		session.setAttribute("manager", manager);

		nextPage = "/ranking.jsp";

		return nextPage;
	}

}
