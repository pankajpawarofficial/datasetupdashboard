package com.cisco.npi.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cisco.npi.beans.DefectDetailsBean;
import com.cisco.npi.beans.KeyIssuesDetailsBean;
import com.cisco.npi.beans.TaskDetailsBean;
import com.cisco.npi.services.ChartDataServices;
import com.cisco.npi.services.TableDataServices;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

@Controller
public class JsonDataController {

	@Autowired
	private ChartDataServices chartDataServices;
	@Autowired
	private TableDataServices tableDataServices;
	
	

	@PostMapping("/chartData")
	public @ResponseBody JsonArray getChartData(@RequestBody String releaseName){
		System.out.println(releaseName);
		releaseName=releaseName.replace("\"", "");
		System.out.println(releaseName);
		return chartDataServices.CompileChartDataList(releaseName);
	}
	
	@PostMapping("/defectDetailsData")
	public @ResponseBody JsonArray getDefectDetailsData(@RequestBody String releaseName) {
		releaseName=releaseName.replace("\"", "");

		ArrayList<DefectDetailsBean> defectDetailsBeansList=new ArrayList<>();
		defectDetailsBeansList.addAll(tableDataServices.getDefectDetailsBeansList(releaseName, "Owned"));
		defectDetailsBeansList.addAll(tableDataServices.getDefectDetailsBeansList(releaseName, "Raised"));

		Gson gson = new Gson();
		JsonElement jsonElement = gson.toJsonTree(defectDetailsBeansList, new TypeToken<List<DefectDetailsBean>>() {}.getType());

		return jsonElement.getAsJsonArray();		
	}
	
	@PostMapping("/keyIssuesDetailsData")
	public @ResponseBody JsonArray getKeyIssuesDetailsData(@RequestBody String releaseName) {
		releaseName=releaseName.replace("\"", "");

		Gson gson = new Gson();
		JsonElement jsonElement = gson.toJsonTree(tableDataServices.getKeyIssuesDetailsBeansList(releaseName), new TypeToken<List<KeyIssuesDetailsBean>>() {}.getType());

		return jsonElement.getAsJsonArray();		
	}
	
	@PostMapping("/taskDetailsData")
	public @ResponseBody JsonArray getTaskDetailsData(@RequestBody String releaseName) {
		releaseName=releaseName.replace("\"", "");

		ArrayList<TaskDetailsBean> taskDetailsBeansList=new ArrayList<>();
		taskDetailsBeansList.addAll(tableDataServices.getTaskDetailsBeansList("SIT", releaseName));
		taskDetailsBeansList.addAll(tableDataServices.getTaskDetailsBeansList("QA", releaseName));
		taskDetailsBeansList.addAll(tableDataServices.getTaskDetailsBeansList("BAT/UAT", releaseName));

		Gson gson = new Gson();
		JsonElement jsonElement = gson.toJsonTree(taskDetailsBeansList, new TypeToken<List<TaskDetailsBean>>() {}.getType());

		return jsonElement.getAsJsonArray();
	}

}