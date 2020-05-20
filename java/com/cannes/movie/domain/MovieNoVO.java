package com.cannes.movie.domain;

// api에서 가져온 영화코드들을 받고 넘길 VO
public class MovieNoVO {
	String firstNo;
	String secondNo;
	String thirdNo;
	String fourthNo;
	String fifthNo;
	
	public MovieNoVO() {}
	public MovieNoVO(String firstNo, String secondNo, String thirdNo, String fourthNo, String fifthNo) {
		super();
		this.firstNo = firstNo;
		this.secondNo = secondNo;
		this.thirdNo = thirdNo;
		this.fourthNo = fourthNo;
		this.fifthNo = fifthNo;
	}
	
	public String getFirstNo() {
		return firstNo;
	}
	public void setFirstNo(String firstNo) {
		this.firstNo = firstNo;
	}
	public String getSecondNo() {
		return secondNo;
	}
	public void setSecondNo(String secondNo) {
		this.secondNo = secondNo;
	}
	public String getThirdNo() {
		return thirdNo;
	}
	public void setThirdNo(String thirdNo) {
		this.thirdNo = thirdNo;
	}
	public String getFourthNo() {
		return fourthNo;
	}
	public void setFourthNo(String fourthNo) {
		this.fourthNo = fourthNo;
	}
	public String getFifthNo() {
		return fifthNo;
	}
	public void setFifthNo(String fifthNo) {
		this.fifthNo = fifthNo;
	}
	
} // end MovieNoVO
