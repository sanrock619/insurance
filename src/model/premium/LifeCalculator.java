package model.premium;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import api.ConnectionPool;

public class LifeCalculator{
	private int premium;

	public int calculateLife(String gender, int years, int ages, int insAmount) {
		PreparedStatement pstmt;
		ResultSet rs;
		String sql = "SELECT premium FROM premium_life WHERE gender = ? AND years = ? AND ages = ?";
		try {
			Connection conn = ConnectionPool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setInt(2, years);
			pstmt.setInt(3, ages);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int result = rs.getInt("premium");
				premium = result * insAmount;
				pstmt.close();
				conn.close();
				return premium;
			}

		} catch (Exception e) {
			return premium;
		}
		return premium;
	}

}
