package com.cisco.npi.beans;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="defect_details")
public class DefectDetailsBean {

	@Id
	@Field("_id")
	private String id;
	@Field("Defect_ID")
	private String defectID;
	@Field("Release_Name")
	private String releaseName;
	@Field("Defect_Status")
	private String defectStatus;
	@Field("Defect_Category")
	private String defectCategory;
	@Field("Defect_Open_Date")
	private Date defectOpenDate;
	@Field("Defect_Update_Date")
	private Date defectUpdateDate;
	@Field("Comments")
	private String comments;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getReleaseName() {
		return releaseName;
	}
	public void setReleaseName(String releaseName) {
		this.releaseName = releaseName;
	}
	public String getDefectID() {
		return defectID;
	}
	public void setDefectID(String defectID) {
		this.defectID = defectID;
	}
	public String getDefectStatus() {
		return defectStatus;
	}
	public void setDefectStatus(String defectStatus) {
		this.defectStatus = defectStatus;
	}
	public String getDefectCategory() {
		return defectCategory;
	}
	public void setDefectCategory(String defectCategory) {
		this.defectCategory = defectCategory;
	}
	public Date getDefectOpenDate() {
		return defectOpenDate;
	}
	public void setDefectOpenDate(Date defectOpenDate) {
		this.defectOpenDate = defectOpenDate;
	}
	public Date getDefectUpdateDate() {
		return defectUpdateDate;
	}
	public void setDefectUpdateDate(Date defectUpdateDate) {
		this.defectUpdateDate = defectUpdateDate;
	}


}
