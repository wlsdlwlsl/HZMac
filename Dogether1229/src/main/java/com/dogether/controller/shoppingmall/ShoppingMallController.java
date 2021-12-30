package com.dogether.controller.shoppingmall;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogether.domain.MemberVO;
import com.dogether.domain.ProductsVO;
import com.dogether.domain.Shopping_cartVO;
import com.dogether.service.ProductService;

@Controller
@RequestMapping("shoppingMall")
public class ShoppingMallController {

	@Autowired
	private ProductService productService;
	
	
	
	//쇼핑몰 메인홈에서 베스트상품4개 가져오기
	@RequestMapping("/")
	public String goShoppingMall(Model model) {
		System.out.println("쇼핑몰에 들어갑니다==========");
		List<ProductsVO> list = productService.bestProductsList();
		model.addAttribute("bestProduct",list);
		return "shoppingMall/shoppingmall";
	}
	
	
	
	
	//모든상품 갖고 시작하자잉
	@RequestMapping("totalproduct.do")
	public void totalProduct(ProductsVO vo, Model model,HttpSession session) {
		System.out.println("모든상품목록을 불러옵니다----------");
		List<ProductsVO> list = productService.getProductsList();
		model.addAttribute("productList",list);
	}
	
	//상품 상세페이지 들어가자잉
	@RequestMapping("detailProduct.do")
	public void detailProduct(ProductsVO vo,Model m) {
		System.out.println("상품 상세페이지로 이동합니다----------");
		ProductsVO pv = productService.detailProduct(vo);
		m.addAttribute("product",pv);
	}
	
	//장바구니 추가하기
	@PostMapping(value="shoppingCartInsert.do",produces="application/text; charset=UTF-8")
	@ResponseBody
	public String insertCart(Shopping_cartVO vo,HttpSession session,Model m) {
		System.out.println("상품이 장바구니에 있는지 먼저 검사합니다.===============");
		String sessionok = (String) session.getAttribute("username");
		if(sessionok == null){
			m.addAttribute("msg","로그인이 필요한 서비스입니다.");
			return "redirect";
		}
		vo.setMemberID(session.getAttribute("username").toString());//멤버아이디도 같이 보내야함으로 vo에 set을 하고 보냄
		Shopping_cartVO check = productService.productCheck(vo);
		if(check == null) {
			System.out.println("장바구니에 추가를 시작합니다.----------");
			productService.insertIntoCart(vo);
			return "장바구니에 담기완료!!";
		}
		else {
			return "이미 장바구니에 있는 상품입니다.";
		}
	}

	
	//장바구니 삭제하기
	@PostMapping(value="deletefromjanbaguni.do",produces="application/text; charset=UTF-8")
	@ResponseBody
	public String deleteCart(Shopping_cartVO vo,HttpSession session) {
		System.out.println("장바구니에서 삭제를 시작합니다.----------");
		vo.setMemberID(session.getAttribute("username").toString());//멤버아이디도 같이 보내야함으로 vo에 set을 하고 보냄
		int a = productService.deleteFromCart(vo);
		return "삭제완료!!";
	}
	
	
	//장바구니에서 수량 변경하기
	@RequestMapping("updateQuantity.do")
	public String updateQuantity(String productID[], int productQuantity[] ,HttpSession session) {
		System.out.println("장바구니에서 수량변경을 시작합니다.----------");
		String memberID = session.getAttribute("username").toString();
		
		int a = productService.updateFromCart(productID,productQuantity,memberID);
		System.out.println(a+"개 품목 수정완료");

		return "redirect:shoppingCart.do";
	}
	
	//장바구니 목록 가져오기
	@RequestMapping("shoppingCart.do")
	public String getShoppingCartList(MemberVO vo,HttpSession session,Model m) {
		System.out.println("장바구니 목록을 불러옵니다.");
		String sessionok = (String) session.getAttribute("username");
		if(sessionok == null){
			m.addAttribute("msg","로그인이 필요한 서비스입니다.");
			return "redirect";
		}
		vo.setMemberID(session.getAttribute("username").toString());
		List<HashMap<String,String>> list = productService.getShoppingCartList(vo);
		MemberVO memberInfo = productService.showUserInfo(vo);
		m.addAttribute("memberInfo",memberInfo);
		m.addAttribute("jangbaguni",list);
		return "shoppingMall/shoppingCart";
	}
	
	
	
	
	
	
	@PostMapping("insertOrderList.do")
	@ResponseBody
	public int insertOrderList(String memberid,String OrderID,HttpSession session) {
		System.out.println("결제한 목록을 추가합니다");
		memberid = session.getAttribute("username").toString();//vo에 멤버 아이디 추가하기
		List<Shopping_cartVO> vo = productService.afterGetShoppingCartList(memberid);//vo에 일단 각각 멤버아이디의 장바구니 리스트를 가져옴
		int result = productService.insertOrderList(vo,OrderID);//가져온 vo형태로 order테이블에 insert하자
		return result;
		
	}
	
	
	
	
}
