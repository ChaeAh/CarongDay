package com.project.boardproject.um.service.impl;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.boardproject.um.service.UsrAcntVO;


@Mapper
public interface UmUsrDAO {
//	@Autowired
//	SqlSession session;
	
	public void insertMember(UsrAcntVO vo) ;
	
	public String CheckPw(String userId);
	
	public void ModifyMember(UsrAcntVO vo) ;
	
	public UsrAcntVO getMember(String userId);
	
	public void deleteMember(String userId);

	public void naverRgtUsr_001(UsrAcntVO vo);

	//public void usrAcntRgt_001(UsrAcntVO vo);

	public void insertLDVSRN_001(UsrAcntVO vo);

	public void insertUsrAcnt_001(UsrAcntVO usrAcntVO);
}
