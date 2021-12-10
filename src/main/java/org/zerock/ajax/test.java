package org.zerock.ajax;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;

import com.google.gson.Gson;

public class test {

	public static void main(String[] args) {
		
		List resultList = new ArrayList<String>();
		resultList.add("a");
		resultList.add("b");
		resultList.add("c");

		// 방법 1
		//JSONArray 객체 사용
		String result = JSONArray.toJSONString(resultList); //HashMap 등의 복잡한 자료형으로 덮어도 가능
		System.out.println("제이슨 결과 = " + result);

		// 방법 2
		// Gson 사용
		String json = new Gson().toJson(resultList);
		System.out.println("제이슨 결과2 = " + json);

	}

}
