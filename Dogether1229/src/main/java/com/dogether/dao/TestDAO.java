package com.dogether.dao;

import com.dogether.domain.BoardVO;
import com.dogether.domain.MemberVO;

public interface TestDAO {
	public BoardVO getBoardList();
	public MemberVO idCheck_Login(MemberVO vo);
	public MemberVO nickName_Check(MemberVO vo);
	public int memberinsert(MemberVO vo);
	public MemberVO memberLogin(MemberVO vo);
}
