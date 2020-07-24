package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.QnaVO;
import com.mycompany.service.MemberService;
import com.mycompany.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

	// 고객센터 페이지 이동
	@RequestMapping("/cs.do")
	public ModelAndView getQnaPage(QnaVO qnavo) {
		ModelAndView mv = new ModelAndView();

		List<QnaVO> qnavoList = qnaService.selectQnaList(qnavo);
		mv.setViewName("/qnaBoardList");
		mv.addObject("qnavoList", qnavoList);

		return mv;
	}

	// 글쓰기 페이지 이동 (조건 : 로그인시 이동)
	@RequestMapping("/write.do")
	public ModelAndView getQnaWrite(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("memberVO") == null) {
			mv.setViewName("login");
		} else {
			mv.setViewName("qnaBoardWrite");
		}
		return mv;
	}

	// 글 입력
	@RequestMapping(value = "/writeIntoQna.do", produces = "application/text; charset=utf-8")
	public String insertQna(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("memberVO") != null) {
			qnavo.setMemberId(((MemberVO) session.getAttribute("memberVO")).getMemberId());
		} else if (session.getAttribute("memberVO") == null) {
			mv.setViewName("main");
		}
		mv.setViewName("qnaBoardWrite");
		qnaService.insertQna(qnavo);
		return "redirect:/qnaList.do";
	}

	// 글 입력 후 리스트에서 출력
//	@RequestMapping("qnaList.do")
//	public ModelAndView selectQnaList(QnaVO qnavo, HttpSession session) {
//		ModelAndView mv = new ModelAndView();
//		List<QnaVO> qnavoList = qnaService.selectQnaList(qnavo);
//		// 관리자 확인
//		MemberVO membervo= (MemberVO)session.getAttribute("memberVO");
//			mv.setViewName("/qnaBoardList");
//			mv.addObject("qnavoList", qnavoList);
//		
//		
//		return mv;
//	}
	@RequestMapping("qnaList.do")
	public ModelAndView selectQnaList(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<QnaVO> qnavoList = qnaService.selectQnaList(qnavo);
		// 관리자 확인
		MemberVO membervo= (MemberVO)session.getAttribute("memberVO");
			mv.setViewName("/qnaBoardList");
			mv.addObject("qnavoList", qnavoList);
			mv.addObject("membervo", membervo);
		
		return mv;
	}
	
	// 게시글 상세보기 출력
	@RequestMapping("qnaContent.do")
	public ModelAndView getQnaBoard(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		qnavo=qnaService.selectOne(qnavo);
		MemberVO membervo=(MemberVO)session.getAttribute("memberVO");
		if(membervo==null) {
			qnaService.updateReadcount(qnavo);
			mv.setViewName("qnaBoardContent");
			mv.addObject("qnaContent", qnaService.selectOne(qnavo));
			
		}else if(membervo.getMemberFlag().equals("0")) {
			qnaService.updateReadcount(qnavo);
			mv.setViewName("qnaBoardContent");
			mv.addObject("qnaContent", qnaService.selectOne(qnavo));
			
		}else if(membervo.getMemberFlag().equals("1")) {
			System.out.println("플래그값 확인"+(MemberVO)session.getAttribute("memberVO"));
			qnaService.updateReadcount(qnavo); // 조회수
			String admin=((MemberVO)session.getAttribute("memberVO")).getMemberFlag();
			System.out.println("admin값 확인 : "+admin);
			List<QnaVO> listQna= qnaService.selectListRe(qnavo);
			mv.setViewName("qnaBoardContent");
			mv.addObject("qnaContent", qnaService.selectOne(qnavo));
			mv.addObject("admin",admin);
			int groupListSize = listQna.size();
			mv.addObject("groupListSize", groupListSize);
		}
		
		return mv;
	}

	// 게시글 수정페이지 이동하기 (조건 : 아이디 일치하면 페이지 이동)
	@RequestMapping(value = "qnaModify.do", produces = "application/text; charset=utf-8")
	public ModelAndView modifyform(QnaVO qnavo, HttpSession session) {		
		ModelAndView mv = new ModelAndView();
		qnavo=qnaService.selectOne(qnavo);
		String id = null;
		String con = null;
		
		id=qnavo.getMemberId();
		con=qnavo.getQuestionboardContent();
		System.out.println("받아온 아이디"+id);
		System.out.println("받아온 내용"+con);
		
		// 아이디조건
		if (session.getAttribute("memberVO") == null) {// 로그인x 경우
			mv.setViewName("login");

		} else if (((MemberVO) session.getAttribute("memberVO")).getMemberId().equals(qnavo.getMemberId())) { 																						// 경우
			mv.setViewName("qnaBoardModify");
			mv.addObject("qnaContent", qnaService.selectOne(qnavo));

		} else { // 작성 글 아이디 != 아이디 경우
			mv.setViewName("main");
		}
		return mv;
	}

	// 수정한 게시글 저장
	@RequestMapping("modify.do")
	public String modifyQna(QnaVO qnavo) {
		System.out.println("modifyQna 확인(글번호) :" + qnavo.getQuestionboardId());
		
		int result = qnaService.updateQna(qnavo);
		if (result != 0) {
			return "redirect:/qnaList.do";
		}
		return "main.do";
	}

	// 게시글 삭제
	@RequestMapping(value ="delete.do", produces = "application/text; charset=utf-8")
	public ModelAndView deleteQna(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Object sessionInfo = (MemberVO) session.getAttribute("memberVO");
		qnavo=qnaService.selectOne(qnavo);
		String id = qnavo.getMemberId();
		// 연결계정 확인하여 삭제
		if (sessionInfo == null) {
			mv.setViewName("redirect:/login.do"); 
		
		// 계정아이디와 작성아이디 일치 or 관리자인 경우 삭제
		} else if (((MemberVO)sessionInfo).getMemberId().equals(id) || ((MemberVO)sessionInfo).getMemberFlag().equals("1")) {
			
			qnaService.delete(qnavo);
			mv.setViewName("redirect:/qnaList.do");
			
		} else {
			mv.setViewName("redirect:/main.do");

		}return mv;
	}
		
		// 검색버튼 눌렀을 때 입력 검색어 출력
		@RequestMapping("keyword.do")
		public ModelAndView selectKeyword(QnaVO qnavo, String searchType, String keyword) {
			Map map = new HashMap();
			ModelAndView mv = new ModelAndView();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			List<QnaVO> qnavoList = qnaService.selectKeyword(map);
			mv.addObject("qnavoList", qnavoList);
			mv.setViewName("/qnaBoardList");
			
			return mv;
		}
		
		// 답변하기 버튼 클릭시 답변페이지 이동
		@RequestMapping("reply.do")
		public ModelAndView replyQna(QnaVO qnavo) {
			ModelAndView mv = new ModelAndView();
			qnavo=qnaService.selectGroupId(qnavo);
			mv.addObject("qnaReplyContent", qnavo);
			mv.setViewName("qnaReplyBoardWrite");
			
			return mv;
		}
		
		// 관리자 작성완료 버튼 클릭시 입력 후 리스트페이지로 연결
		@RequestMapping("replyWrite.do")
		public ModelAndView replyWrite(QnaVO qnavo, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			qnavo.getQuestionboardContent();
			String re = "RE : ";
			qnavo.setQuestionboardTitle(re+qnavo.getQuestionboardTitle());
			qnavo.setMemberId(((MemberVO)session.getAttribute("memberVO")).getMemberId());
			qnaService.insertReplyQna(qnavo);
			mv.setViewName("redirect:/qnaList.do");
			
			return mv;
		}
	

}
