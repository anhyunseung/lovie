package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.BBMDTO;
import poly.dto.Comment_bbmDTO;
import poly.dto.Comment_bbmDTO;
import poly.dto.Comment_bbmDTO;
import poly.dto.BBMDTO;
import poly.service.IBBMService;
import poly.util.CmmUtil;

@Controller
public class BBMController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "BBMService")
	private IBBMService bbmService;

	@RequestMapping(value = "bbm/bbmList", method = RequestMethod.GET)
	public String BBM_List(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".bbmList start!");

		List<BBMDTO> rList = bbmService.getbbmList();
		
		String count=request.getParameter("count");
		
		if(count==null) {
			count="0";
		}
		
		
		System.out.println(Integer.parseInt(count));
		
		int count2 = Integer.parseInt(count);
		
		if(count2!=0) {
			count2=count2-1;
		}
		
		System.out.println(count2);
		

		if (rList == null) {
			rList = new ArrayList<BBMDTO>();

		}
		request.setAttribute("count", count2);
		model.addAttribute("rList", rList);

		rList = null;

		return "bbm/bbmList";
	}

	@RequestMapping(value = "bbm/bbmInfo", method = RequestMethod.GET)
	public String bbmInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {

		System.out.println("bbmIn");

		String seq = request.getParameter("bbm_seq");

		if (seq == null) {
			seq = CmmUtil.nvl((String) session.getAttribute("bbm_seq"));
			session.setAttribute("bbm_seq", "");
		}
		session.setAttribute("com_bbm_seq", seq);

		System.out.println(seq);

		BBMDTO rDTO = new BBMDTO();

		rDTO.setbbm_seq(seq);

		rDTO = bbmService.getbbmInfo(rDTO);

		model.addAttribute("rDTO", rDTO);
		rDTO = null;

		return "/bbm/bbmInfo";
	}

	@RequestMapping(value = "bbm/bbmInfo2", method = RequestMethod.GET)
	public String bbmInfo2(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			ModelMap model) throws Exception {

		System.out.println("bbmIn2");

		String seq = CmmUtil.nvl((String) session.getAttribute("com_bbm_seq"));
		String com_seq = request.getParameter("com_seq");

		session.setAttribute("com_seq", com_seq);

		System.out.println(seq);
		System.out.println(com_seq);

		BBMDTO rDTO = new BBMDTO();

		rDTO.setbbm_seq(seq);

		rDTO = bbmService.getbbmInfo(rDTO);

		model.addAttribute("rDTO", rDTO);
		rDTO = null;

		return "/bbm/bbmInfo2";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "bbm/commentreg", method = RequestMethod.POST)
	public String commentreg(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("bbm/commentreg");

		String user_id = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
		String user_no = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		String seq = request.getParameter("bbm_seq");
		String contents = request.getParameter("comment");

		Comment_bbmDTO cDTO = new Comment_bbmDTO();

		cDTO.setUser_id(user_id);
		cDTO.setReg_user_no(user_no);
		cDTO.setbbm_seq(seq);
		cDTO.setContents(contents);

		System.out.println(user_id);
		System.out.println(user_no);
		System.out.println(seq);
		System.out.println(contents);

		if (user_no == "") {
			session.setAttribute("bbm_seq", seq);
			request.setAttribute("msg", "로그인 회원만 댓글을 작성할 수 있습니다.");
			request.setAttribute("url", "/bbm/bbmInfo.do");
			return "/bbm/MsgToList";
		}

		bbmService.insertComment(cDTO);

		if (cDTO == null) {
			request.setAttribute("msg", "댓글입력에 실패하였습니다.");
			request.setAttribute("url", "/bbm/bbmInfo.do");
		} else {
			request.setAttribute("msg", "댓글을 작성하였습니다.");
			request.setAttribute("url", "/bbm/bbmInfo.do");
			session.setAttribute("bbm_seq", seq);
		}
		return "/bbm/MsgToList";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "bbm/commentdelete", method = RequestMethod.GET)
	public String commentdelete(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("bbm/commentdelete");

		String bbm_seq = CmmUtil.nvl((String) session.getAttribute("com_bbm_seq"));
		session.setAttribute("com_bbm_seq", "");
		String com_seq = request.getParameter("com_seq");

		Comment_bbmDTO cDTO = new Comment_bbmDTO();

		cDTO.setbbm_seq(bbm_seq);
		cDTO.setcom_seq(com_seq);

		System.out.println(com_seq);
		System.out.println(bbm_seq);

		bbmService.deleteComment(cDTO);

		cDTO = null;

		request.setAttribute("msg", "댓글을 삭제하였습니다.");
		request.setAttribute("url", "/bbm/bbmInfo.do");
		session.setAttribute("bbm_seq", bbm_seq);

		return "/bbm/MsgToList";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "bbm/commentupdate", method = RequestMethod.POST)
	public String commentupdate(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("bbm/commentupdate");

		String user_no = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		String seq = request.getParameter("bbm_seq");
		String com_seq = request.getParameter("com_seq");
		String contents = request.getParameter("comment2");

		Comment_bbmDTO cDTO = new Comment_bbmDTO();

		cDTO.setChg_user_no(user_no);
		cDTO.setcom_seq(com_seq);
		cDTO.setbbm_seq(seq);
		cDTO.setContents(contents);

		System.out.println(user_no);
		System.out.println(seq);
		System.out.println(com_seq);
		System.out.println(contents);

		bbmService.updateComment(cDTO);
		
		System.out.println("?1");
		
		request.setAttribute("msg", "댓글을 수정하였습니다.");
		request.setAttribute("url", "/bbm/bbmInfo.do");
		session.setAttribute("bbm_seq", seq);

		cDTO = null;

		return "/bbm/MsgToList";
	}

	@RequestMapping(value = "bbm/bbmDelete", method = RequestMethod.GET)
	public String bbmDelete(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		System.out.println("bbmDel");

		String seq = request.getParameter("bbm_seq");
		System.out.println(seq);

		BBMDTO rDTO = new BBMDTO();

		rDTO.setbbm_seq(seq);
		
		bbmService.deleteCommentALL(seq);
		bbmService.deletebbmInfo(rDTO);

		rDTO = null;

		request.setAttribute("msg", "글 삭제 완료되었습니다.");
		request.setAttribute("url", "/bbm/bbmList.do");

		return "/bbm/MsgToList";
	}

	@RequestMapping(value = "bbm/bbmReg", method = RequestMethod.GET)
	public String bbmReg(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		System.out.println("bbmReg");

		return "/bbm/bbmReg";
	}

	@RequestMapping(value = "bbm/bbmInsert", method = RequestMethod.POST)
	public String bbmInsert(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			ModelMap model) throws Exception {

		System.out.println("bbmInsert");

		String title = request.getParameter("title");

		String contents = request.getParameter("contents");
		String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
		String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));

		System.out.println(title);
		System.out.println(contents);
		System.out.println(SESSION_USER_ID);
		System.out.println(SESSION_USER_NO);

		BBMDTO rDTO = new BBMDTO();

		rDTO.setTitle(title);
		rDTO.setReg_user_no(SESSION_USER_NO);
		rDTO.setUser_id(SESSION_USER_ID);
		rDTO.setContents(contents);

		bbmService.InsertbbmInfo(rDTO);

		request.setAttribute("msg", "글 작성이 완료되었습니다.");
		request.setAttribute("url", "/bbm/bbmList.do");

		rDTO = null;

		return "/bbm/MsgToList";
	}

	@RequestMapping(value = "bbm/bbmEditInfo", method = RequestMethod.GET)
	public String bbmEditInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		System.out.println("bbmEdIn");

		String seq = request.getParameter("bbm_seq");

		System.out.println(seq);

		BBMDTO rDTO = new BBMDTO();

		rDTO.setbbm_seq(seq);

		rDTO = bbmService.getbbmInfo(rDTO);
		model.addAttribute("rDTO", rDTO);

		rDTO = null;

		return "/bbm/bbmEditInfo";
	}

	@RequestMapping(value = "bbm/bbmUpdate", method = RequestMethod.POST)
	public String bbmUpdate(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			ModelMap model) throws Exception {

		System.out.println("bbmUp");

		String title = request.getParameter("title");

		String contents = request.getParameter("contents");
		String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		String seq = request.getParameter("bbm_seq");

		System.out.println(title);
		System.out.println(contents);
		System.out.println(SESSION_USER_NO);
		System.out.println(seq);

		BBMDTO rDTO = new BBMDTO();

		rDTO.setTitle(title);
		rDTO.setChg_user_no(SESSION_USER_NO);
		rDTO.setContents(contents);
		rDTO.setbbm_seq(seq);

		bbmService.updatebbmInfo(rDTO);

		request.setAttribute("msg", "글 수정이 완료되었습니다.");
		request.setAttribute("url", "/bbm/bbmInfo.do");
		session.setAttribute("bbm_seq", seq);

		rDTO = null;

		return "/bbm/MsgToList";
	}
}