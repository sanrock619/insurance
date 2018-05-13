package beans;

import java.io.Serializable;

public class Policy implements Serializable{
	private String policyNumber;
	private String policyName;
	private String proposer;
	private String insured;
	private String beneficiary1;
	private String beneficiary2;
	private String beneficiary3;
	private String beneficiary4;
	private String gender;
	private String ages;
	private String id;
	private int insAmount;
	private String period;
	private int premium;
	
	public Policy() {
		
	}

	public String getPolicyNumber() {
		return policyNumber;
	}

	public void setPolicyNumber(String policyNumber) {
		this.policyNumber = policyNumber;
	}

	public String getPolicyName() {
		return policyName;
	}

	public void setPolicyName(String policyName) {
		this.policyName = policyName;
	}

	public String getProposer() {
		return proposer;
	}

	public void setProposer(String proposer) {
		this.proposer = proposer;
	}

	public String getInsured() {
		return insured;
	}

	public void setInsured(String insured) {
		this.insured = insured;
	}

	public String getBeneficiary1() {
		return beneficiary1;
	}

	public void setBeneficiary1(String beneficiary1) {
		this.beneficiary1 = beneficiary1;
	}

	public String getBeneficiary2() {
		return beneficiary2;
	}

	public void setBeneficiary2(String beneficiary2) {
		this.beneficiary2 = beneficiary2;
	}

	public String getBeneficiary3() {
		return beneficiary3;
	}

	public void setBeneficiary3(String beneficiary3) {
		this.beneficiary3 = beneficiary3;
	}

	public String getBeneficiary4() {
		return beneficiary4;
	}

	public void setBeneficiary4(String beneficiary4) {
		this.beneficiary4 = beneficiary4;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAges() {
		return ages;
	}

	public void setAges(String ages) {
		this.ages = ages;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getInsAmount() {
		return insAmount;
	}

	public void setInsAmount(int insAmount) {
		this.insAmount = insAmount;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getPremium() {
		return premium;
	}

	public void setPremium(int premium) {
		this.premium = premium;
	}

}
