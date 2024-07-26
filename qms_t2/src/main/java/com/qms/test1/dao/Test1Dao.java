package com.qms.test1.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.qms.table.vo.user.UserInfoVO;
import com.qms.test1.vo.Test1VO;

@MapperScan(basePackages="com.qms.test1.dao")
public interface Test1Dao {

public int selectTotalUserCount(Test1VO vo) throws Exception;
	
	public List<UserInfoVO> selectUserList(UserInfoVO vo) throws Exception;
	
	public Test1VO selectGetUserDtlData(Test1VO vo) throws Exception;
	
	public int updateUserdata(Test1VO vo) throws Exception;
	
	public int insertNewUserdata(Test1VO vo) throws Exception;
	
	public String selectchkId(Test1VO vo) throws Exception;
}

