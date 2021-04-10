
package com.project.boardproject.cm.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.boardproject.cm.service.BoardVO;
import com.project.boardproject.cm.service.CmService;
import com.project.boardproject.cm.web.Pagination;
import com.project.boardproject.um.service.UsrAcntVO;

/*
 * 파일명 : customController.java
 * 용도    : 사용자 관련 컨트롤러
 * 작성자 : mintchoco91
 * 변경일 : 2019/09/14
 */

@Controller
public class CmController {

	@Autowired
	private CmService cmservice;

	private static final Logger logger = LoggerFactory.getLogger(CmController.class);

	/***** 공통 게시판 시작 ************************************************************/

	// 내용 : index조회
	@RequestMapping("index")
	public String index(Model model, UsrAcntVO usrAcntVO) {
		return "index";
	}

	// 내용 : 게시판 리스트 페이지 로드
	@RequestMapping(value = "boardListPage")
	public String boardListPage(Model model) throws Exception {
		return "board/boardListPage";
	}

	/*
	 * // 내용 : 게시판 조회
	 * 
	 * @RequestMapping(value = "boardInq") public String boardInq(Model model,
	 * BoardVO boardVO, @RequestParam(defaultValue = "1") int curPage) { // 리스트로 구현
	 * List<BoardVO> boardVOArr = new ArrayList<BoardVO>(); // 전체리스트 개수 int listCnt
	 * = cmservice.boardInqCnt(boardVO);
	 * 
	 * System.out.println("########key : "+boardVO.getSrchKeyword());
	 * 
	 * Pagination pagination = new Pagination(listCnt, curPage);
	 * 
	 * boardVO.setStartIndex(pagination.getStartIndex());
	 * boardVO.setPageSize(pagination.getPageSize());
	 * 
	 * boardVOArr = cmservice.boardInq(boardVO);
	 * 
	 * SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd"); Date time =
	 * new Date();
	 * 
	 * String dateNow = dateFormat.format(time);
	 * 
	 * String fullRgtDtm = ""; String todayRgtDtm = ""; String convRgtDtm = "";
	 * 
	 * for (int i = 0; i < boardVOArr.size(); i++) { fullRgtDtm =
	 * boardVOArr.get(i).getRgtDtm(); todayRgtDtm = fullRgtDtm.substring(0, 8);
	 * 
	 * if (todayRgtDtm.equals(dateNow)) { convRgtDtm = fullRgtDtm.substring(8, 10) +
	 * ":" + fullRgtDtm.substring(10, 12); } else { convRgtDtm =
	 * fullRgtDtm.substring(2, 4) + "." + fullRgtDtm.substring(4, 6) + "." +
	 * fullRgtDtm.substring(6, 8); }
	 * 
	 * boardVOArr.get(i).setRgtDtm(convRgtDtm); }
	 * 
	 * model.addAttribute("boardVOArr", boardVOArr);
	 * model.addAttribute("pagination", pagination);
	 * 
	 * return "board/boardList"; }
	 * 
	 * // 내용 : 게시판 글쓰기페이지 로드
	 * 
	 * @RequestMapping(value = "boardWritePage") public String
	 * boardWritePage(@ModelAttribute("boardVO") BoardVO boardVO, Model model)
	 * throws Exception { return "board/boardRegister"; }
	 * 
	 * // 내용 : 게시판 글쓰기 등록
	 * 
	 * @RequestMapping(value = "boardWrite") public String boardWrite(Model model,
	 * BoardVO boardVO) throws Exception { cmservice.boardWrite(boardVO); return
	 * "redirect:boardInq.do"; }
	 * 
	 * // Post AJAX
	 * 
	 * @RequestMapping(value = "boardDelete", method = RequestMethod.POST)
	 * public @ResponseBody String boardDelete(HttpServletRequest request, String[]
	 * idxArray, Model model) throws Exception {
	 * 
	 * String result = "error";
	 * 
	 * result = cmservice.boardDelete(idxArray); return result; }
	 * 
	 * // 내용 : 게시판 상세조회
	 * 
	 * @RequestMapping(value = "boardDetail") public String boardDetail(Model model,
	 * BoardVO boardVO) throws Exception {
	 * 
	 * BoardVO resultBoardVO = new BoardVO(); resultBoardVO =
	 * cmservice.boardDetail(boardVO);
	 * 
	 * String fullRgtDtm = resultBoardVO.getRgtDtm(); String convRgtDtm =
	 * fullRgtDtm.substring(0, 4) + "." + fullRgtDtm.substring(4, 6) + "." +
	 * fullRgtDtm.substring(6, 8) + ". " + fullRgtDtm.substring(8, 10) + ":" +
	 * fullRgtDtm.substring(10, 12);
	 * 
	 * resultBoardVO.setRgtDtm(convRgtDtm);
	 * 
	 * model.addAttribute("boardVO", resultBoardVO);
	 * 
	 * return "board/boardDetail"; }
	 * 
	 * // 내용 : 게시판 수정페이지 로드
	 * 
	 * @RequestMapping(value = "boardModifyPage") public String
	 * boardModifyPage(Model model, BoardVO boardVO) throws Exception {
	 * model.addAttribute("boardVO", boardVO); return "board/boardRegister"; }
	 * 
	 * // 내용 : 게시판 내용 수정
	 * 
	 * @RequestMapping(value = "boardModify") public String boardModify(Model model,
	 * BoardVO boardVO) throws Exception { cmservice.boardModify(boardVO); return
	 * "redirect:boardInq.do"; }
	 */

