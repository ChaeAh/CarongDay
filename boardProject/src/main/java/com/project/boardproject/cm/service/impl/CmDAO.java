package com.project.boardproject.cm.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.boardproject.cm.service.BoardVO;
import com.project.boardproject.cm.service.CmVO;

/*
 * 파일명 : CmDAO.java
 * 용도    : 
 * 작성자 : mintchoco91
 * 변경일 : 2019/07/26
 */


@Mapper
public interface CmDAO  {

	/*//board 정리 시작
	public List<BoardVO> boardInq_001(BoardVO boardVO);

	public Integer boardDelete_001(BoardVO boardVO);	
	
	public BoardVO boardDetail_001(BoardVO boardVO);

	public Integer boardModify_001(BoardVO boardVO);
	
	public Integer boardInqCnt_001(BoardVO boardVO);
	
	public void boardWrite_001(BoardVO boardVO);
	//board 정리 끝
	public String tempsql_001();


	public List<BoardVO> kwboardInq_001(BoardVO boardVO);

	public Integer kwboardDelete_001(BoardVO boardVO);	
	
	public BoardVO kwboardDetail_001(BoardVO boardVO);

	public Integer kwboardModify_001(BoardVO boardVO);
	
	public Integer kwboardInqCnt_001(BoardVO boardVO);
	
	public void kwboardWrite_001(BoardVO boardVO);

	public int boardUpdateReadCnt_001(int idx);*/
	
	public void boardInsert_001(BoardVO boardVO);
	public List<BoardVO> boardGetList_001(BoardVO boardVO);

	public int boardgetBoardCnt_001(BoardVO boardVO);

	public void boardDelete_001(BoardVO boardVO);

	public int boardUpdateReadCnt_001(int idx);

	public BoardVO boardDetail_001(BoardVO vo);

	public BoardVO boardSchBoard_001(Map<String, String> schMap);

	public void boardUpdBoard_001(BoardVO boardVO);

	public int boardScrPwChkConfirm_001(BoardVO vo);
	
	
	public List<ArrayList> selCmCode_001(String string);
	public List<CmVO> selCmCode_002(String string);	
}
