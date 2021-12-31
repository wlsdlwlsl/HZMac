package com.dogether.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogether.dao.OrderDAOImpl;
import com.dogether.domain.OrderVO;

@Repository("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAOImpl orderDAO; 

	@Override
	public List<OrderVO> getOrderList() {
		return orderDAO.getOrderList();
	}

	@Override
	public List<HashMap<String,Object>> getMyOrderList(String memberID) {
		return orderDAO.getMyOrderList(memberID);
	}

	@Override
	public void updatebuyingConfirm(OrderVO vo) {
		orderDAO.updatebuyingConfirm(vo);
	}
	
	// 주문 list + 상품 이미지 출력(관리자페이지)
	@Override
	public List<HashMap<String, Object>> getOrderList(OrderVO sortTypeOrder) {
		return orderDAO.getOrderList(sortTypeOrder);
	}

}
