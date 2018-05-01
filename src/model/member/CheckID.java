package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import api.ConnectionPool;

public class CheckID {
	public static boolean checkLetters(String id) {
		boolean isRight = false;
		String letters = "ABCDEFGHJKLMNPQRSTUVXYWZIO";

		if (id.matches("^[A-Z][12][0-9]{8}$")) {
			// 編碼檢查
			String initial = id.substring(0, 1); // "A123456789" => "A"
			int n12 = letters.indexOf(initial) + 10;
			int n1 = n12 / 10;
			int n2 = n12 % 10;
			int n3 = Integer.parseInt(id.substring(1, 2));
			int n4 = Integer.parseInt(id.substring(2, 3));
			int n5 = Integer.parseInt(id.substring(3, 4));
			int n6 = Integer.parseInt(id.substring(4, 5));
			int n7 = Integer.parseInt(id.substring(5, 6));
			int n8 = Integer.parseInt(id.substring(6, 7));
			int n9 = Integer.parseInt(id.substring(7, 8));
			int n10 = Integer.parseInt(id.substring(8, 9));
			int n11 = Integer.parseInt(id.substring(9, 10));
			int sum = n1 * 1 + n2 * 9 + n3 * 8 + n4 * 7 + n5 * 6 + n6 * 5 + n7 * 4 + n8 * 3 + n9 * 2 + n10 * 1
					+ n11 * 1;

			isRight = sum % 10 == 0;
		}
		return isRight;
	}

	public static boolean checkExist(String id) {
		boolean result = false;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM customer WHERE id = ?";
		Connection con = ConnectionPool.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				result = true;
			}
			pstmt.clearParameters();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}