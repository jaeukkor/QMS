package com.qms.test2.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.item.vo.ItemVO;
import com.qms.partner.vo.PartnerVO;
import com.qms.table.vo.common.MessageVO;
import com.qms.test2.service.Test2Service;
import com.qms.test2.vo.Test2VO;
import com.qms.user.vo.UserVO;
import com.qms.util.Constant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Test2Controller {
@Autowired
Test2Service service;

@RequestMapping("/test2/list")
public String partnerlist() throws Exception{
	return "test2/list";
}

@RequestMapping("/test2/searchlist")
@ResponseBody
public Test2VO searchlist(@ModelAttribute("Test2VO") Test2VO vo) throws Exception {
	/*List<String> comGrpCdList = Arrays.asList(Constant.ITEM_TYPE,Constant.UNIT_TYPE, Constant.PLANT_LINE, Constant.BOX_TYPE, Constant.LOCATION);
		 vo.setComGrpCdList(comGrpCdList); 공통코드 */
	 
    int totalPage = service.selectTotalPartnerCount(vo); 
    List<PartnerVO> list = service.selectPartnerList(vo);

    vo.setPartnerlist(list);
    vo.setTotal(totalPage);  // 총 데이터 수
    vo.setStartPage(vo.getStartPage()); 
    vo.setCurrentPage(vo.getCurrentPage());  // 현재 페이지

    return vo;
}

@RequestMapping("/test2/getPartnerDtldata")
@ResponseBody
public Test2VO getPartnerDtldata(@ModelAttribute("Test2VO") Test2VO vo) throws Exception {
	vo = service.selectPartnerDtldata(vo);
	List<String> comGrpCdList = Arrays.asList(Constant.BOX_TYPE, Constant.LOCATION);
	 vo.setComGrpCdList(comGrpCdList); 
	
	List<ItemVO> list = service.selectPartnerItemList(vo);
	
	vo.setItemlist(list);
	
	return vo;
}

@RequestMapping("/test2/saveOrUpdatePartner")
@ResponseBody
public MessageVO saveOrUpdatePartner(@ModelAttribute("Test2VO") Test2VO vo, HttpServletRequest request) throws Exception {
    HttpSession session = request.getSession();
    UserVO uservo = (UserVO) session.getAttribute("QMSUser");
    MessageVO msgvo = new MessageVO();
    
    vo.setRegUserId(uservo.getUserId()); 

    int cnt = service.InsertOrSelectPartnerdata(vo);
    if (cnt > 0) {
        msgvo.setMsg("거래처 정보 저장 성공");
        //delete 후 insert
        service.deletePartnerItem(vo);
        
        if(vo.getItemlist()!=null && vo.getItemlist().size()>0) {
        	for(int i=vo.getItemlist().size()-1;i>=0;i--) {
        		if(vo.getItemlist().get(i).getItemCd()==null || vo.getItemlist().get(i).getItemCd().equals("")){
        			vo.getItemlist().remove(i);
        		} 
        	}
        	cnt = service.insertPartnerItem(vo);
        }
        if (cnt > 0) {
            msgvo.setMsg("제품 정보 저장 성공");
        } else {
            msgvo.setMsg("제품 정보 저장 실패");
        }
    } else {
        msgvo.setMsg("거래처 정보 저장 실패");
    }

    return msgvo;
}



}


