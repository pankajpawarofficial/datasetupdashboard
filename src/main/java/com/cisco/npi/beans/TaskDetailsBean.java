package com.cisco.npi.beans;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="task_details")
public class TaskDetailsBean {
	
	@Id
	@Field("_id")
	private String id;
	@Field("Release_Name")
	private String releaseName;
	@Field("Category")
	private String category;
	@Field("Program")
	private String taskProgram;
	@Field("Task_ID")
	private String taskID;
	@Field("Task_Phase")
	private String taskPhase;
	@Field("Offer_Name_Scope")
	private String offerNameScope;
	@Field("Task_Raised_Date")
	private Date taskRaisedDate;
	@Field("Item_Create_Validate")
	private String itemCreateValidate;
	@Field("Price_Process_validate")
	private String priceProcessValidate;
	@Field("NPI_Orderability")
	private String npiOrderability;
	@Field("Config_Create_Validate")
	private String configCreateValidate;
	@Field("Config_Response")
	private String configResponse;
	@Field("Estimate")
	private String estimate;
	@Field("Offer_Modeling")
	private String offerModeling;
	@Field("Offer_Data_In_SBP")
	private String offerDataInSBP;
	@Field("Planned_ETA")
	private Date plannedETA;
	@Field("Actual_ETA")
	private Date actualETA;
	@Field("Request_Raised_By")
	private String requestRaisedBy;
	@Field("Updated_By")
	private String updatedBy;
	@Field("Request_Raised_Date")
	private Date requestRaisedDate;
	@Field("Updated_Date")
	private Date updatedDate;
	@Field("Task_Description")
	private String taskDescription;
	
	
	
	
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTaskProgram() {
		return taskProgram;
	}
	public void setTaskProgram(String taskProgram) {
		this.taskProgram = taskProgram;
	}
	public String getTaskID() {
		return taskID;
	}
	public void setTaskID(String taskID) {
		this.taskID = taskID;
	}
	public String getTaskPhase() {
		return taskPhase;
	}
	public void setTaskPhase(String taskPhase) {
		this.taskPhase = taskPhase;
	}
	public String getOfferNameScope() {
		return offerNameScope;
	}
	public void setOfferNameScope(String offerNameScope) {
		this.offerNameScope = offerNameScope;
	}
	public Date getTaskRaisedDate() {
		return taskRaisedDate;
	}
	public void setTaskRaisedDate(Date taskRaisedDate) {
		this.taskRaisedDate = taskRaisedDate;
	}
	public String getItemCreateValidate() {
		return itemCreateValidate;
	}
	public void setItemCreateValidate(String itemCreateValidate) {
		this.itemCreateValidate = itemCreateValidate;
	}
	public String getPriceProcessValidate() {
		return priceProcessValidate;
	}
	public void setPriceProcessValidate(String priceProcessValidate) {
		this.priceProcessValidate = priceProcessValidate;
	}
	public String getNpiOrderability() {
		return npiOrderability;
	}
	public void setNpiOrderability(String npiOrderability) {
		this.npiOrderability = npiOrderability;
	}
	public String getConfigCreateValidate() {
		return configCreateValidate;
	}
	public void setConfigCreateValidate(String configCreateValidate) {
		this.configCreateValidate = configCreateValidate;
	}
	public String getConfigResponse() {
		return configResponse;
	}
	public void setConfigResponse(String configResponse) {
		this.configResponse = configResponse;
	}
	public String getEstimate() {
		return estimate;
	}
	public void setEstimate(String estimate) {
		this.estimate = estimate;
	}
	public String getOfferModeling() {
		return offerModeling;
	}
	public void setOfferModeling(String offerModeling) {
		this.offerModeling = offerModeling;
	}
	public String getOfferDataInSBP() {
		return offerDataInSBP;
	}
	public void setOfferDataInSBP(String offerDataInSBP) {
		this.offerDataInSBP = offerDataInSBP;
	}
	public Date getPlannedETA() {
		return plannedETA;
	}
	public void setPlannedETA(Date plannedETA) {
		this.plannedETA = plannedETA;
	}
	public Date getActualETA() {
		return actualETA;
	}
	public void setActualETA(Date actualETA) {
		this.actualETA = actualETA;
	}
	public String getRequestRaisedBy() {
		return requestRaisedBy;
	}
	public void setRequestRaisedBy(String requestRaisedBy) {
		this.requestRaisedBy = requestRaisedBy;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public Date getRequestRaisedDate() {
		return requestRaisedDate;
	}
	public void setRequestRaisedDate(Date requestRaisedDate) {
		this.requestRaisedDate = requestRaisedDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getTaskDescription() {
		return taskDescription;
	}
	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	
	
	
	
}
