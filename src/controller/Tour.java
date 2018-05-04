package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDate;
import static java.time.temporal.ChronoUnit.DAYS;

import beans.Member;
import beans.PolicyTour;
import model.policy.PolicyNumber;
import model.premium.TourCalculator;

@WebServlet("/Tour")
public class Tour extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		try {
			String requestType = request.getParameter("requestType");

			String amount = request.getParameter("insAmount");
			int insAmount = Integer.parseInt(amount);
			String start_date = request.getParameter("start_date");
			String end_date = request.getParameter("end_date");
			LocalDate start = LocalDate.parse(start_date);
			LocalDate end = LocalDate.parse(end_date);
			int days = 1;
			if (!start.equals(end)) {
				days = (int) DAYS.between(start, end);
			}

			// 如果requestType = cal 就單純算保費
			if (requestType.equals("cal")) {
				TourCalculator tourCalculator = new TourCalculator();
				int premium = tourCalculator.calculateTour(days, insAmount);
				if (premium != 0) {
					out.println(premium);
				}
			}

			// 如果requestType = apply 就產生PolicyTour Javabean
			if (requestType.equals("apply")) {
				// 受益人參數
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
				String location = request.getParameter("location");
				String goTime = request.getParameter("goTime");

				setPolicyTour(session, beneficiary1, beneficiary2, beneficiary3, beneficiary4, insAmount, location,
						start_date, end_date, goTime, days);
				setPreviewBeneficiary(session, beneficiary1, beneficiary2, beneficiary3, beneficiary4);
				response.sendRedirect("previewTour.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void setPolicyTour(HttpSession session, String beneficiary1, String beneficiary2, String beneficiary3,
			String beneficiary4, int insAmount, String location, String start_date, String end_date, String goTime,
			int days) {
		Member member = (Member) session.getAttribute("member");

		// 產生保單號碼
		String ident = member.getId();
		String policyNumber = PolicyNumber.generatePolicyNumber(ident);

		// 保單名稱
		String policyName = "CSTA雲端人壽旅遊平安保險";

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

		// 保險期間
		int rocYear1 = Integer.parseInt(start_date.substring(0, 4)) - 1911;
//		int month1 = Integer.parseInt(start_date.substring(5, 7));
//		int date1 = Integer.parseInt(start_date.substring(8, 10));
		
		String month1 = start_date.substring(5, 7);
		String date1 = start_date.substring(8, 10);

		int rocYear2 = Integer.parseInt(end_date.substring(0, 4)) - 1911;
//		int month2 = Integer.parseInt(end_date.substring(5, 7));
//		int date2 = Integer.parseInt(end_date.substring(8, 10));
		
		String month2 = end_date.substring(5, 7);
		String date2 = end_date.substring(8, 10);
		
		String time = goTime.substring(0, 2);


		
		String period = "自民國" + rocYear1 + "年" + month1 + "月" + (date1) + "日" + time + "時起 至 民國" + (rocYear2) + "年"
				+ month2 + "月" + date2 + "日" + time + "時止";

		// 保費
		TourCalculator tourCalculator = new TourCalculator();
		int premium = tourCalculator.calculateTour(days, insAmount);

		// 將以上參數寫入Javabean PolicyTour
		PolicyTour policyTour = new PolicyTour();
		session.setAttribute("policyTour", policyTour);

		policyTour.setPolicyNumber(policyNumber);
		policyTour.setPolicyName(policyName);
		policyTour.setProposer(proposer);
		policyTour.setInsured(insured);
		policyTour.setBeneficiary1(beneficiary1);
		policyTour.setBeneficiary2(beneficiary2);
		policyTour.setBeneficiary3(beneficiary3);
		policyTour.setBeneficiary4(beneficiary4);
		policyTour.setGender(gender);
		policyTour.setAges(ages);
		policyTour.setId(ident);
		policyTour.setInsAmount(insAmount);
		policyTour.setLocation(location);
		policyTour.setPeriod(period);
		policyTour.setPremium(premium);
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