package com.qms.myCode.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.myCode.service.myOrderService;
import com.qms.myCode.vo.myOrderItemVO;
@Controller
public class myOrderController {
@Autowired
myOrderService service;

	@RequestMapping("/myOrder/list")
	public String product() throws Exception{
		return "/myOrder/list";
	}
	@RequestMapping("/myOrder/searchList")
	@ResponseBody
	public List<myOrderItemVO>searchList(@ModelAttribute myOrderItemVO vo) throws Exception{
		List<myOrderItemVO> list = service.selectItemList(vo);
		return list;
	}
	@RequestMapping("/myOrder/iinit")
	@ResponseBody
	public List<myOrderItemVO>iinit(@ModelAttribute myOrderItemVO vo) throws Exception{
		List<myOrderItemVO> list = service.itemTypeSetting(vo);
		return list;
	}
	
}
