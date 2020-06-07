package com.cisco.npi.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cisco.npi.beans.DefectDetailsBean;
import com.cisco.npi.beans.KeyIssuesDetailsBean;
import com.cisco.npi.beans.ReleaseTimelineDetailsBean;
import com.cisco.npi.beans.TaskDetailsBean;
import com.cisco.npi.repositories.DefectDetailsBeanRepository;
import com.cisco.npi.repositories.KeyIssuesDetailsBeanRepository;
import com.cisco.npi.repositories.ReleaseTimelineDetailsBeanRepository;
import com.cisco.npi.repositories.TaskDetailsBeanRepository;

@Service
public class TableDataServices {
	
	@Autowired
	private TaskDetailsBeanRepository taskDetailsBeanRepository;
	@Autowired
	private KeyIssuesDetailsBeanRepository keyIssuesDetailsBeanRepository;
	@Autowired
	private ReleaseTimelineDetailsBeanRepository releaseTimelineDetailsBeanRepository;
	@Autowired
	private DefectDetailsBeanRepository defectDetailsBeanRepository;
	

	
	
	
	public void add(TaskDetailsBean taskDetailsBean) {
		taskDetailsBeanRepository.insert(taskDetailsBean);		
	}
	
	public void add(DefectDetailsBean defectDetailsBean) {
		defectDetailsBeanRepository.insert(defectDetailsBean);
	}

	public void add(KeyIssuesDetailsBean keyIssuesDetailsBean) {
		keyIssuesDetailsBeanRepository.insert(keyIssuesDetailsBean);
	}
	
	
	public List<KeyIssuesDetailsBean> getKeyIssuesDetailsBeansList(String releaseName){
		return keyIssuesDetailsBeanRepository.findByReleaseName(releaseName);
	}
	
	public List<TaskDetailsBean> getTaskDetailsBeansList(String category, String releaseName){
		return taskDetailsBeanRepository.findByReleaseNameAndCategory(releaseName, category);				
	}		

	public List<DefectDetailsBean> getDefectDetailsBeansList(String releaseName, String defectCategory){
		return defectDetailsBeanRepository.findByReleaseNameAndDefectCategory(releaseName,defectCategory);
	}
	
	public List<ReleaseTimelineDetailsBean> getReleaseTimelineDetailsBeansList(String releaseName, String timelineType){
		return releaseTimelineDetailsBeanRepository.findByReleaseNameAndTimelineType(releaseName,timelineType);
	}
	
	
	public TaskDetailsBean update(TaskDetailsBean taskDetailsBean) {
		return taskDetailsBeanRepository.save(taskDetailsBean);		
	}
		
	public DefectDetailsBean update(DefectDetailsBean defectDetailsBean) {
		return defectDetailsBeanRepository.save(defectDetailsBean);		
	}	

	public KeyIssuesDetailsBean update(KeyIssuesDetailsBean keyIssuesDetailsBean) {
		return keyIssuesDetailsBeanRepository.save(keyIssuesDetailsBean);		
	}
	
	
	public List<TaskDetailsBean> delete(TaskDetailsBean taskDetailsBean) {
		return taskDetailsBeanRepository.deleteByTaskID(taskDetailsBean.getTaskID());
	}
	
	public List<DefectDetailsBean> delete(DefectDetailsBean defectDetailsBean) {
		return defectDetailsBeanRepository.deleteByDefectID(defectDetailsBean.getDefectID());
	}

	public List<KeyIssuesDetailsBean> delete(KeyIssuesDetailsBean keyIssuesDetailsBean) {
		return keyIssuesDetailsBeanRepository.deleteByIssueID(keyIssuesDetailsBean.getIssueID());
	}
	
}
