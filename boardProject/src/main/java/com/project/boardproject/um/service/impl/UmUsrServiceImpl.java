package com.project.boardproject.um.service.impl;

import java.util.Map;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.boardproject.um.service.impl.UmUsrDAO;
import com.project.boardproject.common.SHA256Util;
import com.project.boardproject.um.service.UmUsrService;
import com.project.boardproject.um.service.UsrAcntVO;

@Service
public class UmUsrServiceImpl implements UmUsrService{
	
	@Autowired
	private UmUsrDAO umUsrDAO;
	
	@Override
	public int loginProcess(UsrAcntVO usrAcntVO) {
		int result;

		int idChk = umUsrDAO.selectUsrChkId_001(usrAcntVO);
		if(idChk != 1) {	//아이디 체크 통과
			UsrAcntVO vo = new UsrAcntVO();
			vo=umUsrDAO.selectUsrConfirmPw_001(usrAcntVO.getUsrId());

			String salt = vo.getSalt();	// DB에서 가져온 SALT값
			String comparePw = SHA256Util.getEncrypt(usrAcntVO.getUsrPw(), salt);
			
			if(comparePw.equals(vo.getUsrPw())) {	//비밀번호 체크 통과
				
				UsrAcntVO targetVO = new UsrAcntVO();
				targetVO = umUsrDAO.selectUsrInfo_001(usrAcntVO);
				
				if("Y".equals(targetVO.getUseYn())) {
					if("Y".equals(targetVO.getEmailAuthYn())) {
						
						String usrPwRgtDtm = targetVO.getPwRgtDtm().substring(0, 8);
						String compareTime = DateTimeFormat.forPattern("yyyyMMdd").print(DateTime.now());
						
						//비밀번호 만료일 계산
						DateTime dateTime = DateTimeFormat.forPattern("yyyyMMdd").parseDateTime(usrPwRgtDtm).plusMonths(3);
						DateTimeFormatter dtfOut = DateTimeFormat.forPattern("yyyyMMdd");
						
						if(dtfOut.print(dateTime).compareTo(compareTime) >0) {
							if(!"Y".equals(targetVO.getPwInitYn())) {
								result = 0;	// 로그인 성공
							}else {
								result = 6;	// 비밀번호 초기화를 진행했을경우
							}
						}else {
							result = 5; //비밀번호가 3개월이상 만료됐을경우
						}
					}else {
						result = 4; // 이메일 인증이 N인 사용자
					}
				}else {
					result = 3; // 사용여부가 N인 사용자
				}
			}else {
				result =1;	//아이디는 있으나 비밀번호 불일치
			}
		}else {
			result = 2;	//아이디 정보가 없음
		}
		
		return result;
	}
	
	@Override
	public int memberRegister(UsrAcntVO UsrAcntVO) {
		int result=1;//1:실패, 0:성공
		if(umUsrDAO.selectUsrConfirmPw_001(UsrAcntVO.getUsrId())==null) {
			umUsrDAO.insertMember(UsrAcntVO);
			result=0;
		}
		return result;
	}
	
	@Override
	public int memberModify(UsrAcntVO UsrAcntVO) {
		int result =1;//0:성공, 1: 비밀번호 불일치
	//	String pw=umUsrDAO.selectUsrConfirmPw_001(UsrAcntVO.getUsrId());
	
		
		
	//	if(pw.equals(UsrAcntVO.getUsrPw())) {
			umUsrDAO.ModifyMember(UsrAcntVO);
			result=0;
	//	}
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
	/*	@Override
	public UsrAcntVO usrAcntRgt(UsrAcntVO vo) {

		umUsrDAO.insertLDVSRN_001(vo);
		return vo;
	}
*/
/*	@Override
	public int usrAcntRgt(UsrAcntVO usrAcntVO) {
	
	}
*/
	@Override
	public int  insertUsrAcnt(UsrAcntVO usrAcntVO) {
		
		String salt =SHA256Util.getSalt();
		// Encrypt PW
		
		usrAcntVO.setSalt(salt);	//salt 세팅
		
		String usrPw = usrAcntVO.getUsrPw();
		usrPw = SHA256Util.getEncrypt(usrPw, salt);
		
		usrAcntVO.setUsrPw(usrPw);
		
		
		int result = 0;
		result =	umUsrDAO.insertUsrAcnt_001(usrAcntVO);
		
		if(result>0) {
		 umUsrDAO.insertUsrLDVSRN_001(usrAcntVO);
		}
		return result;
	}

	@Override
	public int umUsrChkId(UsrAcntVO usrAcntVO) {
		int cnt;
		cnt = umUsrDAO.selectUsrChkId_001(usrAcntVO);
		return cnt;
	}

	@Override
	public void insertUsrEmailSuc(UsrAcntVO usrAcntVO) {
		umUsrDAO.insertUsrEmailSuc_001(usrAcntVO);
		
	}

	@Override
	public int umUsrEmailFinAuth(String emailAuthNum, String usrId) {
		int result;//1:실패, 0:성공
		Map<String, Object> hashMap;
		hashMap =umUsrDAO.umSelEmailFinAuth_001(usrId);
		System.out.println(hashMap.get("EMAILAUTHNUM") + "이메일인증번호");
		System.out.println(hashMap.get("USRID") + "사용자 아이디");
		System.out.println(hashMap);
		System.out.println("사용자가 입력한 인증번호" + emailAuthNum);
		if(!(hashMap.get("EMAILAUTHNUM").equals(emailAuthNum)) && hashMap.get("USRID").equals(usrId)) {
			result = 1;
		}else {
			result = 0;
			umUsrDAO.umUpdUsrEmailFinAuth_001(usrId);
		}

		return result;
	}

	@Override
	public void umUpdUsrLoginDtm(UsrAcntVO usrAcntVO) {
		umUsrDAO.umUpdUsrLoginDtm_001(usrAcntVO);
	}

	@Override
	public void umUpdUsrPwSalt(UsrAcntVO usrAcntVO) {
		String salt =SHA256Util.getSalt();
		// Encrypt PW
		
		usrAcntVO.setSalt(salt);	//salt 세팅
		
		String usrPw = usrAcntVO.getUsrPw();
		usrPw = SHA256Util.getEncrypt(usrPw, salt);
		
		usrAcntVO.setUsrPw(usrPw);
		
		umUsrDAO.umUpdUsrPwSalt_001(usrAcntVO);
	}

	@Override
	public UsrAcntVO umSelUsrInfo(UsrAcntVO usrAcntVO) {
		return 	umUsrDAO.umSelUsrInfo_001(usrAcntVO);
	}

	@Override
	public UsrAcntVO umSelUsrInfoString(String usrId) {
		return 	umUsrDAO.umSelUsrInfo_002(usrId);
	}
	
	
}
