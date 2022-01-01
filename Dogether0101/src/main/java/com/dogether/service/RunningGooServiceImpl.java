package com.dogether.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogether.dao.RunningGooDAO;
import com.dogether.domain.MemberVO;
import com.dogether.domain.RunningGooVO;

@Service
public class RunningGooServiceImpl implements RunningGooService {
	
	@Autowired
	RunningGooDAO runningGooDAO;

	// 런닝구 방 생성
		@Override
		public void insertRNRoomInfo(RunningGooVO vo) {
			runningGooDAO.createRngRoom(vo);
		}

		@Override
		public List<RunningGooVO> getRNRoomList(RunningGooVO vo) {
			return runningGooDAO.getRNRoomList(vo);
		}

		@Override
		public int getRNRoomCount(RunningGooVO vo) {
			// 런닝구 방 갯수 얻어오기
			return runningGooDAO.getRunningGooRoomCount(vo);
		}
		
		@Override
		public int getMemberJoinRunningGoo(String nowMemberID){
		    return runningGooDAO.getRngMemberPoints(nowMemberID);
		}
		
		@Override
		public RunningGooVO bringBasicRngRoomInfo(RunningGooVO vo) {
			return runningGooDAO.bringBasicRngRoomInfo(vo);
		}
		
		@Override
		public void CreateRunningGooMemberInsert(RunningGooVO vo) {
			// 참여자가 DoJoin을 눌렀을때 들어가는 멤버정보
			runningGooDAO.CreateRunningGooMemberInsert(vo);
		}
		
		@Override
		public List<HashMap<String,Object>> viewJoinMemberInfo(int roomNum) {
			// 호스트에게 보여질 수락이 완료된 멤버들의 정보
			return runningGooDAO.viewJoinMemberList(roomNum);
		}

		@Override
		public List<HashMap<String,Object>> viewNotYetJoinMemberList(int roomNum) {
			// 호스트에게 보여질 수락을 기다리는 참여자들의 간단한 정보
			return runningGooDAO.viewNotYetJoinMemberList(roomNum);
		}
		
		@Override
		public void upateRngMemberInfo(HashMap<String,Object> map) {
			// 호스트가 수락을 눌렀을때 수정될 런닝구 멤버의 정보
			runningGooDAO.upateRngMemberInfo(map);
		}
		
		@Override
		public void updateRnGCrntMemberCount(int roomNum) {
			//호스트가 수락을 눌렀을때 런닝구 방 현재 멤버 + 1
			runningGooDAO.updateRnGCrntMemberCount(roomNum);
		}
		
		
		@Override
		public void deleteRngRoom(HashMap<String, Object> map) {
			// 런닝구 방 삯제
			runningGooDAO.deleteRngRoom(map);
			
		}

		@Override
		public RunningGooVO userJoinCheck(RunningGooVO vo) {
			return runningGooDAO.userJoinCheck(vo);
		}

		@Override
		public void deleteJoinMemberInfo(HashMap<String, Object> map) {
			// 호스트가 거절을 눌렀을때
			runningGooDAO.deleteJoinMemberInfo(map);
		}
	
	// 런닝구 리스트 가져오기(프로필사진 포함 in 관리자페이지) 
	@Override
	public List<HashMap<String,Object>> getRNGListWithProfile(RunningGooVO sortTypeRNG) {
		return runningGooDAO.getRNGListWithProfile(sortTypeRNG);
	}
	
	// 런닝구 방 삭제(관리자페이지)
	@Override
	public void deleteRNG(RunningGooVO vo) {
		System.out.println("Service에서 런닝구방 삭제 호출함");
		runningGooDAO.deleteRNG(vo);		
	}
	// 런닝구 총 매칭 건수(관리자페이지)
	@Override
	public int getMatchedCount() {
		System.out.println("Service에서 런닝구 총 매칭 건수 호출함");
		return runningGooDAO.getMatchedCount();
	}
}
