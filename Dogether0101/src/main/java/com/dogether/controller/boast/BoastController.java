package com.dogether.controller.boast;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogether.domain.BoardVO;
import com.dogether.domain.Board_LikeVO;
import com.dogether.domain.Board_ReplyVO;
import com.dogether.service.BoardServiceImpl;

@Controller
@RequestMapping("boast")
public class BoastController {

	@Autowired
	private BoardServiceImpl boardService;
	
	@RequestMapping("{step}.do")
	public String stepDo(@PathVariable String step, Model m, HttpSession session) {
		String sessionok = (String) session.getAttribute("username");
		if(sessionok == null) {
			m.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			return "redirect";
		}
		return "boast/"+ step;
	}
	
	@RequestMapping("/")
	public String getboardList(@RequestParam(value = "sortType", required = false) String sortTypeBST,
			@RequestParam(value = "memberID", required = false) String memberID, 
			Model m, HttpSession session, BoardVO bVO) {
		System.out.println("나오나?");
		String sessionok = (String) session.getAttribute("username");
		if (sessionok == null) {
			m.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			return "redirect";
		}
		
		Board_LikeVO vo = new Board_LikeVO();// 좋아요를 위한 vo
		vo.setLiker(session.getAttribute("username").toString().trim());
		if (sortTypeBST != null) {
			bVO.setSortTypeBST(Integer.parseInt(sortTypeBST));
		}
		System.out.println(bVO.getSortTypeBST());
		
		if(memberID!=null) {
			bVO.setMemberID(memberID);
			m.addAttribute("memberID",memberID);
		}
		
		List<BoardVO> list = boardService.getBoardList(bVO);
		List<Board_ReplyVO> reply_list = boardService.getReplyList();
		List<Board_LikeVO> like_list = boardService.getLikeList(vo);

		m.addAttribute("reply_list", reply_list);
		m.addAttribute("list", list);
		m.addAttribute("like_list", like_list);

		return "boast/boast";
	}

	@GetMapping(value = "updateLike.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String updateBoardLike(Board_LikeVO vo) {
		int result = 0;
		// 이미 좋아요에서 좋아요를 취소할시..
		if (vo.getLikeY().equals("Y")) {
			System.out.println(vo.getBoard_like_no());
			System.out.println();
			result = boardService.deleteLike(vo);

			// 좋아요를 안한상태에서 좋아요를 눌렀을 때,
		} else if (vo.getLikeY().equals("N")) {
			System.out.println(vo.getBoard_like_no());
			System.out.println();
			result = boardService.insertLike(vo);
		}

		return Integer.toString(result);
	}

	@RequestMapping("insertBoard.do")
	public String insertBoard(BoardVO vo, HttpSession session) {
		vo.setMemberID(session.getAttribute("username").toString().trim());
		System.out.println(vo.getBoard_fsize());
		System.out.println(vo.getBoard_fname());
		System.out.println(vo.getBoard_realfname());
		int result = boardService.insertBoard(vo);
		return "redirect:/boast/";
	}

	@PostMapping(value = "reply.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public void insert(Board_ReplyVO vo, HttpSession session) {
		System.out.println(vo.getBoardID());
		System.out.println(vo.getReply());
		vo.setReplyer(session.getAttribute("username").toString().trim());

		boardService.insertReply(vo);
	}
/*
	@RequestMapping("getBoardList2.do")
	@ResponseBody
	public List<BoardVO> getBoardList2(BoardVO bVO) {
		List<BoardVO> list = boardService.getBoardList(bVO);
		return list;
	}
*/
}
