package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.AdminDAOImpl;
import com.mycompany.domain.BuylistviewVO;
import com.mycompany.domain.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAOImpl adminDAO;

	@Override
	public List<BuylistviewVO> adminselectList(BuylistviewVO buylistviewvo) {
		return adminDAO.adminselectList(buylistviewvo);
	}
	
	@Override
	public List<BuylistviewVO> getSearchDate(Map map) {
		return adminDAO.getSearchDate(map);
	}

	
	//넥사크로 
	public List<MemberVO> getMemberList(MemberVO membervo) {
		return adminDAO.getgetMemberList(membervo);
	}

	@Override
	public List<MemberVO> getMemberSelect(Map map) {
		return adminDAO.getMemberSelect(map);
	}

	public int deleteInfo(String memberId) {
		return adminDAO.deleteInfo(memberId);
	}


	
}
