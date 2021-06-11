package com.okky.model;

public class BoardDTO {
	private int board_num;
	private String board_title;
	private int board_writer;
	private String board_content;
	private int board_hit;
	private int board_like;
	private int board_scrap;
	// 카테고리 스트링으로 수정 (int -> String)
	private String board_category;
	private String board_regdate;
	private int board_comment;

	@Override
	public String toString() {
		return "BoardDTO [board_num=" + board_num + ", board_title=" + board_title + ", board_writer=" + board_writer
				+ ", board_content=" + board_content + ", board_hit=" + board_hit + ", board_like=" + board_like
				+ ", board_scrap=" + board_scrap + ", board_category=" + board_category + ", board_regdate="
				+ board_regdate + ", board_comment=" + board_comment + "]";
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public int getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(int board_writer) {
		this.board_writer = board_writer;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public int getBoard_scrap() {
		return board_scrap;
	}

	public void setBoard_scrap(int board_scrap) {
		this.board_scrap = board_scrap;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}

	public int getBoard_comment() {
		return board_comment;
	}

	public void setBoard_comment(int board_comment) {
		this.board_comment = board_comment;
	}
}
