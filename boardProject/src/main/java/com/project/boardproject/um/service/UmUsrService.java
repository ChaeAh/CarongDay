package com.project.boardproject.um.service;

import org.springframework.stereotype.Service;

import com.project.boardproject.um.service.UsrAcntVO;

@Service
public interface UmUsrService {
	public int loginProcess(UsrAcntVO UsrAcntVO);
	
	public int memberRegister(UsrAcntVO UsrAcntVO);
	
	public int memberModify(UsrAcntVO UsrAcntVO);
	
	public UsrAcntVO getMember(String userId);
	
	public int memberDelete(String userId);

	public void naverRgtUsr(UsrAcntVO vo);


	public int insertUsrAcnt(UsrAcntVO usrAcntVO);

	public int umUsrChkId(UsrAcntVO usrAcntVO);

	public void insertUsrEmailSuc(UsrAcntVO usrAcntVO);

	public int umUsrEmailFinAuth(String emailAuthNum, String usrId);

	public void umUpdUsrLoginDtm(UsrAcntVO usrAcntVO);

	public void umUpdUsrPwSalt(UsrAcntVO usrAcntVO);

	public UsrAcntVO umSelUsrInfo(UsrAcntVO usrAcntVO);

	public UsrAcntVO umSelUsrInfoString(String usrId);
}
