package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Member;
import beans.PolicyAccident;
import model.policy.PolicyNumber;

@WebServlet("/Accident")
public class Accident extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		int insAmount = Integer.parseInt(request.getParameter("insAmount"));
		String auto = request.getParameter("auto");

		String beneficiary1 = "";
		String beneficiary2 = "";
		String beneficiary3 = "";
		String beneficiary4 = "";
		if (request.getParameter("beneficiary1") != null) {
			beneficiary1 = request.getParameter("beneficiary1");
		}
		if (request.getParameter("beneficiary2") != null) {
			beneficiary2 = request.getParameter("beneficiary2");
		}
		if (request.getParameter("beneficiary3") != null) {
			beneficiary3 = request.getParameter("beneficiary3");
		}
		if (request.getParameter("beneficiary4") != null) {
			beneficiary4 = request.getParameter("beneficiary4");
		}

		setPolicyAccident(session, beneficiary1, beneficiary2, beneficiary3, beneficiary4, insAmount, auto);
		setPreviewBeneficiary(session, beneficiary1, beneficiary2, beneficiary3, beneficiary4);
		response.sendRedirect("previewAccident.jsp");
	}

	public void setPolicyAccident(HttpSession session, String beneficiary1, String beneficiary2, String beneficiary3,
			String beneficiary4, int insAmount, String auto) {
		Member member = (Member) session.getAttribute("member");

		// 產生保單號碼
		String ident = member.getId();
		String policyNumber = PolicyNumber.generatePolicyNumber(ident);

		// 保單名稱
		String policyName = "CSAC雲端人壽意外傷害險";

		// 要保人及被保險人
		String proposer = member.getRealname();
		String insured = proposer;

		// 性別及年齡
		String gender = member.getGender();
		if (gender.equals("男")) {
			gender = "male";
		} else if (gender.equals("女")) {
			gender = "female";
		}
		String ages = member.getAges();
		int age = Integer.parseInt(ages);

		// 保險期間
		int adYear = Integer.parseInt(new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()));
		int month = Integer.parseInt(new java.text.SimpleDateFormat("MM").format(new java.util.Date()));
		int date = Integer.parseInt(new java.text.SimpleDateFormat("dd").format(new java.util.Date()));
		int rocYear = adYear - 1911;
		
		String monthString = "";
		if(month<10) {
			monthString = "0" + Integer.toString(month);
		}else {
			monthString = Integer.toString(month);
		}
		
		String dateString1 = "";
		if((date+1)<10) {
			dateString1 = "0" + Integer.toString(date+1);
		}else {
			dateString1 = Integer.toString(date+1);
		}
		
		String dateString2 = "";
		if(date<10) {
			dateString2 = "0" + Integer.toString(date);
		}else {
			dateString2 = Integer.toString(date);
		}
		
		String period = "自民國" + rocYear + "年" + monthString + "月" + dateString1 + "日00時起 至 民國" + (rocYear + 1) + "年" + monthString
				+ "月" + dateString2 + "日24時止";

		// 保費
		double rate = 101.4;
		int premium = (int) (insAmount*101.4);

		// 將以上參數寫入Javabean PolicyAccident
		PolicyAccident policyAccident = new PolicyAccident();
		session.setAttribute("policyAccident", policyAccident);

		policyAccident.setPolicyNumber(policyNumber);
		policyAccident.setPolicyName(policyName);
		policyAccident.setProposer(proposer);
		policyAccident.setInsured(insured);
		policyAccident.setBeneficiary1(beneficiary1);
		policyAccident.setBeneficiary2(beneficiary2);
		policyAccident.setBeneficiary3(beneficiary3);
		policyAccident.setBeneficiary4(beneficiary4);
		policyAccident.setGender(gender);
		policyAccident.setAges(ages);
		policyAccident.setId(ident);
		policyAccident.setInsAmount(insAmount*10);
		policyAccident.setPeriod(period);
		policyAccident.setPremium(premium);
		policyAccident.setAuto(auto);
	}

	public void setPreviewBeneficiary(HttpSession session, String beneficiary1, String beneficiary2,
			String beneficiary3, String beneficiary4) {
		String beneficiary = "";
		int r = 0;
		if (!beneficiary1.equals("")) {
			beneficiary += beneficiary1;
			r++;
		}

		if (!beneficiary2.equals("")) {
			if (r > 0) {
				beneficiary = beneficiary + ",";
			}
			beneficiary += beneficiary2;
			r++;
		}

		if (!beneficiary3.equals("")) {
			if (r > 0) {
				beneficiary = beneficiary + ",";
			}
			beneficiary += beneficiary3;
			r++;
		}

		if (!beneficiary4.equals("")) {
			if (r > 0) {
				beneficiary = beneficiary + ",";
			}
			beneficiary += beneficiary4;
		}

		session.setAttribute("beneficiary", beneficiary);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
