package com.dogether.dao;

import java.util.HashMap;
import java.util.List;
import com.dogether.domain.OrderVO;

public interface OrderDAO {
	public List<OrderVO> getOrderList();
	public List<HashMap<String,Object>> getMyOrderList(String memberID);
	public void updatebuyingConfirm(OrderVO vo);
	// 주문 list + 상품 이미지 출력(관리자페이지)
	public List<HashMap<String,Object>> getOrderList(OrderVO sortTypeOrder);

}
