package com.dogether.service;

import java.util.HashMap;
import java.util.List;

import com.dogether.domain.MemberVO;
import com.dogether.domain.OrderVO;
import com.dogether.domain.ProductsVO;
import com.dogether.domain.Shopping_cartVO;

public interface ProductService {

	//쇼핑몰들어갈때 베스트 상품 가져오기
	List<ProductsVO> bestProductsList();
	//유저의 정보를 가져오기
	MemberVO showUserInfo(MemberVO vo);
	//모든 상품목록 가져오기
	List<ProductsVO> getProductsList();
	//상품상세페이지 넘길떄
	ProductsVO detailProduct(ProductsVO vo);
	//장바구니 추가
	int insertIntoCart(Shopping_cartVO vo);
	//장바구니 삭제
	int deleteFromCart(Shopping_cartVO vo);
	//장바구니 목록 가져오기
	List<HashMap<String, String>> getShoppingCartList(MemberVO vo);
	//장바구니에 이미 있는지 조회
	Shopping_cartVO productCheck(Shopping_cartVO vo);
	//장바구니에서 수량 변경하기
	public int updateFromCart(String productID[], int productQuantity[],String memberID);
	//주문완료된 상품 order에 추가하기
	public int insertOrderList(List<Shopping_cartVO> vo,String OrderID);
	//결제할때 장바구니에서 값 가져오기
	public List<Shopping_cartVO> afterGetShoppingCartList(String memberid);
	//관리자페이지 상품 추가하기
	public int productsInsert(ProductsVO vo);
	//관리자페이지 상품 수정하기
	public void productsUpdate(ProductsVO vo);
	//상품 삭제하기
	public void productsDelete(ProductsVO vo); 

}
