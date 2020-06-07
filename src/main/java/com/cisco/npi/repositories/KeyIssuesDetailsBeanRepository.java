package com.cisco.npi.repositories;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.cisco.npi.beans.KeyIssuesDetailsBean;

@Repository
public interface KeyIssuesDetailsBeanRepository extends MongoRepository<KeyIssuesDetailsBean, String> {
	
	List<KeyIssuesDetailsBean> findByReleaseName(String releaseName);

	List<KeyIssuesDetailsBean> deleteByIssueID(String issueID);
		
}
