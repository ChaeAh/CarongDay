
package com.project.boardproject.cm.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.project.boardproject.um.service.UsrAcntVO;

/***
 * @ClassName : CmController.java
 * @Description : 공통 Controller
 * @Modification Information
 * @
 * @  수정일       수정자       수정내용
 * @ ---------   ---------   ------------------------------------------------------------------------
* @ 2021.07.XX   김채아      최초생성
*   
 * @author 김채아
 * @since 2021.08.18
 * @version 1.0
 * 
 */


@Controller
public class CmController {

	@Autowired
	private CmService cmservice;

	private static final Logger logger = LoggerFactory.getLogger(CmController.class);

	/***** 공통 게시판 시작 ************************************************************/

	// 내용 : index조회
	@RequestMapping("/")
	public String index(Model model, UsrAcntVO usrAcntVO) {
		return "index";
	}

	// 내용 : 게시판 리스트 페이지 로드
	@RequestMapping(value = "boardListPage")
	public String boardListPage(Model model) throws Exception {
		return "board/boardListPage";
	}

	@RequestMapping(value="cm/kakaoMap.do")
	public String kakoMap() throws Exception {
		return "cm/kakaoMap";
	}
	@RequestMapping(value = "boardList.do")
	public String boardList(@ModelAttribute("BoardVO") BoardVO boardVO, Model model,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		logger.info("boardList START!!!");
		int listCnt = cmservice.boardgetBoardCnt(boardVO);
		Pagination pagination = new Pagination(listCnt, curPage);

		List<BoardVO> boardList = new ArrayList<>();

		boardVO.setPageSize(pagination.getPageSize());
		boardVO.setStartIndex(pagination.getStartIndex());

		boardList = cmservice.boardGetList(boardVO);

		model.addAttribute("boardList", boardList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("srchKeyword", boardVO.getSrchKeyword());
		model.addAttribute("srchtrg", boardVO.getSrchtrg());
		logger.info("boardList END!!!");
		return "board/boardList";
	}
	
	@ResponseBody
	@RequestMapping(value = "boardListInqAjax.do")
	public Map<String, Object> boardList2(@ModelAttribute("BoardVO") BoardVO boardVO, Model model,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		logger.info("boardListInqAjax START!!!");

		int listCnt = cmservice.boardgetBoardCnt(boardVO);
		Pagination pagination = new Pagination(listCnt, curPage);
		
		Map<String, Object> map = new HashMap<>();
		List<BoardVO> boardList = new ArrayList<>();

		boardVO.setStartIndex(pagination.getStartIndex());
		boardVO.setPageSize(pagination.getEndIndex());

		boardList = cmservice.boardGetList(boardVO);
	
		model.addAttribute("resultList", boardList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("srchKeyword", boardVO.getSrchKeyword());
		model.addAttribute("srchtrg", boardVO.getSrchtrg());
		
		map.put("resultList", boardList);
		map.put("pagination", pagination);
		logger.info("boardListInqAjax END!!!");
		return map;
	}
	
	
	@RequestMapping(value="boardExcelDown")
	public String boardExcelDown(@ModelAttribute("BoardVO") BoardVO boardVO, Model model,@RequestParam(defaultValue = "1") int curPage) throws Exception {
		logger.info("boardExcelDown START!!!");
		int listCnt = cmservice.boardgetBoardCnt(boardVO);
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
		BoardVO vo = new BoardVO();
		
		vo = cmservice.boardDetail(boardVO);
		vo.setContents(vo.getContents().replace("</br>", "\r\n"));
		
		model.addAttribute("flag", flag);
		model.addAttribute("BoardVO", vo);
		return "board/boardRegister";
	}

	@RequestMapping(value = "boardInsert", method = RequestMethod.POST)
	public String boardInsert(Model model, @ModelAttribute("BoardVO") BoardVO boardVO, HttpServletRequest request) throws Exception {
		cmservice.boardInsert(boardVO);
		model.addAttribute("BoardVO", boardVO);
		return "redirect:boardList.do";
	}

//	@ResponseBody
//	@RequestMapping(value = "boardDelete", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	public int boardDelete(@RequestParam(value = "chbox[]") List<String> chArr, HttpServletRequest request)
//			throws Exception {
//		int idx = 0;
//		int result = 0;
//		BoardVO vo = new BoardVO();
//		for (String delete : chArr) {
//			idx = Integer.parseInt(delete);
//			vo.setIdx(idx);
//
//			cmservice.boardDelete(vo);
//			result = 1;
//			System.out.println(vo.getIdx());
//		}
//		return result;
//	}
	
	@ResponseBody
	@RequestMapping(value = "boardDelete", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public int boardDelete(@ModelAttribute("BoardVO") BoardVO boardVO , HttpServletRequest request) throws Exception {

		int result = 0;
		result = cmservice.boardDelete(boardVO);

		result = 1;

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

	@RequestMapping(value = "boardInqWrtDtl.do")
	public String boardDetail(Model model, BoardVO boardVO, @RequestParam(value = "idx") int idx,
			@RequestParam(defaultValue = "F") String flag, HttpServletRequest request) throws Exception {
		logger.info("boardDetail");
		String url = "";
		BoardVO vo = new BoardVO();
		vo = cmservice.boardDetail(boardVO);
		
		vo.setContents(vo.getContents().replace("\r\n", "</br>"));
		
		if ("Y".equals(vo.getScrYn()) && "F".equals(flag)) {
			url = "board/boardScrPwChk";
		} else {
			url = "board/boardDetail";
		}
		
		model.addAttribute("vo", vo);
		
		return url;
	}

	@RequestMapping(value = "boardScrPwChk")
	public String boardScrPwChk(BoardVO boardVO, Model model) throws Exception {
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