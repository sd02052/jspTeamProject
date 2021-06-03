package com.okky.model;

public class CommentDTO {
	private int com_num;
	private int com_writer;
	private String com_content;
	private int com_target;
	private int com_like;
	private String com_regdate;
	private String com_selected;

	public int getCom_num() {
		return com_num;
	}

	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}

	public int getCom_writer() {
		return com_writer;
	}

	public void setCom_writer(int com_writer) {
		this.com_writer = com_writer;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public int getCom_target() {
		return com_target;
	}

	public void setCom_target(int com_target) {
		this.com_target = com_target;
	}

	public int getCom_like() {
		return com_like;
	}

	public void setCom_like(int com_like) {
		this.com_like = com_like;
	}

	public String getCom_regdate() {
		return com_regdate;
	}

	public void setCom_regdate(String com_regdate) {
		this.com_regdate = com_regdate;
	}

	public String getCom_selected() {
		return com_selected;
	}

	public void setCom_selected(String com_selected) {
		this.com_selected = com_selected;
	}

}
