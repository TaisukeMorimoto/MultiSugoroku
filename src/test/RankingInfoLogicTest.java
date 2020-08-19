package test;

import java.util.ArrayList;

import common.RankingException;
import entity.Result;
import logic.RankingInfoLogic;

public class RankingInfoLogicTest {

	public static void main(String[] args) throws RankingException {

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
		if (expected.getId() == actual.getId()) {
			System.out.println("check id: OK");
		} else {
			System.out.println("check id: NG");
		}
		if (expected.getName().equals(actual.getName()) ){
			System.out.println("check name: OK");
		} else {
			System.out.println("check name: NG");
		}
		if (expected.getDate().equals(actual.getDate())) {
			System.out.println("check date: OK");
		} else {
			System.out.println("check date: NG");
		}
		if (expected.getScore() == actual.getScore()) {
			System.out.println("check score: OK");
		} else {
			System.out.println("check score: NG");
		}
		if (expected.getSelect_character().equals(actual.getSelect_character())) {
			System.out.println("select_characer: Ok");
		} else {
			System.out.println("select_character: NG");
		}
	}

}
