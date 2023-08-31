package concat.member.model.vo;

import java.sql.Date;

public class Member {
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String nickname;
	private String email;
	private String phone;
	private Date enrollDate;
	private String status;
	private String gradeNo;
	private int totalScore;
	
	public Member() {}

	public Member(int memNo, String memId, String memPwd, String memName, String nickname, String email, String phone,
			Date enrollDate, String status, String gradeNo, int totalScore) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.status = status;
		this.gradeNo = gradeNo;
		this.totalScore = totalScore;
	}

	public Member(String memId, String memName, String phone) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.phone = phone;
	}

	public Member(String memId, String memPwd, String memName, String nickname, String email, String phone) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
	}
	
	

	public Member(String memId, String memName, String nickname, String email, String phone) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
	}

	public Member(String memId, String memPwd) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(String gradeNo) {
		this.gradeNo = gradeNo;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", nickname=" + nickname + ", email=" + email + ", phone=" + phone + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", gradeNo=" + gradeNo + ", totalScore=" + totalScore + "]";
	}
	
}
