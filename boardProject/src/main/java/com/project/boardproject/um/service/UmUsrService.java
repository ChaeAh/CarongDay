package com.project.boardproject.um.service;

import org.springframework.stereotype.Service;

import com.project.boardproject.um.service.UsrAcntVO;

@Service
public interface UmUsrService {
	public int loginCheck(UsrAcntVO UsrAcntVO);
	
	public int memberRegister(UsrAcntVO UsrAcntVO);
	
	public int memberModify(UsrAcntVO UsrAcntVO);
	
	public UsrAcntVO getMember(String userId);
	
	public int memberDelete(String userId);

	public void naverRgtUsr(UsrAcntVO vo);

	public UsrAcntVO usrAcntRgt(UsrAcntVO usrAcntVO);

	public void insertUsrAcnt(UsrAcntVO usrAcntVO);
}
