package com.project.boardproject.cm.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/*
 * 파일명 : CmVO.java
 * 용도    : 
 * 작성자 : mintchoco91
 * 변경일 : 2019/07/26
 */

public class BoardVO implements Serializable{
	
	private static final long serialVersionUID = 1L; 
	
	private int idx;								//글번호
	private String boardId;					//게시판아이디
	private String title;						//타이틀
	private String contents;					//내용
	private String delYn;						//삭제여부
	private String atchYn;						//첨부파일여부
	private String readCnt;						//조회수
	
	private String rgtId;						//등록자ID
	private String rgtDtm;					//등록일시
	private String updId;						//수정자ID
	private String updDtm;					//수정일시
	
	private int startIndex;				//시작Idx
	private int pageSize;				//끝(한페이지에 들어갈 게시물 개수)
	
	private String name;						//이름?
	
	private String srchKeyword;			//[검색]검색어
	private String srchtrg;					//[검색]검색대상
	
	private String scrYn;						//비밀글여부
	private String scrPw;						//비밀글패스워드
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getAtchYn() {
		return atchYn;
	}
	public void setAtchYn(String atchYn) {
		this.atchYn = atchYn;
	}
	public String getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(String readCnt) {
		this.readCnt = readCnt;
	}
	public String getRgtId() {
		return rgtId;
	}
	public void setRgtId(String rgtId) {
		this.rgtId = rgtId;
	}
	public String getRgtDtm() {
		return rgtDtm;
	}
	public void setRgtDtm(String rgtDtm) {
		this.rgtDtm = rgtDtm;
	}
	public String getUpdId() {
		return updId;
	}
	public void setUpdId(String updId) {
		this.updId = updId;
	}
	public String getUpdDtm() {
		return updDtm;
	}
	public void setUpdDtm(String updDtm) {
		this.updDtm = updDtm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public String getSrchKeyword() {
		return srchKeyword;
	}
	public void setSrchKeyword(String srchKeyword) {
		this.srchKeyword = srchKeyword;
	}
	
	
	public String getSrchtrg() {
		return srchtrg;
	}
	public void setSrchtrg(String srchtrg) {
		this.srchtrg = srchtrg;
	}
	public String getScrYn() {
		return scrYn;
	}
	public void setScrYn(String scrYn) {
		this.scrYn = scrYn;
	}
	public String getScrPw() {
		return scrPw;
	}
	public void setScrPw(String scrPw) {
		this.scrPw = scrPw;
	}
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", boardId=" + boardId + ", title=" + title + ", contents=" + contents
				+ ", delYn=" + delYn + ", atchYn=" + atchYn + ", readCnt=" + readCnt + ", rgtId=" + rgtId + ", rgtDtm="
				+ rgtDtm + ", updId=" + updId + ", updDtm=" + updDtm + ", startIndex=" + startIndex + ", pageSize="
				+ pageSize + ", name=" + name + ", srchKeyword=" + srchKeyword + ", srchtrg=" + srchtrg + ", scrYn="
				+ scrYn + ", scrPw=" + scrPw + "]";
	}

	
	
	
	

	
	
	
}

