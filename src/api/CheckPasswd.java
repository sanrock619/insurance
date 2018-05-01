package api;

import api.BCrypt;

public class CheckPasswd {
	public static boolean ckPasswd(String org, String cPasswd) {
		boolean isRight = false;
		if (cPasswd.startsWith("$2a$")) {
			isRight = BCrypt.checkpw(org, cPasswd);
		}
		return isRight;
	}

}