package com.kutar.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	private int rowStart;
	
	public Criteria(int pageNum) {
		this.pageNum = pageNum;
		this.amount = 10;
		this.rowStart = (pageNum-1) * this.amount;
	}
	
}
