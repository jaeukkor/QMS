package com.qms.test2.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.qms.item.vo.ItemVO;
import com.qms.partner.vo.PartnerVO;
import com.qms.test2.vo.Test2VO;

@MapperScan(basePackages="com.qms.test2.dao")
public interface Test2Dao {
	
	public int selectTotalPartnerCount(Test2VO vo) throws Exception;
	
	public List<PartnerVO> selectPartnerList(Test2VO vo) throws Exception;
	
	
	//모달
	
	public Test2VO selectPartnerDtldata(Test2VO vo) throws Exception;
	
	public List<ItemVO> selectPartnerItemList(Test2VO vo) throws Exception; 
	
	public int deletePartnerItem(Test2VO vo) throws Exception;
	
	public int insertPartnerItem(Test2VO vo) throws Exception;
	
	public int InsertOrSelectPartnerdata(Test2VO vo) throws Exception;
}
	