package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class User implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int uId;
	@Column(length=50)
	private String uName;
	@Column(length=10)
	private String password;
	@Column(length=100)
	private String emailId;
	@Column(length=50)
	private String fName;
	@Column(length=50)
	private String lname;
	@Column(length=50)
	private String mName;
	@Column(length=10)
	private String uPhoneNo;
	@Column(length=1000)
	private String uAddress;
	@Column(length=10)
	private String dob;
	@Column(length=10)
	private String role;

	public User() {}

	public User(int uId, String uName, String password, String emailId, String fName, String lname, String mName,
			String uPhoneNo, String uAddress, String dob, String role) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.password = password;
		this.emailId = emailId;
		this.fName = fName;
		this.lname = lname;
		this.mName = mName;
		this.uPhoneNo = uPhoneNo;
		this.uAddress = uAddress;
		this.dob = dob;
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

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
}
