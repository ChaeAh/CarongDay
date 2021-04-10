package com.project.boardproject.cm.service;

import java.io.Serializable;

public class AttachVO implements Serializable {

	//첨부파일번호, 글번호, 첨부파일명
	private static final long serialVersionUID = 1L;
	private int idx;
	private int boardIdx;
	private String attachName;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getAttachName() {
		return attachName;
	}
	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}
	@Override
	public String toString() {
		return "attachVO [idx=" + idx + ", boardIdx=" + boardIdx + ", attachName=" + attachName + "]";
	}
	
	
	
	
}
