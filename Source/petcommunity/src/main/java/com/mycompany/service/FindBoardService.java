package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.FindBoardVO;

public interface FindBoardService {
	public List<FindBoardVO> selectFindBoard(Map map);
	public List<FindBoardVO> selectFindBoardWithPaging(Map map);
	public int insertFindBoard(FindBoardVO findBoardVO);
	public FindBoardVO getFindBoard(FindBoardVO findBoardVO);
	public int increaseFindBoardReadcount(FindBoardVO findBoardVO);
}
