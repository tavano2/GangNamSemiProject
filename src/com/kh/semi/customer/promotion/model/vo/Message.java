package com.kh.semi.customer.promotion.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable{
	
	private String msg_num;
	private String user_id;
	private String msg_title;
	private String msg_content;
	private Date msg_date;
	private String status;
	
	

	public Message() {
		// TODO Auto-generated constructor stub
	}



	public Message(String msg_num, String user_id, String msg_title, String msg_content, Date msg_date, String status) {
		super();
		this.msg_num = msg_num;
		this.user_id = user_id;
		this.msg_title = msg_title;
		this.msg_content = msg_content;
		this.msg_date = msg_date;
		this.status = status;
	}



	@Override
	public String toString() {
		return "Message [msg_num=" + msg_num + ", user_id=" + user_id + ", msg_title=" + msg_title + ", msg_content="
				+ msg_content + ", msg_date=" + msg_date + ", status=" + status + "]";
	}



	public String getMsg_num() {
		return msg_num;
	}



	public void setMsg_num(String msg_num) {
		this.msg_num = msg_num;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getMsg_title() {
		return msg_title;
	}



	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}



	public String getMsg_content() {
		return msg_content;
	}



	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}



	public Date getMsg_date() {
		return msg_date;
	}



	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	
	
	

}
