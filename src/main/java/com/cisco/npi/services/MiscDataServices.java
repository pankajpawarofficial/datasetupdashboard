package com.cisco.npi.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cisco.npi.beans.MiscDataBean;
import com.cisco.npi.repositories.MiscDataRepository;

@Service
public class MiscDataServices {
	
	@Autowired
	MiscDataRepository miscDataRepository;
	
	public String getLatestRelease() {
		List<MiscDataBean> miscDataBeansList=miscDataRepository.findAll();
		int maxYear=0,maxQuarter=0;
		for(MiscDataBean miscDataBean:miscDataBeansList) {
			String string=miscDataBean.getReleaseName();
			int quarter=Integer.parseInt(string.substring(1, 2));
			int year=Integer.parseInt(string.substring(4));			
			if(year>maxYear){
				maxYear=year;
				maxQuarter=quarter;
			}
			else if(year==maxYear) {
				if(quarter>maxQuarter)
					maxQuarter=quarter;
			}
		}		
		return "Q"+maxQuarter+"FY"+maxYear;
	}

	public List<String> getReleaseList(String releaseName) {
		List<String> quartersList=new ArrayList<>();
		for(int i=1;i<5;i++) {
			quartersList.add("Q"+i+releaseName.substring(2));
		}
		return quartersList;
	}

}
