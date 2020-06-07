package com.cisco.npi.repositories;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.cisco.npi.beans.ReleaseTimelineDetailsBean;

@Repository
public interface ReleaseTimelineDetailsBeanRepository extends MongoRepository<ReleaseTimelineDetailsBean, String> {

	List<ReleaseTimelineDetailsBean> findByReleaseNameAndTimelineType(String releaseName, String timelineType);

}
