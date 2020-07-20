package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.QnaVO;

public interface QnaDAO {
	public int insertQna(QnaVO qnavo);
	public List<QnaVO> selectQnaList(QnaVO qnavo);
	public QnaVO selectOne(QnaVO qnavo);
}