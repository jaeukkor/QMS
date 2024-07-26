package com.qms.myCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.myCode.dao.myOrderDao;
import com.qms.myCode.vo.myOrderItemVO;

@Service
public class myOrderService {

@Autowired
myOrderDao dao;
		public List<myOrderItemVO>selectItemList(myOrderItemVO vo) throws Exception{
			return dao.selectItemList(vo);
		}
		public List<myOrderItemVO> itemTypeSetting (myOrderItemVO vo) throws Exception{
			return dao.itemTypeSetting(vo);
		}
		
}
