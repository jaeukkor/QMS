package com.qms.test1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.table.vo.user.UserInfoVO;
import com.qms.test1.dao.Test1Dao;
import com.qms.test1.vo.Test1VO;

@Service
public class Test1Service {
@Autowired
Test1Dao dao;

public int selectTotalUserCount(Test1VO vo) throws Exception{
	return dao.selectTotalUserCount(vo);
}

public List<UserInfoVO> selectUserList(UserInfoVO vo) throws Exception{
	return dao.selectUserList(vo);
}

public Test1VO selectGetUserDtlData(Test1VO vo) throws Exception{
	return dao.selectGetUserDtlData(vo);
}

public int updateUserdata(Test1VO vo) throws Exception{
	return dao.updateUserdata(vo);
}

public int insertNewUserdata(Test1VO vo) throws Exception{
	return dao.insertNewUserdata(vo);
}

public String selectchkId(Test1VO vo) throws Exception{
	return dao.selectchkId(vo);
}


}