	/***** 공통 게시판 끝 ************************************************************/

	@RequestMapping(value = "boardList.do")
	public String boardList(@ModelAttribute("BoardVO") BoardVO boardVO, Model model,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		logger.info("boardList START!!!");
		int listCnt = cmservice.boardgetBoardCnt(boardVO);
		Pagination pagination = new Pagination(listCnt, curPage);

		boardVO.setStartIndex(pagination.getStartIndex());
		boardVO.setPageSize(pagination.getPageSize());

		List<BoardVO> boardList = new ArrayList<>();

		boardList = cmservice.boardGetList(boardVO);

		for (int i = 0; i < boardList.size(); i++) {
			String year = boardList.get(i).getRgtDtm().substring(0, 4);
			String month = boardList.get(i).getRgtDtm().substring(4, 6);
			String date = boardList.get(i).getRgtDtm().substring(6, 8);
			boardList.get(i).setRgtDtm(year + "-" + month + "-" + date);
		}
		// boardList =cmservice.boardGetList(boardVO);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("srchKeyword", boardVO.getSrchKeyword());
		model.addAttribute("srchtrg", boardVO.getSrchtrg());
		logger.info("boardList END!!!");
		return "board/boardList";
	}
	
	@RequestMapping(value="boardExcelDown")
	public String boardExcelDown(@ModelAttribute("BoardVO") BoardVO boardVO, Model model,@RequestParam(defaultValue = "1") int curPage) throws Exception {
		logger.info("boardExcelDown START!!!");
		int listCnt = cmservice.boardgetBoardCnt(boardVO);
		logger.debug(listCnt  + "게시물의 수");
		Pagination pagination = new Pagination(listCnt, curPage);
		boardVO.setStartIndex(pagination.getStartIndex());
		boardVO.setPageSize(pagination.getPageSize());

		List<BoardVO> boardList = null;
		
		boardList = cmservice.boardGetList(boardVO);
		HSSFWorkbook workbook = new HSSFWorkbook(); //워크북
		HSSFSheet sheet = workbook.createSheet(); //워크시트
		HSSFRow row = sheet.createRow(0);				//행 생성
		HSSFCell cell;														//셀 생성
		
		cell = row.createCell(0);
		cell.setCellValue("제목");
		
		cell= row.createCell(1);
		cell.setCellValue("내용");
		BoardVO vo = new BoardVO();
		for(int i=0; i<boardList.size(); i++) {
			vo= boardList.get(i);
			System.out.println(vo.getTitle());
			row = sheet.createRow(i++);
			
			cell= row.createCell(0);
			cell.setCellValue(vo.getTitle());
			
			cell= row.createCell(1);
			cell.setCellValue(vo.getContents());
		}
		
		FileOutputStream fos = null;
		try {
		fos= new FileOutputStream(new File("C:/excel/text.xls"));
		workbook.write(fos);
		}catch(FileNotFoundException e) {
			e.getMessage();
			logger.debug("파일을 찾을수 없습니다.");
		}finally {
		
		}
		logger.info("boardExcelDown END!!!");
		return "redirect:boardList.do";
	}

