package com.dogether.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogether.domain.MemberVO;
import com.dogether.domain.OrderVO;
import com.dogether.domain.ProductsVO;
import com.dogether.domain.Shopping_cartVO;
@Repository("productsDAO")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<ProductsVO> getProductsList() {
		System.out.println("getProductsList실행==========");
		return mybatis.selectList("ProductsDAO.getProductsList");
	}

	@Override
	public ProductsVO detailProduct(ProductsVO vo) {
		System.out.println("detailProduct실행===========");
		return (ProductsVO)mybatis.selectOne("ProductsDAO.detailProduct",vo);
	}

	@Override
	public int insertIntoCart(Shopping_cartVO vo) {
		System.out.println("insertIntoCart실행===========");
		return mybatis.insert("ProductsDAO.insertIntoCart", vo);
	}

	@Override
	public List<HashMap<String, String>> getShoppingCartList(MemberVO vo) {
		System.out.println("getShoppingCartList실행==========");
		return mybatis.selectList("ProductsDAO.getShoppingCartList",vo);
	}

	@Override
	public int deleteFromCart(Shopping_cartVO vo) {
		System.out.println("deleteFromCart실행==============");
		return mybatis.delete("ProductsDAO.deleteFromCart",vo);
	}

	@Override
	public Shopping_cartVO productCheck(Shopping_cartVO vo) {
		System.out.println("productCheck실행=================");
		return mybatis.selectOne("ProductsDAO.productCheck", vo);
	}

	@Override
	public int updateFromCart(String productID[], int productQuantity[],String memberID) {
		int count = 1;
		for(int i=0;i<productID.length;i++) {
			Map<String,Object> mp = new HashMap<>();
			mp.put("productID", productID[i]);
			mp.put("productQuantity", productQuantity[i]);
			mp.put("memberID", memberID);
			count++;
			mybatis.update("ProductsDAO.updateQuantity",mp);
		}
		return count;
	}

	@Override
	public MemberVO showUserInfo(MemberVO vo) {
		System.out.println("showUserInfo실행==================");
		return mybatis.selectOne("ProductsDAO.showUserInfo", vo);
	}

	@Override
	public int insertOrderList(List<Shopping_cartVO> vo,String OrderID) {
		System.out.println("insertOrderList실행================");
		int count = 1;
		for(int i=0;i<vo.size();i++) {
			Map<String,Object> mp = new HashMap<String,Object>();
			mp.put("orderID", OrderID);
			mp.put("memberID", vo.get(i).getMemberID());
			mp.put("productID", vo.get(i).getProductID());
			mybatis.insert("ProductsDAO.insertOrderList", mp);
			count++;
		}
		return count;
	}

	@Override
	public List<Shopping_cartVO> afterGetShoppingCartList(String memberid) {
		System.out.println("afterGetShoppingCartList실행==============");
		return mybatis.selectList("ProductsDAO.afterGetShoppingCartList", memberid);
	}

	@Override
	public List<ProductsVO> bestProductsList() {
		return mybatis.selectList("ProductsDAO.bestProductsList");
	}

	//관리자페이지 상품 추가
	@Override
	public int productsInsert(ProductsVO vo) {
		System.out.println("mybatis 상품 추가하기 호출!!");
		return mybatis.insert("ProductsDAO.productsInsert", vo);
	}

	//관리자페이지 상품 수정
	@Override
	public void productsUpdate(ProductsVO vo) {
		System.out.println("mybatis 상품 수정하기 호출함");
		mybatis.update("ProductsDAO.productsUpdate", vo);
	}
	
	//관리자페이지 상품 삭제
	@Override
	public void productsDelete(ProductsVO vo) {
		System.out.println("mybatis 상품 삭제 호출함");
		System.out.println(vo.getProductID()+"삭삭1");
		mybatis.delete("ProductsDAO.productsDelete", vo);
	}
	
}
