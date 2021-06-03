package com.okky.model;

public class LikeDTO {
	private int like_num;
	private int like_target;
	private int like_writer;
	private int like_flag;

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public int getLike_target() {
		return like_target;
	}

	public void setLike_target(int like_target) {
		this.like_target = like_target;
	}

	public int getLike_writer() {
		return like_writer;
	}

	public void setLike_writer(int like_writer) {
		this.like_writer = like_writer;
	}

	public int getLike_flag() {
		return like_flag;
	}

	public void setLike_flag(int like_flag) {
		this.like_flag = like_flag;
	}

}
