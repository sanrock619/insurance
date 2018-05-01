package model.policy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import api.ConnectionPool;

public class PolicyNumber {
	public static String generatePolicyNumber(String ident) {

		PreparedStatement pstmt;
		ResultSet rs;
		String policyNumber = ident + "-";
		int total = 0;
		String sql = "";
		try {
			Connection conn = ConnectionPool.getConnection();

			// 算有幾張旅平險保單
			sql = "SELECT COUNT(*) FROM policy_tour WHERE id = ?";
			int countTour = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ident);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				countTour = rs.getInt(1);
			}

			// 算有幾張定期壽險保單
			sql = "SELECT COUNT(*) FROM policy_life WHERE id = ?";
			int countLife = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ident);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				countLife = rs.getInt(1);
			}

			// 算有幾張意外傷害險保單
			sql = "SELECT COUNT(*) FROM policy_accident WHERE id = ?";
			int countAccident = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ident);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				countAccident = rs.getInt(1);
			}

			total = countTour + countLife + countAccident;

			// 統計保戶目前已有幾張保單
			if (total <= 8) {
				policyNumber += "0" + (total + 1);
			} else {
				policyNumber += (total + 1);
			}

			pstmt.close();
			conn.close();
			return policyNumber;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return policyNumber;
	}
}
