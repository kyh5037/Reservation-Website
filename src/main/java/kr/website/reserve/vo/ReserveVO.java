package kr.website.reserve.vo;

import java.util.Date;

public class ReserveVO {
	private int res_no;
	private int res_no_acc;
	private int res_no_sto;
	private Date res_cur_time;
	private String res_time;
	private String res_date;
	private int res_people;
	private String res_all;
	private String res_name;
	
	
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getRes_all() {
		return res_all;
	}
	public void setRes_all(String res_all) {
		this.res_all = res_all;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public int getRes_no_acc() {
		return res_no_acc;
	}
	public void setRes_no_acc(int res_no_acc) {
		this.res_no_acc = res_no_acc;
	}
	public int getRes_no_sto() {
		return res_no_sto;
	}
	public void setRes_no_sto(int res_no_sto) {
		this.res_no_sto = res_no_sto;
	}
	public Date getRes_cur_time() {
		return res_cur_time;
	}
	public void setRes_cur_time(Date res_cur_time) {
		this.res_cur_time = res_cur_time;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public int getRes_people() {
		return res_people;
	}
	public void setRes_people(int res_people) {
		this.res_people = res_people;
	}
	
	
}
