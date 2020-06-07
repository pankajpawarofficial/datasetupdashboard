package com.cisco.npi.beans;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
@Document(collection="key_issues_details")
public class KeyIssuesDetailsBean {
	
	@Id
	@Field("_id")
	private String id;
	@Field("Release_Name")
	private String releaseName;
	@Field("Issue_ID")
	private String issueID;
	@Field("Issue_Description")
	private String issueDesc;
	@Field("Owner")
	private String owner;
	@Field("Status")
	private String status;
	@Field("Impact")
	private String impact;
	@Field("ETA")
	private Date eTA;
	@Field("Category")
	private String category;
	@Field("Is_Open")
	private String isOpen;
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
	public String getIssueID() {
		return issueID;
	}
	public void setIssueID(String issueID) {
		this.issueID = issueID;
	}
	public String getIssueDesc() {
		return issueDesc;
	}
	public void setIssueDesc(String issueDesc) {
		this.issueDesc = issueDesc;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getImpact() {
		return impact;
	}
	public void setImpact(String impact) {
		this.impact = impact;
	}
	public Date getETA() {
		return eTA;
	}
	public void setETA(Date eTA) {
		this.eTA = eTA;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
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
	public Date geteTA() {
		return eTA;
	}
	public void seteTA(Date eTA) {
		this.eTA = eTA;
	}
	@Override
	public String toString() {
		return "KeyIssuesDetailsBean [id=" + id + ", releaseName=" + releaseName + ", issueID=" + issueID
				+ ", issueDesc=" + issueDesc + ", owner=" + owner + ", status=" + status + ", impact=" + impact
				+ ", eTA=" + eTA + ", category=" + category + ", isOpen=" + isOpen + ", createdBy=" + createdBy
				+ ", updatedBy=" + updatedBy + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + "]";
	}
	
	
	
	
	
	
}
