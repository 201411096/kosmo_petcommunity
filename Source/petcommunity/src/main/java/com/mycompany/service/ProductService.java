package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.ProductVO;

public interface ProductService {
	public List<ProductVO> selectProductListBytagCategory(Map searchMap);
	public List<ProductVO> selectProductListForPagination(Map searchMap);
	public List<String> selectAutoSearchProduct(String searchSomething);
	public ProductVO selectProductInfo(int productId);
	public List<ProductVO> searchListProduct(Map<String, String> search);
}
