package test;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import common.RankingException;
import entity.Result;
import logic.RankingInfoLogic;

public class RankingInfoLogicTest {

	public static void main(String[] args) throws RankingException{

		boolean sign = getRankingTest();
		if (sign) {
			System.out.println("ランキングの取得は正常に行われました。");
		} else {
			System.out.println("ランキングの取得に失敗しました。NG項目を確認してください。");
		}

		putRankingRecordTest();



	}


	public static void putRankingRecordTest() throws RankingException {
//		Arrange(準備)

//		現在時刻の取得
		LocalDateTime nowDateTime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String time = nowDateTime.format(format );
		System.out.println(time);

		String name = "山田";
		String date = time;
		int score = 1234;
		String select_character = "miyashita";

//		Act(実行)
		RankingInfoLogic logic = new RankingInfoLogic();
		logic.putRankingRecord(name, date, score, select_character);

//		Assert(検証)
		ArrayList<Result> resultList = logic.getRanking();
		System.out.println("id  name  date  score  select_character");
		for (Result res : resultList) {
			System.out.print(res.getId() + "  ");
			System.out.print(res.getName() + "  ");
			System.out.print(res.getDate() + "  ");
			System.out.print(res.getScore() + "  ");
			System.out.println(res.getSelect_character() + "  ");
		}
	}


	public static boolean getRankingTest() throws RankingException {
//		Arrange(準備)
		Result expected = new Result();
		expected.setId(1);
		expected.setName("たいすけ");
		expected.setDate("2020-08-19 10:39:35");
		expected.setScore(99999);
		expected.setSelect_character("miyashita");

//		Act(実行)
		RankingInfoLogic logic = new RankingInfoLogic();
		ArrayList<Result> resultList = logic.getRanking();
		Result actual = resultList.get(0);

//		Assert(検証)
		boolean sign = true;
		if (expected.getId() == actual.getId()) {
			System.out.println("check id: OK");
		} else {
			System.out.println("check id: NG");
			sign = false;
		}
		if (expected.getName().equals(actual.getName()) ){
			System.out.println("check name: OK");
		} else {
			System.out.println("check name: NG");
			sign = false;
		}
		if (expected.getDate().equals(actual.getDate())) {
			System.out.println("check date: OK");
		} else {
			System.out.println("check date: NG");
			sign = false;
		}
		if (expected.getScore() == actual.getScore()) {
			System.out.println("check score: OK");
		} else {
			System.out.println("check score: NG");
			sign = false;
		}
		if (expected.getSelect_character().equals(actual.getSelect_character())) {
			System.out.println("select_characer: Ok");
		} else {
			System.out.println("select_character: NG");
			sign = false;
		}
		return sign;
	}



}
