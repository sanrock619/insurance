package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import api.BCrypt;
import api.ConnectionPool;
import beans.Member;
import model.member.CheckID;
import model.member.MemberService;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		// 如果request_type參數為verify 即作會員登入驗證
		if (request.getParameter("request_type").equals("verify")) {
			verify(session, request, response, out);
		}

		// 如果request_type參數為check 即作註冊前檢查id
		if (request.getParameter("request_type").equals("check")) {
			check(request, out);
		}

		// 如果request_type參數為regist 即作註冊
		if (request.getParameter("request_type").equals("regist")) {
			regist(request, out);
		}

		// 如果request_type參數為change 即作更改密碼
		if (request.getParameter("request_type").equals("change")) {
			change(out, session, request);
		}

		// 如果request_type參數為forget 即作忘記密碼
		if (request.getParameter("request_type").equals("forget")) {
			forget(out, session, request);
		}
	}

	public void verify(HttpSession session, HttpServletRequest request, HttpServletResponse response, PrintWriter out) {

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		MemberService memberService = new MemberService();
		String[] member = memberService.verify(id, passwd);

		if (member[0] != null) {
			String realname = member[0];
			String ages = member[1];
			String gender = member[2];
			int year = Integer.parseInt(member[3]);
			int month = Integer.parseInt(member[4]);
			int date = Integer.parseInt(member[5]);
			String phone = member[6];
			String email = member[7];
			setMember(session, request, realname, id, ages, gender, year, month, date, phone, email);
			try {
				response.sendRedirect("member.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('登入失敗，請檢查帳號或密碼是否正確');");
			out.println("location='login.jsp';");
			out.println("</script>");
		}
	}

	public void setMember(HttpSession session, HttpServletRequest request, String realname, String id, String ages,
			String gender, int y, int m, int d, String phone, String email) {
		Member member = new Member();
		session.setAttribute("member", member);

		member.setRealname(realname);
		member.setId(id);
		member.setAges(ages);
		member.setGender(gender);
		member.setBirthY(y);
		member.setBirthM(m);
		member.setBirthD(d);
		member.setPhone(phone);
		member.setEmail(email);
	}

	public void regist(HttpServletRequest request, PrintWriter out) {
		String id = request.getParameter("id");

		// 將密碼加密
		String passwd = request.getParameter("passwd");
		passwd = BCrypt.hashpw(passwd, BCrypt.gensalt());

		String realname = request.getParameter("realname");
		int birthY = Integer.parseInt(request.getParameter("birthY"));
		int birthM = Integer.parseInt(request.getParameter("birthM"));
		int birthD = Integer.parseInt(request.getParameter("birthD"));

		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = String.valueOf(id.charAt(1));
		if (gender.equals("1")) {
			gender = "male";
		} else if (gender.equals("2")) {
			gender = "female";
		}

		// 建立Member物件
		Member newMember = new Member();
		addMember(newMember, out, id, passwd, realname, gender, birthY, birthM, birthD, email, phone);

		// 呼叫MemberService的register方法 進行註冊(將資料寫入資料庫)
		MemberService memberService = new MemberService();
		memberService.regist(newMember);

		out.println("<script type=\"text/javascript\">");
		out.println("alert('恭喜您註冊成功');");
		out.println("location='login.jsp';");
		out.println("</script>");
	}

	public void addMember(Member newMember, PrintWriter out, String id, String passwd, String realname, String gender,
			int birthY, int birthM, int birthD, String email, String phone) {
		newMember.setId(id);
		newMember.setPasswd(passwd);
		newMember.setRealname(realname);
		newMember.setGender(gender);
		newMember.setBirthY(birthY);
		newMember.setBirthM(birthM);
		newMember.setBirthD(birthD);
		newMember.setEmail(email);
		newMember.setPhone(phone);
	}

	public void change(PrintWriter out, HttpSession session, HttpServletRequest request) {
		String oldPasswd = request.getParameter("oldPasswd");
		String newPasswd = request.getParameter("passwd");

		MemberService memberService = new MemberService();
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();

		// 先檢查會員是否存在 如果存在才作改密碼
		if (!memberService.checkPasswd(oldPasswd, id).equals("")) {
			if (memberService.changePasswd(newPasswd, id) == true) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('密碼更改成功，請使用新密碼登入');");
				out.println("location='logout.jsp';");
				out.println("</script>");
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('密碼更改失敗');");
				out.println("location='edit.jsp';");
				out.println("</script>");
			}
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('原密碼輸入錯誤，請重新輸入');");
			out.println("location='edit.jsp';");
			out.println("</script>");
		}
	}

	public void forget(PrintWriter out, HttpSession session, HttpServletRequest request) {
		String passwd = session.getId().substring(0, 7);
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		MemberService memberService = new MemberService();

		if (memberService.changePasswd(passwd, id) && memberService.sendMail(email, passwd)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('新密碼已寄送至您的E-Mail');");
			out.println("location='login.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('系統異常');");
			out.println("location='edit.jsp';");
			out.println("</script>");
		}
		session.invalidate();
	}

	public void check(HttpServletRequest request, PrintWriter out) {
		String id = request.getParameter("id");
		boolean isRight = CheckID.checkLetters(id);

		if (id == null || id.trim().equals("")) {
			out.print("");
		} else {
			if (!isRight) {
				out.print("請輸入正確身分證字號");
			} else {
				if (CheckID.checkExist(id)) {
					out.print("");
				} else {
					out.print("此帳號已被註冊");
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
