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
import beans.PolicyLife;
import model.policy.PolicyNumber;
import model.premium.LifeCalculator;

@WebServlet("/Life")
public class Life extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		try {
			String requestType = request.getParameter("requestType");
			String gender = request.getParameter("gender");
			int years = 0;
			if (!request.getParameter("years").equals("") && request.getParameter("years") != null) {
				years = Integer.parseInt(request.getParameter("years"));
			}

			int birthY = 0;
			int birthM = 0;
			int birthD = 0;
			if (request.getParameter("birthY") != null) {
				birthY = Integer.parseInt(request.getParameter("birthY"));
			} else {
				birthY = member.getBirthY();
			}

			if (request.getParameter("birthM") != null) {
				birthM = Integer.parseInt(request.getParameter("birthM"));
			} else {
				birthM = member.getBirthM();
			}

			if (request.getParameter("birthD") != null) {
				birthD = Integer.parseInt(request.getParameter("birthD"));
			} else {
				birthD = member.getBirthD();
			}

			int insAmount = Integer.parseInt(request.getParameter("insAmount"));

			//計算年齡
			int ages = calculateAges(birthY, birthM, birthD);

			// 如果requestType = cal 就單純算保費
			if (ages < 18 || ages > 50) {
				out.println("");
			} else if (requestType.equals("cal")) {
				LifeCalculator lifeCalculator = new LifeCalculator();
				int premium = lifeCalculator.calculateLife(gender, years, ages, insAmount);

				if (premium != 0) {
					out.println(premium);
				}
			}

			// 如果requestType = apply 就產生Policy Javabean
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

				setPolicyLife(session, beneficiary1, beneficiary2, beneficiary3, beneficiary4, insAmount, years);
				setPreviewBeneficiary(session, beneficiary1, beneficiary2, beneficiary3, beneficiary4);
				response.sendRedirect("previewLife.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int calculateAges(int birthY, int birthM, int birthD) {
		int ages = 0;

		// 計算 試算保費當天的年齡
		int insYear = Integer.parseInt(new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()));
		int insMonth = Integer.parseInt(new java.text.SimpleDateFormat("MM").format(new java.util.Date()));
		int insDate = Integer.parseInt(new java.text.SimpleDateFormat("dd").format(new java.util.Date()));

		ages = (insYear - birthY - 1);
		if (birthM < 6 || birthM - insMonth < 6) {
			ages++;
		} else if (birthM - insMonth == 6 && birthD <= insDate) {
			ages++;
		}

		return ages;
	}

	public void setPolicyLife(HttpSession session, String beneficiary1, String beneficiary2, String beneficiary3,
			String beneficiary4, int insAmount, int years) {
		Member member = (Member) session.getAttribute("member");

		// 產生保單號碼
		String ident = member.getId();
		String policyNumber = PolicyNumber.generatePolicyNumber(ident);

		// 保單名稱
		String policyName = "CLTL雲端人壽定期壽險";

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
		String period = "自民國" + rocYear + "年" + month + "月" + (date + 1) + "日0時起 至 民國" + (rocYear + years) + "年" + month
				+ "月" + date + "日24時止";

		// 保費
		LifeCalculator lifeCalculator = new LifeCalculator();
		int premium = lifeCalculator.calculateLife(gender, years, age, insAmount);

		// debug
		System.out.println("premium:" + premium);

		// 將以上參數寫入Javabean PolicyLife
		PolicyLife policyLife = new PolicyLife();
		session.setAttribute("policyLife", policyLife);

		policyLife.setPolicyNumber(policyNumber);
		policyLife.setPolicyName(policyName);
		policyLife.setProposer(proposer);
		policyLife.setInsured(insured);
		policyLife.setBeneficiary1(beneficiary1);
		policyLife.setBeneficiary2(beneficiary2);
		policyLife.setBeneficiary3(beneficiary3);
		policyLife.setBeneficiary4(beneficiary4);
		policyLife.setGender(gender);
		policyLife.setAges(ages);
		policyLife.setId(ident);
		policyLife.setInsAmount(insAmount*10);
		policyLife.setPeriod(period);
		policyLife.setYears(years);
		policyLife.setPremium(premium);
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