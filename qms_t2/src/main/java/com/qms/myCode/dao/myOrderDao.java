package com.qms.myCode.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.qms.myCode.vo.myOrderItemVO;

@MapperScan(basePackages="com.qms.myCode.dao")
public interface myOrderDao {
	public List<myOrderItemVO>selectItemList(myOrderItemVO vo) throws Exception;
	public List<myOrderItemVO> itemTypeSetting (myOrderItemVO vo) throws Exception;
	

}
