package com.qms.test2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.item.vo.ItemVO;
import com.qms.partner.vo.PartnerVO;
import com.qms.test2.dao.Test2Dao;
import com.qms.test2.vo.Test2VO;

@Service
public class Test2Service {
@Autowired
Test2Dao dao;

public int selectTotalPartnerCount(Test2VO vo) throws Exception{
	return dao.selectTotalPartnerCount(vo);
}

public List<PartnerVO> selectPartnerList(Test2VO vo) throws Exception{
	return dao.selectPartnerList(vo);
}

//모달

public Test2VO selectPartnerDtldata(Test2VO vo) throws Exception{
	return dao.selectPartnerDtldata(vo);
}

public List<ItemVO> selectPartnerItemList(Test2VO vo) throws Exception {
	return dao.selectPartnerItemList(vo);
} 

public int deletePartnerItem(Test2VO vo) throws Exception{
	return dao.deletePartnerItem(vo);
}

public int insertPartnerItem(Test2VO vo) throws Exception{
	return dao.insertPartnerItem(vo);
}

public int InsertOrSelectPartnerdata(Test2VO vo) throws Exception{
	return dao.InsertOrSelectPartnerdata(vo);
}

}


