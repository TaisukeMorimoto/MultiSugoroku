/**
 * jp.co.flm.market.common.MarketBusinessException
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */

package common;


/**
 * 本システムにおける業務例外クラスです
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
public class RankingException extends Exception {

	/**
	 * コンストラクタ
	 */
	public RankingException() {
	}

	/**
	 * コンストラクタ
	 * @param message エラーメッセージ
	 */
	public RankingException(String message) {
		super(message);
	}

}