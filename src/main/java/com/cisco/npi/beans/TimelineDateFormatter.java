package com.cisco.npi.beans;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimelineDateFormatter {
	
	private String timelineHead;
	private String date;
	private boolean crossed;
	
	public String getTimelineHead() {
		return timelineHead;
	}
	public void setTimelineHead(String timelineHead) {
		this.timelineHead = timelineHead;
	}
	public String getDate() {
		
		return date;
	}
	public void setDate(Date date) {
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("dd-MM-YYYY");
		String mdate=simpleDateFormat.format(date);
		this.date = mdate;
	}
	public boolean isCrossed() {
		return crossed;
	}
	public void setCrossed(boolean crossed) {
		this.crossed = crossed;
	}
	
	
	
}
