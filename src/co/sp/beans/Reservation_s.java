package co.sp.beans;

public class Reservation_s {

//	res_num varchar(20) primary key
//	res_paydate date
//	res_startdate date
//	res_personnel number
//	res_mnum number
//	res_coursenum number

	private String res_num;
	private String res_paydate;
	private String res_startdate;
	private int res_personnel;
	private int res_mnum;
	private int res_coursenum;

	private int loginNum;
	private String loginName;

	private int course_num;
	private String course_names;

	public int getCourse_num() {
		return course_num;
	}

	public void setCourse_num(int course_num) {
		this.course_num = course_num;
	}

	public String getCourse_names() {
		return course_names;
	}

	public void setCourse_names(String course_names) {
		this.course_names = course_names;
	}

	public String getRes_num() {
		return res_num;
	}

	public void setRes_num(String res_num) {
		this.res_num = res_num;
	}

	public String getRes_paydate() {
		return res_paydate;
	}

	public void setRes_paydate(String res_paydate) {
		this.res_paydate = res_paydate;
	}

	public String getRes_startdate() {
		return res_startdate;
	}

	public void setRes_startdate(String res_date) {
		this.res_startdate = res_date;
	}

	public int getRes_personnel() {
		return res_personnel;
	}

	public void setRes_personnel(int res_personnel) {
		this.res_personnel = res_personnel;
	}

	public int getRes_mnum() {
		return res_mnum;
	}

	public void setRes_mnum(int res_mnum) {
		this.res_mnum = res_mnum;
	}

	public int getRes_coursenum() {
		return res_coursenum;
	}

	public void setRes_coursenum(int res_coursenum) {
		this.res_coursenum = res_coursenum;
	}

	public int getLoginNum() {
		return loginNum;
	}

	public void setLoginNum(int loginNum) {
		this.loginNum = loginNum;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

}
