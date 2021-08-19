package com.project.boardproject.cm.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

/*
 * 파일명 : CmService.java
 * 용도    : 
 * 작성자 : mintchoco91
 * 변경일 : 2019/09/14
 */



@Service
public interface CmService {
	
/*	//내용 : 게시판 조회
	public List<BoardVO> boardInq(BoardVO boardVO);

	//내용 : 게시판 글쓰기
	public void boardWrite(BoardVO boardVO);
	
	//내용 : 게시판 글삭제
	public String boardDelete(String[] idxArray);

	//내용 : 게시판 상세조회
	public BoardVO boardDetail(BoardVO boardVO);

	//내용 : 게시판 수정
	public Integer boardModify(BoardVO boardVO);

	//내용 : 게시판 총 글수 count
	public Integer boardInqCnt(BoardVO boardVO);*/
	
	
	public void boardInsert(BoardVO boardVO);

	public List<BoardVO> boardGetList(BoardVO boardVO);

	public int boardgetBoardCnt(BoardVO boardVO);

	public int boardDelete(BoardVO vo);

	public int boardUpdateReadCnt(int idx);

	public BoardVO boardDetail(BoardVO boardVO);

	public BoardVO boardSchboard(Map<String, String> schMap);

	public void boardUpdBoard(BoardVO boardVO);

	public int boardScrPwChkConfirm(BoardVO vo);

	public List<ArrayList> selCmCode(String string);

	public List<CmVO> selCmCode2(String string);



}
