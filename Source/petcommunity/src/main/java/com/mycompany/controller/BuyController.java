package com.mycompany.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.ProductCartVO;
import com.mycompany.service.BuyService;
import com.mycompany.service.ProductCartService;

@Controller
public class BuyController {

	@Autowired
	private BuyService buyService;
	
	@Autowired
	private ProductCartService productCartService;
	

	/* 
	    * 함수 이름 : buyReceipt
	    * 주요 기능 : 주문내역 상세페이지
	    * 함수 내용 : 이전 페이지에서 주문번호를 넘겨받아서 product와 member의 정보를 가져옴
	    */
	@RequestMapping(value = "buyReceipt.do")
	public ModelAndView buyReceipt(String buy) {
		ModelAndView mv = new ModelAndView();
		/* ArrayList<String> list2 = new ArrayList<>(); */
		List<Map<String, String>> buyList = buyService.buyReceipt(buy);

		mv.addObject("buyReceipt", buyList);
		mv.setViewName("buyReceipt");
		return mv;
	}
	
	@RequestMapping(value="buyInsert.do")
	public ModelAndView buyInsert(HttpServletRequest request,ProductCartVO cvo) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		int totalPrice=0;
		cvo.setMemberId(mvo.getMemberId());
		
		ModelAndView mv = new ModelAndView();
		List<ProductCartVO> cartList = productCartService.getCartListById(cvo);
		for(int i=0;i<cartList.size();i++) {
		totalPrice+=Integer.parseInt(cartList.get(i).getBuycartlistCnt())*Integer.parseInt(cartList.get(i).getProductPrice());
		}
		
		buyService.buyInsert(totalPrice,cvo,cartList); 
		mv.setViewName("mypage");
		return mv;
	}
}
