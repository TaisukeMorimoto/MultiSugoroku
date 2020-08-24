
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Result;
/**
 * Rankingテーブルを利用するDAOクラス
 * @author m.taisuke
 * @version 1.0 2020/08/19
 */
public class RankingDAO {

	/** コネクション */
	private Connection con;

	/**
	 * コンストラクタ
	 * @param con コネクション
	 */
	public RankingDAO(Connection con) {
		this.con = con;
	}

	/**
	 * スコア高い順にランキングを取得する
	 * @return ランキング情報全件
	 * @throws SQLException
	 */
	public ArrayList<Result> getRankingList() throws SQLException {

		String sql = "SELECT * FROM ranking ORDER BY score DESC";

		PreparedStatement stmt = null;
		ResultSet res = null;
		ArrayList<Result> resultList = new ArrayList<Result>();

		try {
			stmt = con.prepareStatement(sql);
//			stmt.setString(1, memberId);
			System.out.println("execute query start");
			res = stmt.executeQuery();
			System.out.println("execute query end");

			int rank = 0;

			while(res.next()) {
				// ランキングの各種情報を作成する。
				System.out.println("res.next() = true");
				Result result = new Result();
				result.setId(res.getInt("id"));
				result.setName(res.getString("name"));
				result.setDate(res.getString("date"));
				result.setScore(res.getInt("score"));
				result.setSelect_character(res.getString("select_character"));
				rank ++;
				result.setRank(rank);
				resultList.add(result);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			throw e;
		} finally{
			if(res != null) {
				res.close();
			}
			if(stmt != null) {
				stmt.close();
			}
		}

		return resultList;
	}

	/**
	 * ランキングにrecordを追加する(うまく動かん)
	 * @throws SQLException
	 */
	public void putRankingRecord(String name,String date,int score,String select_character) throws SQLException {

		String sql = "insert into ranking (name, date, score, select_character) values (?,?,?,?);";

		PreparedStatement stmt = null;

		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, date);
			stmt.setInt(3, score);
			stmt.setString(4, select_character);
			System.out.println("execute query start");
			int num = stmt.executeUpdate();
			System.out.println("num: " + num);
			System.out.println("execute query end");

		} catch(SQLException e) {
			e.printStackTrace();
			throw e;
		} finally{
			if(stmt != null) {
				stmt.close();
			}
		}
	}

	/**
	 * 指定した名前のrecordを削除
	 * @throws SQLException
	 */
	public void deleteRankingRecord(int id) throws SQLException {

		String sql = "delete from ranking where id=?;";

		PreparedStatement stmt = null;

		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			System.out.println("execute query start");
			int num = stmt.executeUpdate();
			System.out.println("num: " + num);
			System.out.println("execute query end");

		} catch(SQLException e) {
			e.printStackTrace();
			throw e;
		} finally{
			if(stmt != null) {
				stmt.close();
			}
		}

	}


}