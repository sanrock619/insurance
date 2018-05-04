package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import api.BCrypt;
import api.CheckPasswd;
import api.ConnectionPool;
import beans.Member;

public class MemberService {

	public String[] verify(String id, String passwd) {
		String[] member = new String[8];
		String gender = "";

		Connection con = ConnectionPool.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM customer WHERE id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String hPasswd = rs.getString("passwd");
				if (CheckPasswd.ckPasswd(passwd, hPasswd)) {

					String realname = rs.getString("realname");
					if (id.substring(1, 2).equals("1")) {
						gender = "男";
					} else if (id.substring(1, 2).equals("2")) {
						gender = "女";
					}

					int y = rs.getInt("birthY");
					int m = rs.getInt("birthM");
					int d = rs.getInt("birthD");

					String year = Integer.toString(y);
					String month = Integer.toString(m);
					String date = Integer.toString(d);

					String ages = calculateAges(y, m, d);
					String phone = rs.getString("phone");
					String email = rs.getString("email");

					member[0] = realname;
					member[1] = ages;
					member[2] = gender;
					member[3] = year;
					member[4] = month;
					member[5] = date;
					member[6] = phone;
					member[7] = email;
				}
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	public String calculateAges(int year, int month, int date) {
		int insYear = Integer.parseInt(new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()));
		int insMonth = Integer.parseInt(new java.text.SimpleDateFormat("MM").format(new java.util.Date()));
		int insDate = Integer.parseInt(new java.text.SimpleDateFormat("dd").format(new java.util.Date()));

		int age = (insYear - year - 1);
		if (month < 6 || month - insMonth < 6) {
			age++;
		} else if (month - insMonth == 6 && date <= insDate) {
			age++;
		}

		String ages = Integer.toString(age);
		return ages;
	}

	public void regist(Member newMember) {
		Connection con = ConnectionPool.getConnection();
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO customer" + " (id, passwd, realname, gender, birthY, birthM, birthD, email, phone)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newMember.getId());
			pstmt.setString(2, newMember.getPasswd());
			pstmt.setString(3, newMember.getRealname());
			pstmt.setString(4, newMember.getGender());
			pstmt.setInt(5, newMember.getBirthY());
			pstmt.setInt(6, newMember.getBirthM());
			pstmt.setInt(7, newMember.getBirthD());
			pstmt.setString(8, newMember.getEmail());
			pstmt.setString(9, newMember.getPhone());
			pstmt.executeUpdate();
			pstmt.clearParameters();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 檢查原密碼是否正確 如果存在 則回傳目前已加密過後的密碼
	public String checkPasswd(String oldPasswd, String id) {
		String hPasswd = "";
		Connection con = ConnectionPool.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM customer WHERE id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String passwd = rs.getString("passwd");
				if (CheckPasswd.ckPasswd(oldPasswd, passwd)) {
					hPasswd = passwd;
				}
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hPasswd;
	}

	// 接收未加密前的新密碼 如果密碼更改成功則回傳true
	public boolean changePasswd(String newPasswd, String id) {
		boolean result = false;

		Connection con = ConnectionPool.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE customer SET passwd = ? WHERE id = ?";
		String newEncryptedPasswd = BCrypt.hashpw(newPasswd, BCrypt.gensalt());

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newEncryptedPasswd);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			pstmt.clearParameters();
			pstmt.close();
			con.close();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean sendMail(String email, String passwd) {
		boolean result = false;

		//這裡填要發送的mail帳號與密碼 目前已拿掉
		final String username = "";
		final String password = "";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", "smtp-mail.outlook.com");
		props.put("mail.smtp.post", "587");
		props.put("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.ssl.trust", "smtp-mail.outlook.com");

		// 此處為javax mail的session
		Session session2 = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			Message message = new MimeMessage(session2);
			message.setFrom(new InternetAddress("sanrock619@hotmail.com"));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("新密碼通知函");
			message.setText("您的密碼為已修改為 : " + passwd + " ，請使用這組新密碼登入，並重新修改密碼");
			Transport.send(message);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}