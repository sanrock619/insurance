package model.premium;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import api.ConnectionPool;

public class TourCalculator{
	private int premium;

	public int calculateTour(int days, int insAmount) {
		PreparedStatement pstmt;
		ResultSet rs;
		try {
			Connection conn = ConnectionPool.getConnection();
			String sql = "SELECT premium FROM premium_tour WHERE days = ? AND insAmount = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, days);
			pstmt.setInt(2, insAmount);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int result = rs.getInt("premium");
				premium = result;
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
