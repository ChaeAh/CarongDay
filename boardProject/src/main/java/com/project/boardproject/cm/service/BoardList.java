package com.project.boardproject.cm.service;

import java.util.ArrayList;
import java.util.List;

public class BoardList {
	private List<BoardVO> boardList = new ArrayList<BoardVO>();
	private int pageSize;				//한페이지에 표시할 글의 개수
	private int totalCount;			//테이블에 저장된 전체 글의 개수
	private int totalPage; 				//전체 페이지의 한 한페이지 개수 
	private int currentPage;			//현재 화면에 표시할 페이지 번호
	private int startNo; 				// 현재 화면에 표시되는 글의 시작 일련번호
	private int startPage;				// 페이지 이동 버튼의 시작 페이지 번호
	private int endPage;				//페이지 이동 버튼의 마지막 페이지 번호
	
	public BoardList() {}
	
	public void initBoardList(int pageSize, int totalCount, int currentPage){
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
		
	}
	private void calculator(){
		totalPage = (totalCount - 1)/pageSize +1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage-1) * pageSize ;
		startPage = (currentPage-1)/10*10+1;
		endPage = startPage+9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}

	public List<BoardVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<BoardVO> boardList) {
		this.boardList = boardList;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}


	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "BoardList [boardList=" + boardList + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + 
				", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
