package logic;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.RankingException;
import dao.ConnectionManager;
import dao.RankingDAO;
import entity.Result;

public class RankingInfoLogic {

	/**
	 *ランキング情報の取得。
	 * @return rankingデータ
	 * @throws RankingException
	 */
	public ArrayList<Result> getRanking() throws RankingException {

		Connection con = null;
		ArrayList<Result> resultList = null;

		try {
			con = ConnectionManager.getConnection();

			// すべてのランキング情報を検索する。
			RankingDAO rdao = new RankingDAO(con);
			resultList = rdao.getRankingList();

		} catch (SQLException e) {
			throw new RankingException("ランキングシステムエラーです。システム管理者に連絡してください。");
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					throw new RankingException("ランキングシステムエラーです。システム管理者に連絡してください。");
				}
			}
		}

		return resultList;
	}

	/**
	 *1件のランキング情報の登録。
	 * @throws RankingException
	 */
	public ArrayList<Result> putRankingRecord(String name,String date,int score,String select_character) throws RankingException {

		Connection con = null;
		ArrayList<Result> resultList = null;

		try {
			con = ConnectionManager.getConnection();

			// 1件のランキング情報を登録する。
			RankingDAO rdao = new RankingDAO(con);
			 rdao.putRankingRecord(name, date, score, select_character);

		} catch (SQLException e) {
			throw new RankingException("ランキングシステムエラーです。システム管理者に連絡してください。");
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					throw new RankingException("ランキングシステムエラーです。システム管理者に連絡してください。");
				}
			}
		}

		return resultList;
	}

}
