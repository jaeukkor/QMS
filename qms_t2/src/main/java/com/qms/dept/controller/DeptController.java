package com.qms.dept.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.code.service.CodeService;
import com.qms.dept.service.DeptService;
import com.qms.dept.vo.DeptVO;
import com.qms.partner.vo.PartnerVO;
import com.qms.table.vo.common.ComCodeVO;
import com.qms.table.vo.common.MessageVO;
import com.qms.user.vo.UserVO;
import com.qms.util.Constant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DeptController {

    @Autowired
    DeptService service;

    @Autowired
    CodeService codeService;

    //@Autowired
    //private ExcelService excelService;
    
    @RequestMapping("/dept/list")
	public String deptlist() throws Exception{
		return "dept/dept01";
	}
    
    @RequestMapping("/dept/searchlist")
	@ResponseBody
	public DeptVO searchlist(@ModelAttribute("DeptVO") DeptVO vo) throws Exception {
    	ComCodeVO cvo = new ComCodeVO();
    	cvo.setComGrpCd(Constant.POSITION_CD);
    	 List<ComCodeVO> positionlist = codeService.selectGetdata(cvo);

    	 //DeptVO dvo = new DeptVO();
    	 vo.setPositionlist(positionlist);

	    int totalPage = service.selectTotalDeptCount(vo); 
	    List<DeptVO> list = service.selectDeptList(vo);

	    vo.setDeptlist(list);
	    vo.setTotal(totalPage);  // 총 데이터 수
	    vo.setStartPage(vo.getStartPage()); 
	    vo.setCurrentPage(vo.getCurrentPage());  // 현재 페이지

	    return vo;
	}
    
    @RequestMapping("/dept/getDeptDtlData")
    @ResponseBody
    public DeptVO getDeptDtlData(@ModelAttribute("DeptVO") DeptVO vo) throws Exception {
		vo = service.selectDeptDtlData(vo);
		
		return vo;
	}
    
    @RequestMapping("/dept/upDeptName")
	@ResponseBody
	public List<DeptVO> upDeptName(@ModelAttribute("DeptVO") DeptVO vo) throws Exception {
		List<DeptVO> list = service.selectUpDept(vo);
		
		return list;
	}
    
	/*@RequestMapping("/dept/saveOrUpdateDept")
	@ResponseBody
	public MessageVO saveOrUpdateDept(@ModelAttribute("DeptVO") DeptVO vo, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    UserVO uservo = (UserVO) session.getAttribute("QMSUser");
	    MessageVO msgvo = new MessageVO();
	    
	    vo.setRegUserId(uservo.getUserId()); 

	    int cnt = service.InsertOrSelectPartnerdata(vo);
	    if (cnt > 0) {
	        msgvo.setMsg("거래처 정보 저장 성공");
	    } else {
	        msgvo.setMsg("거래처 정보 저장 실패");
	    }

	    return msgvo;
	}*/
	
    
	

   

}
