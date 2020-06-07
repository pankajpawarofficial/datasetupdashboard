package com.cisco.npi.repositories;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.cisco.npi.beans.TaskDetailsBean;

@Repository
public interface TaskDetailsBeanRepository extends MongoRepository<TaskDetailsBean, String> {

	List<TaskDetailsBean> findByReleaseNameAndCategory(String releaseName, String category);
	List<TaskDetailsBean> deleteByTaskID(String taskID);
	List<TaskDetailsBean> findByTaskID(String taskID);
}
