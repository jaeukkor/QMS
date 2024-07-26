package com.qms.approve.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;


import com.qms.approve.vo.ScheduleVO;
@MapperScan(basePackages="com.qms.approve.dao")
public interface ScheduleDao {

	
	public List<ScheduleVO> selectScheList(ScheduleVO vo) throws Exception;
	public List<ScheduleVO> selectModalScheList(ScheduleVO vo) throws Exception;
}
