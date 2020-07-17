package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.FindBoardVO;

public interface FindBoardDAO {
	public List<FindBoardVO> selectProduct(Map map);
	public List<FindBoardVO> selectProductWithPaging(Map map);
}
