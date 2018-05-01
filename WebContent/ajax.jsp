<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.Context,javax.sql.DataSource"%>

<%
	String s1 = request.getParameter("val");

	String letters = "ABCDEFGHJKLMNPQRSTUVXYWZIO";
	boolean isRight = false;
	if (s1.matches("^[A-Z][12][0-9]{8}$")) {
	// 編碼檢查
	String s12 = s1.substring(0, 1);	// "A123456789" => "A"
	int n12 = letters.indexOf(s12) + 10;
	int n1 = n12 / 10;
	int n2 = n12 % 10;
	int n3 = Integer.parseInt(s1.substring(1, 2));
	int n4 = Integer.parseInt(s1.substring(2, 3));
	int n5 = Integer.parseInt(s1.substring(3, 4));
	int n6 = Integer.parseInt(s1.substring(4, 5));
	int n7 = Integer.parseInt(s1.substring(5, 6));
	int n8 = Integer.parseInt(s1.substring(6, 7));
	int n9 = Integer.parseInt(s1.substring(7, 8));
	int n10 = Integer.parseInt(s1.substring(8, 9));
	int n11 = Integer.parseInt(s1.substring(9, 10));
	int sum = n1*1+n2*9+n3*8+n4*7+n5*6+n6*5+n7*4+n8*3+n9*2+n10*1+n11*1;
	
	isRight = sum % 10 == 0;
	
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {

		String sql = "SELECT * FROM customer WHERE id = ?";
		Context ctx = new javax.naming.InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/InsDB");
		con = ds.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, s1);
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.toString();
	}

	if (s1 == null || s1.trim().equals("")) {
		out.print("");
	} else {
		if (!isRight) {
			out.print(" 請輸入正確身分證字號");
		} else {
			if (rs.next()) {
				out.print(" 此帳號已被註冊");
			} else {
				out.print("");
			}
		}
	}
	pstmt.clearParameters();
	pstmt.close();
	con.close();
%>