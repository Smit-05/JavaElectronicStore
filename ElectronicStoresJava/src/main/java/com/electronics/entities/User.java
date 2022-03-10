package com.electronics.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=10)
	private int uId;
	@Column(length=50)
	private String uName;
	@Column(length=20)
	private String password;
	@Column(length=50)
	private String emailId;
	@Column(length=50)
	private String fName;
	@Column(length=50)
	private String lname;
	@Column(length=50)
	private String mName;
	@Column(length=50)
	private String uPhoneNo;
	@Column(length=1500)
	private String uAddress;
	private String role;
	
	
	public User() {
		super();
	}
	public User(String uName, String password, String emailId, String fName, String lname, String mName,
			String uPhoneNo, String uAddress,String role) {
		super();
		this.uName = uName;
		this.password = password;
		this.emailId = emailId;
		this.fName = fName;
		this.lname = lname;
		this.mName = mName;
		this.uPhoneNo = uPhoneNo;
		this.uAddress = uAddress;
		this.role = role;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getuPhoneNo() {
		return uPhoneNo;
	}
	public void setuPhoneNo(String uPhoneNo) {
		this.uPhoneNo = uPhoneNo;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
}
