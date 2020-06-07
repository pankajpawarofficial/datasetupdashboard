package com.cisco.npi.beans;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="release_timeline_details")
public class ReleaseTimelineDetailsBean {
	
	@Id
	@Field("_id")
	private String id;
	@Field("Release_Name")
	private String releaseName;
	@Field("Timeline_Type")
	private String timelineType;
	@Field("Release_Phase")
	private String releasePhase;
	@Field("Release_Date")
	private Date releaseDate;
	@Field("Created_by")
	private String createdBy;
	@Field("Updated_by")
	private String updatedBy;
	@Field("Created_date")
	private Date createdDate;
	@Field("Updated_date")
	private Date updatedDate;
	
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReleaseName() {
		return releaseName;
	}
	public void setReleaseName(String releaseName) {
		this.releaseName = releaseName;
	}
	public String getTimelineType() {
		return timelineType;
	}
	public void setTimelineType(String timelineType) {
		this.timelineType = timelineType;
	}
	public String getReleasePhase() {
		return releasePhase;
	}
	public void setReleasePhase(String releasePhase) {
		this.releasePhase = releasePhase;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	
	
	
}
