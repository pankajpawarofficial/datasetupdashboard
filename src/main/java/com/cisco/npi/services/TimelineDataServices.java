package com.cisco.npi.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cisco.npi.beans.ReleaseTimelineDetailsBean;
import com.cisco.npi.beans.TimelineDateFormatter;
import com.cisco.npi.repositories.ReleaseTimelineDetailsBeanRepository;

@Service
public class TimelineDataServices {

	@Autowired
	private ReleaseTimelineDetailsBeanRepository releaseTimelineDetailsBeanRepository;

	public List<TimelineDateFormatter> getReleaseTimelineDetailsBeansList(String releaseName, String timelineType){
		Date currentdate=new Date();
		List<TimelineDateFormatter> timelineDateFormattersList=new ArrayList<>();
		List<ReleaseTimelineDetailsBean> releaseTimelineDetailsBeansList=releaseTimelineDetailsBeanRepository.findByReleaseNameAndTimelineType(releaseName,timelineType);

		for(ReleaseTimelineDetailsBean releaseTimelineDetailsBean:releaseTimelineDetailsBeansList) {

			TimelineDateFormatter timelineDateFormatter=new TimelineDateFormatter();

			if(releaseTimelineDetailsBean.getReleaseDate().compareTo(currentdate)<0) {
				timelineDateFormatter.setCrossed(true);
				timelineDateFormatter.setTimelineHead(releaseTimelineDetailsBean.getReleasePhase());
				timelineDateFormatter.setDate(releaseTimelineDetailsBean.getReleaseDate());
				timelineDateFormattersList.add(timelineDateFormatter);
			}
			else {
				timelineDateFormatter.setCrossed(false);
				timelineDateFormatter.setTimelineHead(releaseTimelineDetailsBean.getReleasePhase());
				timelineDateFormatter.setDate(releaseTimelineDetailsBean.getReleaseDate());
				timelineDateFormattersList.add(timelineDateFormatter);				
			}
		}
		return timelineDateFormattersList;
	}
}
