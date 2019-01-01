package com.kutar.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@ToString
@Slf4j
public class Criteria {
	
	private int pageNum;
	private int amount;
	private int rowStart;
	
	public Criteria() {
		this(1);
	}
	
	public Criteria(int pageNum) {
		this.pageNum = pageNum;
		this.amount = 10;
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
	
}
