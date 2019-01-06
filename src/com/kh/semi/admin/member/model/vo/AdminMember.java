package com.kh.semi.admin.member.model.vo;

public class AdminMember {
	/*USER_ID
	USER_PWD
	USER_CERT
	USER_CLASS
	ENROLL_DATE
	JOIN_TYPE
	USER_POINT
	BLACKLIST
	SPAM
	STATUS
	DELETE_DATE
	DELETE_REASON
	KAKAO_ID*/
	
	private String userId;
	private String userCert;
	private String userClass;
	private String className;
	private String enrollDate;
	private int joinType;
	private String userPoint;
	private String blacklist;
	private String spam;
	private String deleteDate;
	private String deleteReason;
	private String kakaoId;
	private String status;
	
	public AdminMember() {}

	public AdminMember(String userId, String userCert, String userClass, String className, String enrollDate,
			int joinType, String userPoint, String blacklist, String spam, String deleteDate, String deleteReason,
			String kakaoId, String status) {
		super();
		this.userId = userId;
		this.userCert = userCert;
		this.userClass = userClass;
		this.className = className;
		this.enrollDate = enrollDate;
		this.joinType = joinType;
		this.userPoint = userPoint;
		this.blacklist = blacklist;
		this.spam = spam;
		this.deleteDate = deleteDate;
		this.deleteReason = deleteReason;
		this.kakaoId = kakaoId;
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserCert() {
		return userCert;
	}

	public void setUserCert(String userCert) {
		this.userCert = userCert;
	}

	public String getUserClass() {
		return userClass;
	}

	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getJoinType() {
		return joinType;
	}

	public void setJoinType(int joinType) {
		this.joinType = joinType;
	}

	public String getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(String userPoint) {
		this.userPoint = userPoint;
	}

	public String getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}

	public String getSpam() {
		return spam;
	}

	public void setSpam(String spam) {
		this.spam = spam;
	}

	public String getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}

	public String getDeleteReason() {
		return deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}

	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AdminMember [userId=" + userId + ", userCert=" + userCert + ", userClass=" + userClass + ", className="
				+ className + ", enrollDate=" + enrollDate + ", joinType=" + joinType + ", userPoint=" + userPoint
				+ ", blacklist=" + blacklist + ", spam=" + spam + ", deleteDate=" + deleteDate + ", deleteReason="
				+ deleteReason + ", kakaoId=" + kakaoId + ", status=" + status + "]";
	}
	
}
