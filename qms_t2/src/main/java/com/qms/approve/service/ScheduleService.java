package com.qms.approve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.qms.approve.dao.ScheduleDao;
import com.qms.approve.vo.ScheduleVO;

@Service
public class ScheduleService {
@Autowired
ScheduleDao dao;
	public List<ScheduleVO> selectScheList(ScheduleVO vo) throws Exception{
		return dao.selectScheList(vo);
	}
	public List<ScheduleVO> selectModalScheList(ScheduleVO vo) throws Exception{
		return dao.selectModalScheList(vo);
	}
}
