package com.project.boardproject.um.service;

import java.io.Serializable;

/***
 * @ClassName : UsrAcntVO.java
 * @Description : 사용자 계정 관련 VO
 * @Modification Information
 * @
 * @  수정일       수정자       수정내용
 * @ ---------   ---------   ------------------------------------------------------------------------
* @ 2021.07.14   김채아      최초생성
* @ 2021.07.21   김채아      우편관리 변수 생성
*   
 * @author 김채아
 * @since 2021.08.18
 * @version 1.0
 * 
 */

public class UsrAcntVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String usrId;
	private String usrPw;
	private String usrNm;
	
	private String usrTel1;
	private String usrTel2;
	private String usrTel3;
	
	private String usrEmail1;
	private String usrEmail2;
	
	private String useYn;
	private String emailAuthYn = "N";
	private String authNum;
	
	
	private String rgtrId;
	private String rgtDtm;
	private String updId;
	private String updrDtm;

	private String pwRgtDtm;
	private String pwInitYn;
	
	private String lstLogimDtm;
	
	private String salt;
	
	/* ===================우편번호 관련 변수=========================*/
	private String postCode;		// 우편번호
	private String bdMgtSn;		// 건물관리번호
	private String bdMgtNm;		// 건물명
	private String adrType;			// 검색된 기본주소 (R : 도로명 / J : 지번)
	private String usrSelType;	// 사용자가 선택한 주소타입
	private String selYn;				// 선택안함 했을때의 기본 값
	private String jibunAdr;		// 지번주소
	private String roadAdr;			// 도로명주소
	private String sido;					// 시도
	private String sigungu;			// 시군구
	private String sigunguSn;		// 시군구 코드
	private String roadSn;			// 도로명 코드
	private String bdSn;				// 법정동 코드
	private String roadNm;			// 도로명 값
	private String bdNm;				//법정동 이름
	private String bdNm1;			//법정동 읍/면
	private String bdNm2;			//법정동/법정리
	private String hNm;				//행정동이름
	private String dtlAdr;			//상세주소
	private String extraAdr;		//참고항목
	/* ==========================================================*/
	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public String getUsrPw() {
		return usrPw;
	}
	public void setUsrPw(String usrPw) {
		this.usrPw = usrPw;
	}
	public String getUsrNm() {
		return usrNm;
	}
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	public String getUsrTel1() {
		return usrTel1;
	}
	public void setUsrTel1(String usrTel1) {
		this.usrTel1 = usrTel1;
	}
	public String getUsrTel2() {
		return usrTel2;
	}
	public void setUsrTel2(String usrTel2) {
		this.usrTel2 = usrTel2;
	}
	public String getUsrTel3() {
		return usrTel3;
	}
	public void setUsrTel3(String usrTel3) {
		this.usrTel3 = usrTel3;
	}
	public String getUsrEmail1() {
		return usrEmail1;
	}
	public void setUsrEmail1(String usrEmail1) {
		this.usrEmail1 = usrEmail1;
	}
	public String getUsrEmail2() {
		return usrEmail2;
	}
	public void setUsrEmail2(String usrEmail2) {
		this.usrEmail2 = usrEmail2;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getEmailAuthYn() {
		return emailAuthYn;
	}
	
	public String getAuthNum() {
		return authNum;
	}
	public void setAuthNum(String authNum) {
		this.authNum = authNum;
	}
	public void setEmailAuthYn(String emailAuthYn) {
		this.emailAuthYn = emailAuthYn;
	}
	public String getRgtrId() {
		return rgtrId;
	}
	public void setRgtrId(String rgtrId) {
		this.rgtrId = rgtrId;
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
	public String getUpdrDtm() {
		return updrDtm;
	}
	public void setUpdrDtm(String updrDtm) {
		this.updrDtm = updrDtm;
	}
	public String getPwRgtDtm() {
		return pwRgtDtm;
	}
	public void setPwRgtDtm(String pwRgtDtm) {
		this.pwRgtDtm = pwRgtDtm;
	}
	public String getPwInitYn() {
		return pwInitYn;
	}
	public void setPwInitYn(String pwInitYn) {
		this.pwInitYn = pwInitYn;
	}
	public String getLstLogimDtm() {
		return lstLogimDtm;
	}
	public void setLstLogimDtm(String lstLogimDtm) {
		this.lstLogimDtm = lstLogimDtm;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getBdMgtSn() {
		return bdMgtSn;
	}
	public void setBdMgtSn(String bdMgtSn) {
		this.bdMgtSn = bdMgtSn;
	}
	public String getBdMgtNm() {
		return bdMgtNm;
	}
	public void setBdMgtNm(String bdMgtNm) {
		this.bdMgtNm = bdMgtNm;
	}
	public String getAdrType() {
		return adrType;
	}
	public void setAdrType(String adrType) {
		this.adrType = adrType;
	}
	public String getUsrSelType() {
		return usrSelType;
	}
	public void setUsrSelType(String usrSelType) {
		this.usrSelType = usrSelType;
	}
	public String getSelYn() {
		return selYn;
	}
	public void setSelYn(String selYn) {
		this.selYn = selYn;
	}
	public String getJibunAdr() {
		return jibunAdr;
	}
	public void setJibunAdr(String jibunAdr) {
		this.jibunAdr = jibunAdr;
	}
	public String getRoadAdr() {
		return roadAdr;
	}
	public void setRoadAdr(String roadAdr) {
		this.roadAdr = roadAdr;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getSigunguSn() {
		return sigunguSn;
	}
	public void setSigunguSn(String sigunguSn) {
		this.sigunguSn = sigunguSn;
	}
	public String getRoadSn() {
		return roadSn;
	}
	public void setRoadSn(String roadSn) {
		this.roadSn = roadSn;
	}
	public String getBdSn() {
		return bdSn;
	}
	public void setBdSn(String bdSn) {
		this.bdSn = bdSn;
	}
	public String getRoadNm() {
		return roadNm;
	}
	public void setRoadNm(String roadNm) {
		this.roadNm = roadNm;
	}
	public String getBdNm() {
		return bdNm;
	}
	public void setBdNm(String bdNm) {
		this.bdNm = bdNm;
	}
	public String getBdNm1() {
		return bdNm1;
	}
	public void setBdNm1(String bdNm1) {
		this.bdNm1 = bdNm1;
	}
	public String getBdNm2() {
		return bdNm2;
	}
	public void setBdNm2(String bdNm2) {
		this.bdNm2 = bdNm2;
	}
	public String gethNm() {
		return hNm;
	}
	public void sethNm(String hNm) {
		this.hNm = hNm;
	}
	public String getDtlAdr() {
		return dtlAdr;
	}
	public void setDtlAdr(String dtlAdr) {
		this.dtlAdr = dtlAdr;
	}
	public String getExtraAdr() {
		return extraAdr;
	}
	public void setExtraAdr(String extraAdr) {
		this.extraAdr = extraAdr;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	@Override
	public String toString() {
		return "UsrAcntVO [usrId=" + usrId + ", usrPw=" + usrPw + ", usrNm=" + usrNm + ", usrTel1=" + usrTel1
				+ ", usrTel2=" + usrTel2 + ", usrTel3=" + usrTel3 + ", usrEmail1=" + usrEmail1 + ", usrEmail2="
				+ usrEmail2 + ", useYn=" + useYn + ", emailAuthYn=" + emailAuthYn + ", authNum=" + authNum + ", rgtrId="
				+ rgtrId + ", rgtDtm=" + rgtDtm + ", updId=" + updId + ", updrDtm=" + updrDtm + ", pwRgtDtm=" + pwRgtDtm
				+ ", pwInitYn=" + pwInitYn + ", lstLogimDtm=" + lstLogimDtm + ", salt=" + salt + ", postCode="
				+ postCode + ", bdMgtSn=" + bdMgtSn + ", bdMgtNm=" + bdMgtNm + ", adrType=" + adrType + ", usrSelType="
				+ usrSelType + ", selYn=" + selYn + ", jibunAdr=" + jibunAdr + ", roadAdr=" + roadAdr + ", sido=" + sido
				+ ", sigungu=" + sigungu + ", sigunguSn=" + sigunguSn + ", roadSn=" + roadSn + ", bdSn=" + bdSn
				+ ", roadNm=" + roadNm + ", bdNm=" + bdNm + ", bdNm1=" + bdNm1 + ", bdNm2=" + bdNm2 + ", hNm=" + hNm
				+ ", dtlAdr=" + dtlAdr + ", extraAdr=" + extraAdr + "]";
	}
	
	
	
}
