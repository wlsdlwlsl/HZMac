package com.dogether.service;

import com.dogether.domain.BoardVO;
import com.dogether.domain.MemberVO;

public interface TestService {
	public BoardVO test();
	public MemberVO idCheck_Login(MemberVO vo);
	public MemberVO nickName_Check(MemberVO vo);
	public int memberinsert(MemberVO vo);
	public MemberVO login(MemberVO vo);
}
