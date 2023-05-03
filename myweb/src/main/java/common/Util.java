package common;

import javax.servlet.http.Cookie;

public class Util {
	public static String getCookie(Cookie[] cookies,  String name) {
		String result="";
		if(cookies != null) {
			for (Cookie element : cookies) {
				if(element.getName().equals(name)) {
					result = element.getValue();
					System.out.println(element.getName());
					System.out.println(result);
					break;
				}
			}
		}
		return result;
	}
}
