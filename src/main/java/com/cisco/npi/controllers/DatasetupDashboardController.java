package com.cisco.npi.controllers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cisco.npi.beans.DefectDetailsBean;
import com.cisco.npi.beans.KeyIssuesDetailsBean;
import com.cisco.npi.beans.TaskDetailsBean;
import com.cisco.npi.services.ChartDataServices;
import com.cisco.npi.services.MiscDataServices;
import com.cisco.npi.services.TableDataServices;
import com.cisco.npi.services.TimelineDataServices;

@Controller
public class DatasetupDashboardController {

	@Autowired
	private ChartDataServices chartDataServices;
	@Autowired
	private TableDataServices tableDataServices;
	@Autowired
	private TimelineDataServices timelineDataServices;
	@Autowired
	private MiscDataServices miscDataServices;

	@GetMapping(value= {"/","/home"})
	public String getFrontPage(@RequestParam(value="releaseName", required=false)String releaseName,final RedirectAttributes redirectAttributes) {             

		if(releaseName==null)
			redirectAttributes.addAttribute("releaseName", miscDataServices.getLatestRelease());
		else
			redirectAttributes.addAttribute("releaseName", releaseName);

		return "redirect:/index";
	}

	@GetMapping("/index")
	public ModelAndView getData(@ModelAttribute("releaseName") String releaseName) {


		ModelAndView modelAndView=null;
		modelAndView=new ModelAndView("index");
		System.out.println(releaseName);

		modelAndView.addObject("releaseName",releaseName);
		System.out.println(tableDataServices.getKeyIssuesDetailsBeansList(releaseName));

		modelAndView.addObject("quartersList", miscDataServices.getReleaseList(releaseName));

		modelAndView.addObject("chartDataList", chartDataServices.CompileChartDataList(releaseName));                                          

		modelAndView.addObject("keyIssueList", tableDataServices.getKeyIssuesDetailsBeansList(releaseName));

		modelAndView.addObject("ownedDefectList", tableDataServices.getDefectDetailsBeansList(releaseName, "Owned"));
		modelAndView.addObject("raisedDefectList", tableDataServices.getDefectDetailsBeansList(releaseName, "Raised"));

		modelAndView.addObject("DMtimelineList", timelineDataServices.getReleaseTimelineDetailsBeansList(releaseName, "DM"));
		modelAndView.addObject("DSTimelineList", timelineDataServices.getReleaseTimelineDetailsBeansList(releaseName, "DS"));

		modelAndView.addObject("QaCategoryStatusList", tableDataServices.getTaskDetailsBeansList("QA", releaseName));
		modelAndView.addObject("SitCategoryStatusList", tableDataServices.getTaskDetailsBeansList("SIT", releaseName));
		modelAndView.addObject("BatuatCategoryStatusList", tableDataServices.getTaskDetailsBeansList("BAT/UAT", releaseName));

		return modelAndView;

	}

	@PostMapping("/editDefect")
	public String editDefect(@ModelAttribute("editDefect")DefectDetailsBean defectModel) {
		defectModel.setDefectUpdateDate(new Date());
		String releaseName=defectModel.getReleaseName();
		tableDataServices.update(defectModel);                     
		return "redirect:/home?releaseName="+releaseName;
	}

	@PostMapping("/editKeyIssue")
	public String editKeyIssue(@ModelAttribute("editKeyIssue")KeyIssuesDetailsBean keyIssueModel) {
		keyIssueModel.setUpdatedDate(new Date());
		String releaseName=keyIssueModel.getReleaseName();
		tableDataServices.update(keyIssueModel);                          
		return "redirect:/home?releaseName="+releaseName;
	}

	@PostMapping("/editTask")
	public String editTask(@ModelAttribute("editTask")TaskDetailsBean taskModel) {
		taskModel.setUpdatedDate(new Date());
		String releaseName=taskModel.getReleaseName();
		tableDataServices.update(taskModel);               
		return "redirect:/home?releaseName="+releaseName;
	}

	@PostMapping("/deleteKeyIssue")
	public String deleteData(@ModelAttribute("deleteKeyIssue")KeyIssuesDetailsBean keyIssuesDetailsBean) {
		
		String releaseName=keyIssuesDetailsBean.getReleaseName();
		tableDataServices.delete(keyIssuesDetailsBean);                             
		return "redirect:/home?releaseName="+releaseName;
	}

	@PostMapping("/deleteDefect")
	public String deleteData(@ModelAttribute("deleteDefect")DefectDetailsBean defectDetailsBean) {
		
		String releaseName=defectDetailsBean.getReleaseName();
		tableDataServices.delete(defectDetailsBean);                   
		return "redirect:/home?releaseName="+releaseName;
	}

	@PostMapping("/deleteTask")
	public String deleteData(@ModelAttribute("deleteTask")TaskDetailsBean taskDetailsBean) {
		String releaseName=taskDetailsBean.getReleaseName();
		tableDataServices.delete(taskDetailsBean);                           
		return "redirect:/home?releaseName="+releaseName;
	}

	@PostMapping("/addDefect")
	public String addData(@ModelAttribute("addDefect")DefectDetailsBean addDefectDetailsBean) {
		String releaseName=addDefectDetailsBean.getReleaseName();
		
		addDefectDetailsBean.setId(null);
		addDefectDetailsBean.setDefectOpenDate(new Date());
		addDefectDetailsBean.setDefectUpdateDate(new Date());

		tableDataServices.add(addDefectDetailsBean);

		return "redirect:/home?releaseName="+releaseName;
	}

	@PostMapping("/addKeyIssue")
	public String addData(@ModelAttribute("addKeyIssue")KeyIssuesDetailsBean addKeyIssuesDetailsBean) {
		String releaseName=addKeyIssuesDetailsBean.getReleaseName();
        addKeyIssuesDetailsBean.setId(null);
		addKeyIssuesDetailsBean.setCreatedDate(new Date());
		addKeyIssuesDetailsBean.setUpdatedDate(new Date());
		addKeyIssuesDetailsBean.setCreatedBy("Default User");
		addKeyIssuesDetailsBean.setUpdatedBy("Default User");

		tableDataServices.add(addKeyIssuesDetailsBean);

		return "redirect:/home?releaseName="+releaseName;
	}

	@PostMapping("/addTask")
	public String addData(@ModelAttribute("addTask")TaskDetailsBean addTaskDetailsBean) {
		String releaseName=addTaskDetailsBean.getReleaseName();

		addTaskDetailsBean.setId(null);
		addTaskDetailsBean.setRequestRaisedDate(new Date());
		addTaskDetailsBean.setUpdatedDate(new Date());
		addTaskDetailsBean.setUpdatedBy("Default User");
		addTaskDetailsBean.setRequestRaisedBy("Default User");

		tableDataServices.add(addTaskDetailsBean);

		return "redirect:/home?releaseName="+releaseName;
	}
}
