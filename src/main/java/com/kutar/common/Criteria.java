package com.kutar.common;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	private int rowStart;
	
	private String type, keyword;
	
	public Criteria() {
		this(1);
	}
	
	public Criteria(int pageNum) {
		this.amount = 10;
		this.setPageNum(pageNum);
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		if(pageNum > 1) {
			this.rowStart = (pageNum-1) * this.amount;
		}
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
}
