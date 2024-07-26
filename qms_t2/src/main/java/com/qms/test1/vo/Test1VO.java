package com.qms.test1.vo;

import java.util.List;

import com.qms.table.vo.user.UserInfoVO;

import lombok.Data;
@Data
public class Test1VO extends UserInfoVO{

	
private List<UserInfoVO> userlist; //유저리스트
	
	private String deptName;	 //부서이름
	
	private String comName; 	 
	
	private String comGrpCd; 	 
	
	private String positionCd; 	 
	
	private String regDtFrom; 	 
	private String regDtTo; 	 
	
	private String updUserId;
}
