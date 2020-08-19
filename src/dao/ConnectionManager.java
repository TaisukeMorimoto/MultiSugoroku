package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * データベースとの接続を管理するクラスです。
 * @author m.taisuke
 * @version 1.0 2020/08/19
 */
public class ConnectionManager {

	/** DB接続情報（URL） */
	private static final String URL = "jdbc:mysql://localhost:3306/sugoroku";

	/** DB接続情報（ユーザー名） */
	private static final String USER = "root";

	/** DB接続情報（パスワード） */
	private static final String PASSWORD = "Tai_fuji2_My";

	/**
	 * コネクションを取得する。
	 * @return コネクション
	 * @throws SQLException SQL例外
	 */
	public static Connection getConnection() throws SQLException {
		Connection con = null;
		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return con;
	}

}