	@RequestMapping(value = "boardRegister", method = RequestMethod.GET)
	public String boardRegister(Model model) throws Exception {
		String flag = "등록";
		model.addAttribute("flag", flag);
		return "board/boardRegister";
	}

	@RequestMapping(value = "boardUpdList", method = RequestMethod.POST)
	public String boardUpdList(@ModelAttribute("BoardVO") BoardVO boardVO, Model model) throws Exception {
		String flag = "수정";
		model.addAttribute("flag", flag);
		model.addAttribute("BoardVO", boardVO);
		return "board/boardRegister";
	}

	@RequestMapping(value = "boardInsert", method = RequestMethod.POST)
	public String boardInsert(Model model, @ModelAttribute("BoardVO") BoardVO boardVO, HttpServletRequest request)
			throws Exception {

		System.out.println(boardVO.toString());
		cmservice.boardInsert(boardVO);
		model.addAttribute("BoardVO", boardVO);
		return "redirect:boardList.do";
	}

	@ResponseBody
	@RequestMapping(value = "boardDelete", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public int boardDelete(@RequestParam(value = "chbox[]") List<String> chArr, HttpServletRequest request)
			throws Exception {
		int idx = 0;
		int result = 0;
		BoardVO vo = new BoardVO();
		for (String delete : chArr) {
			idx = Integer.parseInt(delete);
			vo.setIdx(idx);

			cmservice.boardDelete(vo);
			result = 1;
			System.out.println(vo.getIdx());
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "boardUpdateReadCnt", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public int boardUpdateReadCnt(@RequestParam(value = "idx") int idx, HttpServletRequest request) throws Exception {
		int result = cmservice.boardUpdateReadCnt(idx);
		return result;
	}

	@RequestMapping(value = "boardUpdBoard")
	public String boardUpdBoard(@ModelAttribute(value = "BoardVO") BoardVO boardVO, Model model) throws Exception {
		System.out.println(boardVO.toString());
		cmservice.boardUpdBoard(boardVO);
		model.addAttribute("BoardVO", boardVO);
		model.addAttribute("idx", boardVO.getIdx());
		String url="redirect:Detail.do";
		
		return "redirect:Detail.do?flag='T'";
	}

	@RequestMapping(value = "Detail")
	public String boardDetail(Model model, BoardVO boardVO, @RequestParam(value = "idx") int idx,
			@RequestParam(defaultValue = "F") String flag, HttpServletRequest request) throws Exception {
		logger.info("boardDetail");
		System.out.println(idx + "인덱스번호가 ㅇ나넘아어니ㅏ러니");
		String url = "";
		BoardVO vo = new BoardVO();
		boardVO.setIdx(idx);
		vo = cmservice.boardDetail(boardVO);
		System.out.println(vo.toString() + "왜 안찍히니");
		System.out.println(flag + "너가 정답이냐 아 졸려 ??졸려죽겟냐 ");

		if ("Y".equals(vo.getScrYn()) && "F".equals(flag)) {
			System.out.println("이쪽인고야?");
			url = "board/boardScrPwChk";
		} else {
			System.out.println("안녕하세요?zzzz");
			url = "board/boardDetail";
		}
		model.addAttribute("vo", vo);
		return url;
	}

	@RequestMapping(value = "boardScrPwChk")
	public String boardScrPwChk(BoardVO boardVO, Model model) throws Exception {
		System.out.println("여기 안들어오냐");
		model.addAttribute("vo", boardVO);
		return "board/boardScrPwChk";
	}

	@ResponseBody
	@RequestMapping(value = "boardScrPwChkConfirm")
	public int boardScrPwChkConfirm(@RequestParam(value = "idx") int idx, @RequestParam(value = "scrPw") String scrPw,
			Model model) throws Exception {
		BoardVO vo = new BoardVO();
		vo.setIdx(idx);
		vo.setScrPw(scrPw);
		System.out.println("hello" + vo.toString());
		int result = cmservice.boardScrPwChkConfirm(vo);
		return result;
	}
}