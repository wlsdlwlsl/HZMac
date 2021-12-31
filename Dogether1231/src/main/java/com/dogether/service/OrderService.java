package com.dogether.service;

import java.util.HashMap;
import java.util.List;
import com.dogether.domain.OrderVO;

public interface OrderService {
	List<OrderVO> getOrderList();
	List<HashMap<String,Object>> getMyOrderList(String memberID);
	void updatebuyingConfirm(OrderVO vo);
	// 주문 list + 상품 이미지 출력(관리자페이지)
	List<HashMap<String,Object>> getOrderList(OrderVO sortTypeOrder);
}
