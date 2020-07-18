package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.FindBoardVO;

@Repository("findBoardDAO")
public class FindBoardDAOImpl implements FindBoardDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<FindBoardVO> selectFindBoard(Map map){
		return mybatis.selectList("findBoardDAO.getFindBoardList", map);
	}

	@Override
	public List<FindBoardVO> selectFindBoardWithPaging(Map map) {
		return mybatis.selectList("findBoardDAO.getFindBoardListWithPaging", map);
	}

	@Override
	public int insertFindBoard(FindBoardVO findBoardVO) {
		return mybatis.insert("findBoardDAO.insertFindBoard", findBoardVO);
	}
	
}
