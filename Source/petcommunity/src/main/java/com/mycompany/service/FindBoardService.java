package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.FindBoardVO;

public interface FindBoardService {
	public List<FindBoardVO> selectProduct(FindBoardVO findBoardVO);
	public List<FindBoardVO> selectProductWithPaging(Map map);
}
