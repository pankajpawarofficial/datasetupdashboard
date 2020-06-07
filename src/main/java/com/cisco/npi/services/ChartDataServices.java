package com.cisco.npi.services;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cisco.npi.beans.TaskDetailsBean;
import com.cisco.npi.repositories.TaskDetailsBeanRepository;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

@Service
public class ChartDataServices {
	
	@Autowired
	private TaskDetailsBeanRepository taskDetailsBeanRepository;
	
	public List<Integer> getTaskDetailsBeansList(String releaseName, String category){
		
		int wipcounter=0,donecounter=0;
		List<Integer> integersList=new ArrayList<>();
		List<TaskDetailsBean> taskDetailsBeansList=taskDetailsBeanRepository.findByReleaseNameAndCategory(releaseName, category);
		
		
		
		for(TaskDetailsBean taskDetailsBean:taskDetailsBeansList) {
			if(!taskDetailsBean.getConfigCreateValidate().equalsIgnoreCase("nr")&&!taskDetailsBean.getConfigCreateValidate().equalsIgnoreCase("done"))
				wipcounter++;
			else if(!taskDetailsBean.getConfigResponse().equalsIgnoreCase("nr")&&!taskDetailsBean.getConfigResponse().equalsIgnoreCase("done"))
				wipcounter++;
			else if(!taskDetailsBean.getEstimate().equalsIgnoreCase("nr")&&!taskDetailsBean.getEstimate().equalsIgnoreCase("done"))
				wipcounter++;
			else if(!taskDetailsBean.getItemCreateValidate().equalsIgnoreCase("nr")&&!taskDetailsBean.getItemCreateValidate().equalsIgnoreCase("done"))
				wipcounter++;
			else if(!taskDetailsBean.getNpiOrderability().equalsIgnoreCase("nr")&&!taskDetailsBean.getNpiOrderability().equalsIgnoreCase("done"))
				wipcounter++;
			else if(!taskDetailsBean.getOfferDataInSBP().equalsIgnoreCase("nr")&&!taskDetailsBean.getOfferDataInSBP().equalsIgnoreCase("done"))
				wipcounter++;
			else if(!taskDetailsBean.getOfferModeling().equalsIgnoreCase("nr")&&!taskDetailsBean.getOfferModeling().equalsIgnoreCase("done"))
				wipcounter++;
			else if(!taskDetailsBean.getPriceProcessValidate().equalsIgnoreCase("nr")&&!taskDetailsBean.getPriceProcessValidate().equalsIgnoreCase("done"))
				wipcounter++;
			else
				donecounter++;				
		}
		
		integersList.add(donecounter);
		integersList.add(wipcounter);
		
		
		return integersList;
		
	}
	
	public JsonArray CompileChartDataList(String releaseName){
		List<Integer> chartDataList=new ArrayList<>();
		chartDataList.addAll(this.getTaskDetailsBeansList(releaseName, "SIT"));
		chartDataList.addAll(this.getTaskDetailsBeansList(releaseName, "QA"));
		chartDataList.addAll(this.getTaskDetailsBeansList(releaseName, "BAT/UAT"));
		
		Gson gson = new Gson();
		JsonElement jsonElement = gson.toJsonTree(chartDataList, new TypeToken<List<Integer>>() {}.getType());

		JsonArray jsonArray = jsonElement.getAsJsonArray();
		
		return jsonArray;
	}

}
