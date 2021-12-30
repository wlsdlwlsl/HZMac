package com.dogether.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogether.dao.BoardDAOImpl;
import com.dogether.domain.BoardVO;
import com.dogether.domain.Board_LikeVO;
import com.dogether.domain.Board_ReplyVO;

@Repository("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAOImpl boardDAO; 
	
	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}

	@Override
	public List<Board_ReplyVO> getReplyList(){
		return boardDAO.getReplyList();
	}

	@Override
	public List<Board_LikeVO> getLikeList(Board_LikeVO vo) {
		return boardDAO.getLikeList(vo);
	}

	@Override
	public int deleteLike(Board_LikeVO vo) {
		return boardDAO.deleteLike(vo);
	}

	@Override
	public int insertLike(Board_LikeVO vo) {
		return boardDAO.insertLike(vo);
	}
	@Override
	public int insertBoard(BoardVO vo) {
		return boardDAO.insertBoard(vo);
	}
	@Override
	public int insertReply(Board_ReplyVO vo) {
		return boardDAO.insertReply(vo);
	}
	// 자랑하기 삭제(관리자페이지)
	@Override
	public void deleteBST(BoardVO vo) {
		System.out.println("Service에서 자랑하기 삭제 호출함");
		boardDAO.deleteBST(vo);		
	}
}
