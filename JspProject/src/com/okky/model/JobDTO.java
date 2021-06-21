package com.okky.model;

public class JobDTO {
	private int job_num;
	private int job_target;
	private int job_contract;
	private int job_mincost;
	private int job_maxcost;
	private String job_location;
	private String job_do;
	private int job_mincareer;
	private int job_maxcareer;

	@Override
	public String toString() {
		return "JobDTO [job_num=" + job_num + ", job_target=" + job_target + ", job_contract=" + job_contract
				+ ", job_mincost=" + job_mincost + ", job_maxcost=" + job_maxcost + ", job_location=" + job_location
				+ ", job_do=" + job_do + ", job_mincareer=" + job_mincareer + ", job_maxcareer=" + job_maxcareer + "]";
	}

	public int getJob_num() {
		return job_num;
	}

	public void setJob_num(int job_num) {
		this.job_num = job_num;
	}

	public int getJob_target() {
		return job_target;
	}

	public void setJob_target(int job_target) {
		this.job_target = job_target;
	}

	public int getJob_contract() {
		return job_contract;
	}

	public void setJob_contract(int job_contract) {
		this.job_contract = job_contract;
	}

	public int getJob_mincost() {
		return job_mincost;
	}

	public void setJob_mincost(int job_mincost) {
		this.job_mincost = job_mincost;
	}

	public int getJob_maxcost() {
		return job_maxcost;
	}

	public void setJob_maxcost(int job_maxcost) {
		this.job_maxcost = job_maxcost;
	}

	public String getJob_location() {
		return job_location;
	}

	public void setJob_location(String job_location) {
		this.job_location = job_location;
	}

	public String getJob_do() {
		return job_do;
	}

	public void setJob_do(String job_do) {
		this.job_do = job_do;
	}

	public int getJob_mincareer() {
		return job_mincareer;
	}

	public void setJob_mincareer(int job_mincareer) {
		this.job_mincareer = job_mincareer;
	}

	public int getJob_maxcareer() {
		return job_maxcareer;
	}

	public void setJob_maxcareer(int job_maxcareer) {
		this.job_maxcareer = job_maxcareer;
	}

}
