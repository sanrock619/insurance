package model.policy;

import java.sql.Connection;
import java.sql.PreparedStatement;

import api.ConnectionPool;

public class AccidentUnderwriter {
	private boolean result = false;

	public boolean writePolicyAccident(String policyNumber, String policyName, String proposer, String insured,
			String beneficiary1, String beneficiary2, String beneficiary3, String beneficiary4, String gender,
			String ages, String id, int insAmount, String period, int premium, String auto) {

		String sql = "INSERT INTO policy_accident VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection conn = ConnectionPool.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, policyNumber);
			pstmt.setString(2, policyName);
			pstmt.setString(3, proposer);
			pstmt.setString(4, insured);
			pstmt.setString(5, beneficiary1);
			pstmt.setString(6, beneficiary2);
			pstmt.setString(7, beneficiary3);
			pstmt.setString(8, beneficiary4);
			pstmt.setString(9, gender);
			pstmt.setString(10, ages);
			pstmt.setString(11, id);
			pstmt.setInt(12, insAmount);
			pstmt.setString(13, period);
			pstmt.setInt(14, premium);
			pstmt.setString(15, auto);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
