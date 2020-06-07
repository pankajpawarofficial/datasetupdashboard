package com.cisco.npi.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.cisco.npi.beans.MiscDataBean;

@Repository
public interface MiscDataRepository extends MongoRepository<MiscDataBean, String> {
	
}
