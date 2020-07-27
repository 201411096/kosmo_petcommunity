package com.mycompany.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.ProductCartVO;

public interface BuyDAO {
	
	public List<Map<String,String>> buyList(MemberVO vo);
	
	public List<Map<String,String>> buyReceipt(String id);
	
	public void buyInsert(int totalPrice , ProductCartVO vo,List<ProductCartVO> cartList);
	
}
