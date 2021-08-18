package com.project.boardproject.cm.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.boardproject.cm.service.BoardVO;
import com.project.boardproject.cm.service.CmService;
import com.project.boardproject.cm.service.CmVO;

/*
 * 파일명 : CmServiceimpl.java
 * 용도    : 
 * 작성자 : mintchoco91
 * 변경일 : 2019/09/14
 */

@Service
public class CmServiceimpl implements CmService {
	
	@Autowired
	private CmDAO cmDAO;	

/*	//내용 : 게시판 조회
	@Override
	public List<BoardVO> boardInq(BoardVO boardVO) {
		return cmDAO.boardInq_001(boardVO);
	}

	//내용 : 게시판 글쓰기
	@Override
	public void boardWrite(BoardVO boardVO) {
		cmDAO.boardWrite_001(boardVO);
	}

	//내용 : 게시판 총 글수 count
	@Override
	public Integer boardInqCnt(BoardVO boardVO) {
		return cmDAO.boardInqCnt_001(boardVO);
	}

	//내용 : 게시판 글 삭제
	@Override
	public String boardDelete(String[] idxArray) {
		Integer resultval = 0;
		String result = "error";
		
		BoardVO boardVO = new BoardVO();
		for(int i=0; i<idxArray.length ; i++) {
			boardVO.setIdx(Integer.parseInt(idxArray[i]));
			resultval = resultval + cmDAO.boardDelete_001(boardVO);
		}
		
		if(resultval == idxArray.length) {
			result = "success";
		}
		return result;
	}
	
	//내용 : 게시판 글 상세조회
	@Override
	public BoardVO boardDetail(BoardVO boardVO) {
		cmDAO.boardUpdateReadCnt_001(boardVO.getIdx());
		return cmDAO.boardDetail_001(boardVO);
	}
*/
	/*//내용 : 게시판 글 수정
	@Override
	public Integer boardModify(BoardVO boardVO) {
		Integer resultval = 0;
		resultval = cmDAO.boardModify_001(boardVO);
		return resultval;
	}
	*/
	@Override
	public void boardInsert(BoardVO boardVO) {
		System.out.println(boardVO.toString());
		int idx = cmDAO.selectBoardIdx_001(boardVO);
		boardVO.setIdx(idx);
		cmDAO.boardInsert_001(boardVO);
			
	}
	
	public List<BoardVO> boardGetList(BoardVO boardVO) {
		return cmDAO.boardGetList_001(boardVO);
	}
	
	@Override
	public int boardgetBoardCnt(BoardVO boardVO) {
		return cmDAO.boardgetBoardCnt_001(boardVO);
	}

	@Override
	public void boardDelete(BoardVO vo) {
		 cmDAO.boardDelete_001(vo);
	}

	@Override
	public int boardUpdateReadCnt(int idx) {
		return cmDAO.boardUpdateReadCnt_001(idx);
	}

	@Override
	public BoardVO boardDetail(BoardVO boardVO) {
		return cmDAO.boardDetail_001(boardVO);
	}

	@Override
	public BoardVO boardSchboard(Map<String, String> schMap) {
		return cmDAO.boardSchBoard_001(schMap);
	}

	@Override
	public void boardUpdBoard(BoardVO boardVO) {
		cmDAO.boardUpdBoard_001(boardVO);
		
	}

	@Override
	public int boardScrPwChkConfirm(BoardVO vo) {
		int result;
		result =cmDAO.boardScrPwChkConfirm_001(vo);
		return result;
	}

	@Override
	public List<ArrayList> selCmCode(String string) {
		return (List<ArrayList>) cmDAO.selCmCode_001(string);
	}

	@Override
	public List<CmVO> selCmCode2(String string) {
		return (List<CmVO>)cmDAO.selCmCode_002(string);
	}
}
