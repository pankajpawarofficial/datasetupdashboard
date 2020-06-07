package com.cisco.npi.beans;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="release_timeline_details")
public class MiscDataBean {
	
	
	@Id
	@Field("_id")
	private String id;
	@Field("Release_Name")
	private String releaseName;
	
	
	
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
	@Override
	public String toString() {
		return "MiscDataBean [id=" + id + ", releaseName=" + releaseName + "]";
	}
	
	
	
}
