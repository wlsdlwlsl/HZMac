package com.dogether.service;

import java.util.HashMap;
import java.util.List;

import com.dogether.domain.MemberVO;
import com.dogether.domain.RunningGooVO;

public interface RunningGooService {
	
	// 런닝구 방 생성
	void insertRNRoomInfo(RunningGooVO vo);
	
	// 런닝구 리스트 가져오기
	List<RunningGooVO> getRNRoomList(RunningGooVO vo);
	
	// 런닝구 방 갯수 얻어오기
	int getRNRoomCount(RunningGooVO vo);
	
	// 멤버 포인트 조회
	int getMemberJoinRunningGoo(String nowMemberID);
	
	// doJoin눌렀을때 불러오는 기본 런닝구 방 정보
	RunningGooVO bringBasicRngRoomInfo(RunningGooVO vo);
	
	// 참여자가 DoJoin을 눌렀을때 들어가는 멤버정보
	void CreateRunningGooMemberInsert(RunningGooVO vo);
	
	// 호스트에게 보여질 수락이 완료된 멤버들의 정보
	List<HashMap<String,Object>> viewJoinMemberInfo(int roomNum);
		
	// 호스트에게 보여질 수락을 기다리는 참여자들의 간단한 정보
	List<HashMap<String,Object>> viewNotYetJoinMemberList(int roomNum);
	
	// 호스트가 수락을 눌렀을때 수정될 런닝구 멤버의 정보
	void upateRngMemberInfo(HashMap<String,Object> map);
	
	// 런닝구 리스트 가져오기(프로필사진 포함 in 관리자페이지)
	List<HashMap<String,Object>> getRNGListWithProfile(RunningGooVO sortTypeRNG);
	
	// 런닝구 방 삭제(관리자페이지)
	public void deleteRNG(RunningGooVO vo);
	
	// 런닝구 총 매칭 건수(관리자페이지)
	public int getMatchedCount();
	
	// 런닝구 방 삯제
	void deleteRngRoom(HashMap<String,Object> map);
	
	// 런닝구 DOjoin 할때 이미 조인되어있으면 안되게끔 체크
	RunningGooVO userJoinCheck(RunningGooVO vo);
}
