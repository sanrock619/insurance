package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.PolicyAccident;
import beans.PolicyLife;
import beans.PolicyTour;
import model.policy.AccidentUnderwriter;
import model.policy.LifeUnderwriter;
import model.policy.TourUnderwriter;

@WebServlet("/Underwriter")
public class Underwriter extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String policy = request.getParameter("policy");
		if (policy.equals("tour")) {
			if (tour(session)) {
				response.sendRedirect("success.jsp");
			} else {
				out.print("xx");
			}
		}

		if (policy.equals("life")) {
			if (life(session)) {
				response.sendRedirect("success.jsp");
			} else {
				out.print("xx");
			}
		}
		
		if (policy.equals("accident")) {
			if (accident(session)) {
				response.sendRedirect("success.jsp");
			} else {
				out.print("xx");
			}
		}
	}

	public boolean tour(HttpSession session) {
		boolean result = false;

		PolicyTour policyTour = (PolicyTour) session.getAttribute("policyTour");
		TourUnderwriter tourUnderwriter = new TourUnderwriter();

		result = tourUnderwriter.writePolicyTour(policyTour.getPolicyNumber(), policyTour.getPolicyName(),
				policyTour.getProposer(), policyTour.getInsured(), policyTour.getBeneficiary1(),
				policyTour.getBeneficiary2(), policyTour.getBeneficiary3(), policyTour.getBeneficiary4(),
				policyTour.getGender(), policyTour.getAges(), policyTour.getId(), policyTour.getInsAmount(),
				policyTour.getLocation(), policyTour.getPeriod(), policyTour.getPremium());

		return result;
	}

	public boolean life(HttpSession session) {
		boolean result = false;

		PolicyLife policyLife = (PolicyLife) session.getAttribute("policyLife");
		LifeUnderwriter lifeUnderwriter = new LifeUnderwriter();

		result = lifeUnderwriter.writePolicyLife(policyLife.getPolicyNumber(), policyLife.getPolicyName(),
				policyLife.getProposer(), policyLife.getInsured(), policyLife.getBeneficiary1(),
				policyLife.getBeneficiary2(), policyLife.getBeneficiary3(), policyLife.getBeneficiary4(),
				policyLife.getGender(), policyLife.getAges(), policyLife.getId(), policyLife.getInsAmount(),
				policyLife.getPeriod(), policyLife.getYears(), policyLife.getPremium());

		return result;
	}

	public boolean accident(HttpSession session) {
		boolean result = false;

		PolicyAccident policyAccident = (PolicyAccident) session.getAttribute("policyAccident");
		AccidentUnderwriter accidentUnderwriter = new AccidentUnderwriter();

		result = accidentUnderwriter.writePolicyAccident(policyAccident.getPolicyNumber(),
				policyAccident.getPolicyName(), policyAccident.getProposer(), policyAccident.getInsured(),
				policyAccident.getBeneficiary1(), policyAccident.getBeneficiary2(), policyAccident.getBeneficiary3(),
				policyAccident.getBeneficiary4(), policyAccident.getGender(), policyAccident.getAges(),
				policyAccident.getId(), policyAccident.getInsAmount(), policyAccident.getPeriod(),
				policyAccident.getPremium(), policyAccident.getAuto());

		return result;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
