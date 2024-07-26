package com.qms.test1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.table.vo.common.MessageVO;
import com.qms.table.vo.user.UserInfoVO;
import com.qms.test1.service.Test1Service;
import com.qms.test1.vo.Test1VO;
import com.qms.util.AesUtil;
import com.qms.util.Constant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller
public class Test1Controller {
	
@Autowired
Test1Service service;

@RequestMapping("/test1/list")
public String plan() throws Exception{
	return "test1/list";
}

@RequestMapping("/test1/searchlist")
@ResponseBody
public Test1VO searchlist(@ModelAttribute("Test1VO") Test1VO vo) throws Exception {
	vo.setComGrpCd(Constant.POSITION_CD);
	int totalPage = service.selectTotalUserCount(vo); 

	List<UserInfoVO> list = service.selectUserList(vo);
	
	vo.setUserlist(list);
	vo.setTotal(totalPage); //총 데이터수.
	vo.setStartPage(vo.getStartPage()); 
	vo.setCurrentPage(vo.getCurrentPage());//현재페이지

	
	return vo;
}


@RequestMapping("/test1/userSearchlist")
@ResponseBody
public Test1VO userSearchlist(@ModelAttribute("Test1VO") Test1VO vo) throws Exception {
	vo.setComGrpCd(Constant.POSITION_CD);
	int totalPage = service.selectTotalUserCount(vo); 

	List<UserInfoVO> list = service.selectUserList(vo);
	
	vo.setUserlist(list);
	vo.setTotal(totalPage); //총 데이터수.
	vo.setStartPage(vo.getStartPage()); 
	vo.setCurrentPage(vo.getCurrentPage());//현재페이지

	
	return vo;
}

@RequestMapping("/test1/getUserDtlData")
@ResponseBody
public Test1VO getUserDtlData(@ModelAttribute("Test1VO") Test1VO vo) throws Exception {

	vo = service.selectGetUserDtlData(vo);
	
	return vo;
}

@RequestMapping("/test1/updateUserdata")
@ResponseBody
public MessageVO updateUserdata(@ModelAttribute("Test1VO")  Test1VO vo, HttpServletRequest request) throws Exception {
	HttpSession session  = request.getSession();
	Test1VO uservo = (Test1VO) session.getAttribute("QMSUser");
	vo.setUpdUserId(uservo.getUserId());
	
	String pwd = AesUtil.aesEncode(vo.getUserPwd());
	vo.setUserPwd(pwd);
	

	int cnt = service.updateUserdata(vo);
	
	MessageVO msgvo = new MessageVO();
	if(cnt > 0) {
		msgvo.setMsg("데이터 저장 성공");
	}else {
		msgvo.setMsg("데이터 저장 실패");
	}
	
	return msgvo;
}//수정

@RequestMapping("/test1/insertNewUserdata")
@ResponseBody
public MessageVO insertNewUserdata(@ModelAttribute("Test1VO")  Test1VO vo, HttpServletRequest request) throws Exception {
	HttpSession session  = request.getSession();
	Test1VO uservo = (Test1VO) session.getAttribute("QMSUser");
	vo.setRegUserId(uservo.getUserId());
	
	String pwd = AesUtil.aesEncode(vo.getUserPwd());
	vo.setUserPwd(pwd);

	int cnt = service.insertNewUserdata(vo);
	
	MessageVO msgvo = new MessageVO();
	if(cnt > 0) {
		msgvo.setMsg("데이터 저장 성공");
	}else {
		msgvo.setMsg("데이터 저장 실패");
	}
	
	return msgvo;
}//등록

@RequestMapping("/test1/chkId")
@ResponseBody
public MessageVO chkId(@ModelAttribute("Test1VO")  Test1VO vo) throws Exception {

	String str = service.selectchkId(vo);
	MessageVO msgvo = new MessageVO();
	if(str == null) {
		msgvo.setResult(true);
	}else {
		msgvo.setResult(false);
	}
	
	return msgvo;
}//등록


}
