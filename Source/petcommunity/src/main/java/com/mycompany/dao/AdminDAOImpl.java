package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BuylistviewVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<BuylistviewVO> getSalesList(BuylistviewVO buylistviewvo) {
		return mybatis.selectList("admin.adminselectList", buylistviewvo);
	}

	public List<BuylistviewVO> getSearchDate(Map map) {
		return mybatis.selectList("admin.getSearchDate", map);
	}

	public List<BuylistviewVO> selectFindBoardWithPaging(Map map) {
		return mybatis.selectList("admin.selectFindBoardWithPaging", map);
	}

}
