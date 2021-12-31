package com.dogether.controller.runninggoo;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogether.domain.MemberVO;
import com.dogether.domain.RunningGooVO;
import com.dogether.service.RunningGooService;

@Controller
@RequestMapping("runninggoo")
public class RunningGooController {
	@Autowired
	RunningGooService runningGooService;
	
	// 방만들기 페이지로 이동
	@RequestMapping("createRngRoom.do")
	public String CreateRngPage() {
		return "runninggoo/createRngRoom";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*이부분 선생님께 질문할부분-------------------------
	 * 컨트롤러에 들어가지도 못함 400에러뜸 */
	// 런닝구 방 생성 및 정보 입력하기
	@PostMapping(value="rngInsert.do")
	public String CreateRngRoom(RunningGooVO vo, HttpSession session) {
		// Dogether 본 서버에서는 session.setAttribute를 해줄 필요가 없음.
		System.out.println("으아아아아아아ㅏ아ㅏ아아아ㅓ만어리만어리만어리ㅏㅁㄴ얾나ㅣㅇ러민아러민아럼니아러민아럼ㄴ아럼낭러미낭러민아러민아러미나어라너이ㅏ런이ㅏ럼니아러미나얼미낭러미낭러미낭러민아러민아럼니아럼ㄴ이라");
		System.out.println((String) session.getAttribute("username"));
		vo.setMemberID(session.getAttribute("username").toString());
		runningGooService.insertRNRoomInfo(vo);
		System.out.println(vo.getRoomNumber());
		return "redirect:../runninggoo/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		// 런닝구 방 리스트 얻어오기
		@RequestMapping("/")
		public String runningGooList(RunningGooVO vo, Model m, HttpSession session) {
			String isSession = (String) session.getAttribute("username");
			if(isSession == null){
				m.addAttribute("msg","로그인이 필요한 서비스입니다.");
				return "redirect";
			}
			List<RunningGooVO> result = runningGooService.getRNRoomList(vo);
			int listCount = runningGooService.getRNRoomCount(vo);
			System.out.println(listCount);
			m.addAttribute("RunningGooList", result);
			m.addAttribute("rnRoomCNT", listCount);
			
			System.out.println("Model 객체를 통해 전달완료!");
			return "runninggoo/runningGooList";
		}
		
		// 런닝구 방 생성시 보유 포인트 조회하기
		@RequestMapping("viewMemberPoints.do")
		@ResponseBody
		public Integer viewMembersPoints(MemberVO vo, HttpSession session) {
			System.out.println("보유포인트 컨트롤러 테스트!");
			String nowMemberID = session.getAttribute("username").toString();
			System.out.println(nowMemberID);
			int rngMemberPoints = runningGooService.getMemberJoinRunningGoo(nowMemberID);
			System.out.println(rngMemberPoints);
			return rngMemberPoints;
		}
		
		// DoJoin 버튼 클릭 시 호스트에게 보여질 참여자의 정보 INSERT --> 참여자
		@RequestMapping(value="bringBasicRngRoomInfo.do", produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String showJoinMember(RunningGooVO vo, HttpSession session) {
			// 일단 방참여 정보는 똑같으니 vo를 불러와 각각의 vo에 담기	
			// Dogether 본 서버에서는 session.setAttribute를 해줄 필요가 없음.
			RunningGooVO svo = runningGooService.bringBasicRngRoomInfo(vo);
			svo.setMemberID(session.getAttribute("username").toString());
			svo.setMemberPendingStatusYN("Y");
			svo.setHostYN("N");
			RunningGooVO checkvo = runningGooService.userJoinCheck(svo);
			if(checkvo != null) {
				return "이미 참가신청이 되어있습니다!";
			}
			else {
				runningGooService.CreateRunningGooMemberInsert(svo);
				return "호스트에게 참여신청을 보냈습니다!";
			}
		}
		
		// 호스트에게 보여질 수락된 참여자들의 간단한 정보 --> 호스트
		@RequestMapping("viewJoinMemberTotalInfo.do")
		public void viewJoinMemberInfo(RunningGooVO rVO,Model m, @RequestParam String roomNumber) {
			// Dogether 본 서버에서는 session.setAttribute를 해줄 필요가 없음.
			// 수락이 완료된 참여자들의 간단한 정보
			int roomNum = Integer.parseInt(roomNumber);
			List<HashMap<String,Object>> result1 = runningGooService.viewJoinMemberInfo(roomNum);
			m.addAttribute("joinCompleteMemberList", result1);
			
			
			// 호스트에게 보여질 수락을 기다리는 참여자들의 간단한 정보
			//int roomNum1 = rVO.getRoomNumber();
			List<HashMap<String,Object>> result2 = runningGooService.viewNotYetJoinMemberList(roomNum);
			System.out.println(result2.toString());
			m.addAttribute("joinNotYetCompleteMemberList", result2);
		}
		
		// 호스트가 수락을 눌렀을때 수정되는 참여자의 정보 --> 참여자
		@RequestMapping("updateJoinMemberInfo.do")
		@ResponseBody
		public String updateJoinMember(int roomNum, String joinPendingMember, HttpSession session) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			String memberID = joinPendingMember;
			map.put("memberid", memberID);
			map.put("roomnumber",roomNum);
			runningGooService.upateRngMemberInfo(map);
			return "Confirm!";
		}
		
		// 호스트의 런닝구 방 삭제
		@RequestMapping("deleteRngRoom.do")
		@ResponseBody
		public String deleteRngRoom(String hostMemberID, int roomNum, HttpSession session) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberid", hostMemberID);
			map.put("roomnumber",roomNum);
			runningGooService.deleteRngRoom(map);
			return "Confirm!";
		}
		
	
}
