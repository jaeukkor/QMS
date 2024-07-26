package com.qms.myCode.vo;

import java.util.List;

import com.qms.table.vo.item.ItemInfoVO;

import lombok.Data;
@Data
public class myOrderItemVO extends ItemInfoVO{
		private String plantLineName;
		private String boxTypeName;
		private String locationName;
		private String unitTypeName;
		
		
		private String comCd;
		private String comName;
		private String comGrpCd;
		private String textt;
		
		
}
