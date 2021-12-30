package com.dogether.dao;

import java.util.HashMap;
import java.util.List;

import com.dogether.domain.MemberVO;
import com.dogether.domain.OrderVO;
import com.dogether.domain.ProductsVO;
import com.dogether.domain.Shopping_cartVO;



public interface ProductDAO {
	//메인쇼핑몰들어갈때 베스트상품 가져오기
	public List<ProductsVO> bestProductsList();
	//유저 정보 가져오기
	public MemberVO showUserInfo(MemberVO vo);
	//토탈상품전체로 불러오기
	public List<ProductsVO> getProductsList();
	//상품 상세페이지
	public ProductsVO detailProduct(ProductsVO vo);
	//장바구니 추가
	public int insertIntoCart(Shopping_cartVO vo);
	//장바구니 삭제
	public int deleteFromCart(Shopping_cartVO vo);
	//장바구니목록 가져오기
	public List<HashMap<String,String>> getShoppingCartList(MemberVO vo);
	//장바구니에 이미 있는 상품인지 체크
	public Shopping_cartVO productCheck(Shopping_cartVO vo);
	//장바구니에서 수량 변경하기
	public int updateFromCart(String productID[], int productQuantity[],String memberID);
	//주문완료된 상품들 order에 추가하기
	public int insertOrderList(List<Shopping_cartVO> vo,String OrderID);
	//결제할때 장바구니 가져오기
	public List<Shopping_cartVO>  afterGetShoppingCartList(String memberid);
	//관리자페이지 상품 추가하기
	public int productsInsert(ProductsVO vo);
	//관리자페이지 상품 수정하기
	public void productsUpdate(ProductsVO vo);
	//관리자페이지 상품 삭제하기
	public void productsDelete(ProductsVO vo);
}
