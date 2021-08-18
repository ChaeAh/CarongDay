package com.project.boardproject.cm.service;

import java.io.Serializable;

/***
 * @ClassName : CmVO.java
 * @Description : 공통 관련 VO
 * @Modification Information
 * @
 * @  수정일       수정자       수정내용
 * @ ---------   ---------   ------------------------------------------------------------------------
* @ 2021.08.XX   김채아      최초생성
*   
 * @author 김채아
 * @since 2021.08.18
 * @version 1.0
 * 
 */

public class CmVO implements Serializable{
	
	private static final long serialVersionUID = 1L; 
	
	private String gnrCd;				//일반코드
	private String cdId;				//코드ID
	private String gnrCdNm;		//일반코드명
	private String cdCts;				//코드명
	private String cdPrps;			//코드용도
	private String useYn;
	private String rgtrId;
	private String rgtDtm;
	private String updrId;
	private String updDtm;
	public String getGnrCd() {
		return gnrCd;
	}
	public void setGnrCd(String gnrCd) {
		this.gnrCd = gnrCd;
	}
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getGnrCdNm() {
		return gnrCdNm;
	}
	public void setGnrCdNm(String gnrCdNm) {
		this.gnrCdNm = gnrCdNm;
	}
	public String getCdCts() {
		return cdCts;
	}
	public void setCdCts(String cdCts) {
		this.cdCts = cdCts;
	}
	public String getCdPrps() {
		return cdPrps;
	}
	public void setCdPrps(String cdPrps) {
		this.cdPrps = cdPrps;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getUpdrId() {
		return updrId;
	}
	public void setUpdrId(String updrId) {
		this.updrId = updrId;
	}
	public String getUpdDtm() {
		return updDtm;
	}
	public void setUpdDtm(String updDtm) {
		this.updDtm = updDtm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
