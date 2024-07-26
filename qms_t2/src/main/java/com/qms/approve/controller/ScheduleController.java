package com.qms.approve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.approve.service.ScheduleService;
import com.qms.approve.vo.ScheduleVO;
import com.qms.util.Constant;

@Controller
public class ScheduleController {
@Autowired
ScheduleService service;

		@RequestMapping("/schedule/list")
		public String schedule(Model model) throws Exception{
			model.addAttribute("baseYear", Constant.BASE_YEAR);
			return "schedule/list";
		}
		@RequestMapping("/schedule/sche")
		@ResponseBody
		public List<ScheduleVO> sche(@ModelAttribute("ScheduleVO") ScheduleVO vo) throws Exception{
			List<ScheduleVO> list = service.selectScheList(vo);
			return list;
		}
		@RequestMapping("/schedule/scheModal")
		@ResponseBody
		public List<ScheduleVO> scheModal(@ModelAttribute("ScheduleVO") ScheduleVO vo) throws Exception{
			if(Integer.parseInt(vo.getScheD())<10) {
				vo.setScheD(vo.getScheYear()+vo.getScheMonth()+"0"+vo.getScheD());
			}else {
				vo.setScheD(vo.getScheYear()+vo.getScheMonth()+vo.getScheD());
			}
			
			List<ScheduleVO> list = service.selectModalScheList(vo);
			return list;
		}
}
