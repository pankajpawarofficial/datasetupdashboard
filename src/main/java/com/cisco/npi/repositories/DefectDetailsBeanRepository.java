package com.cisco.npi.repositories;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.cisco.npi.beans.DefectDetailsBean;

@Repository
public interface DefectDetailsBeanRepository extends MongoRepository<DefectDetailsBean, String> {
	
	List<DefectDetailsBean> findByReleaseNameAndDefectCategory(String releaseName, String defectCategory);

	List<DefectDetailsBean> deleteByDefectID(String defectID);
	

}
