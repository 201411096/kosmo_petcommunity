package com.mycompany.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.BuyDAOImpl;
import com.mycompany.domain.MemberVO;
import com.mycompany.domain.MyBuyVO;

@Service("BuyService")
public class BuyServiceImpl implements BuyService{
	
	@Autowired
	BuyDAOImpl buyDAO;

	@Override
	public List<MyBuyVO> buyList(MemberVO vo) {
		
		return buyDAO.buyList(vo);
	}

	@Override
	public List<Map<String,String>> buyReceipt(String id) {
		
		return buyDAO.buyReceipt(id);
	} 

}