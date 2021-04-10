package com.project.boardproject.um.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.boardproject.um.service.impl.UmUsrDAO;
import com.project.boardproject.um.service.UmUsrService;
import com.project.boardproject.um.service.UsrAcntVO;

@Service
public class UmUsrServiceImpl implements UmUsrService{
	
	@Autowired
	private UmUsrDAO umUsrDAO;
	
	@Override
	public int loginCheck(UsrAcntVO UsrAcntVO) {
		int result=1;//0: 성공, 1: 비밀번호 불일치, 2: 아이디 불일치
		String pw=umUsrDAO.CheckPw(UsrAcntVO.getUsrId());
		if(pw==null) result=2;//id가 존재하지 않음
		else if(pw.equals(UsrAcntVO.getUsrPw())) {
			result=0;
		}
		
		return result;
	}
	
	@Override
	public int memberRegister(UsrAcntVO UsrAcntVO) {
		int result=1;//1:실패, 0:성공
		if(umUsrDAO.CheckPw(UsrAcntVO.getUsrId())==null) {
			umUsrDAO.insertMember(UsrAcntVO);
			result=0;
		}
		return result;
	}
	
	@Override
	public int memberModify(UsrAcntVO UsrAcntVO) {
		int result =1;//0:성공, 1: 비밀번호 불일치
		String pw=umUsrDAO.CheckPw(UsrAcntVO.getUsrId());
		if(pw.equals(UsrAcntVO.getUsrPw())) {
			umUsrDAO.ModifyMember(UsrAcntVO);
			result=0;
		}
		return result;
	}
	
	@Override
	public UsrAcntVO getMember(String userId) {
		UsrAcntVO UsrAcntVO= umUsrDAO.getMember(userId);
		return UsrAcntVO;
	}
	
	@Override
	public int memberDelete(String userId) {
		int result=0;
		umUsrDAO.deleteMember(userId);
		return result;
	}

	@Override
	public void naverRgtUsr(UsrAcntVO vo) {
		umUsrDAO.naverRgtUsr_001(vo);
	}

	/*
	 * 계정 등록 및 IRLDVSRN 등록
	 * */
	@Override
	public UsrAcntVO usrAcntRgt(UsrAcntVO vo) {

		umUsrDAO.insertLDVSRN_001(vo);
		return vo;
	}

	@Override
	public void insertUsrAcnt(UsrAcntVO usrAcntVO) {
		umUsrDAO.insertUsrAcnt_001(usrAcntVO);
	}
}
