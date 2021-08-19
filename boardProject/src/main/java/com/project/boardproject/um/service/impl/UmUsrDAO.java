package com.project.boardproject.um.service.impl;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.boardproject.um.service.UsrAcntVO;


@Mapper
public interface UmUsrDAO {
//	@Autowired
//	SqlSession session;
	
	public void insertMember(UsrAcntVO vo) ;
	
	public UsrAcntVO selectUsrConfirmPw_001(String userId);
	
	public void ModifyMember(UsrAcntVO vo) ;
	
	public UsrAcntVO getMember(String userId);
	
	public void deleteMember(String userId);

	public void naverRgtUsr_001(UsrAcntVO vo);

	//public void usrAcntRgt_001(UsrAcntVO vo);

	public void insertLDVSRN_001(UsrAcntVO vo);

	public int insertUsrAcnt_001(UsrAcntVO usrAcntVO);

	public void insertUsrLDVSRN_001(UsrAcntVO usrAcntVO);

	public int selectUsrChkId_001(UsrAcntVO usrAcntVO);

	public void insertUsrEmailSuc_001(UsrAcntVO usrAcntVO);
	
	public Map<String, Object> umSelEmailFinAuth_001( @Param("usrId") String usrId);

	public void umUpdUsrEmailFinAuth_001(String usrId);

	public UsrAcntVO selectUsrInfo_001(UsrAcntVO usrAcntVO);

	public void umUpdUsrLoginDtm_001(UsrAcntVO usrAcntVO);

	public void umUpdUsrPwSalt_001(UsrAcntVO usrAcntVO);

	public UsrAcntVO umSelUsrInfo_001(UsrAcntVO usrAcntVO);

	public UsrAcntVO umSelUsrInfo_002(String usrId);
}
