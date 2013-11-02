package com.mannir.test;

import org.joda.time.DateMidnight;
import org.joda.time.DateTime;
import org.joda.time.Years;

public class Test1 {

	public static void main(String[] args) {
		DateMidnight birthdate = new DateMidnight(1986, 1, 1);
		DateTime now = new DateTime();
		Years age = Years.yearsBetween(birthdate, now);		
		String ag = age+"";		
		int str = Integer.parseInt(ag.replaceAll("\\D+",""));		
		System.out.println(str);

	}

}
