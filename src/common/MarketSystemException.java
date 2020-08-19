/**
 * jp.co.flm.market.common.MarketSystemException
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */

package common;

/**
 * 本システムにおけるシステム例外クラスです
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
public class MarketSystemException extends Exception {

	/**
	 * コンストラクタ
	 */
	public MarketSystemException() {
	}

	/**
	 * コンストラクタ
	 * @param message エラーメッセージ
	 */
	public MarketSystemException(String message) {
		super(message);
	}

}