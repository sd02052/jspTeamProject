package com.okky.model;

public class MemberDTO {
	private int mem_num;
	private String mem_id;
	private String mem_nick;
	private String mem_pwd;
	private String mem_image;
	private String mem_email;
	private String mem_emailCheck;
	private String mem_check;
	private int mem_score;
	private int company;

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_image() {
		return mem_image;
	}

	public void setMem_image(String mem_image) {
		this.mem_image = mem_image;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_emailCheck() {
		return mem_emailCheck;
	}

	public void setMem_emailCheck(String mem_emailCheck) {
		this.mem_emailCheck = mem_emailCheck;
	}

	public String getMem_check() {
		return mem_check;
	}

	public void setMem_check(String mem_check) {
		this.mem_check = mem_check;
	}

	public int getMem_score() {
		return mem_score;
	}

	public void setMem_score(int mem_score) {
		this.mem_score = mem_score;
	}

	public int getCompany() {
		return company;
	}

	public void setCompany(int company) {
		this.company = company;
	}

}
