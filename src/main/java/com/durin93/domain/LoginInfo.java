package com.durin93.domain;

import java.util.Date;

public class LoginInfo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_tel;
	private Date user_joindate;
	private String user_condition;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public Date getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}

	public String getUser_condition() {
		return user_condition;
	}

	public void setUser_condition(String user_condition) {
		this.user_condition = user_condition;
	}

	@Override
	public String toString() {
		return "LoginInfo [user_id=" + user_id + ", user_pw=" + user_pw + "user_name=" + user_name + "user_tel="
				+ user_tel + "user_joindate=" + user_joindate + "user_condition=" + user_condition + "]";
	}

}
