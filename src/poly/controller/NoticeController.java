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

import poly.dto.Comment_noticeDTO;
import poly.dto.NoticeDTO;
import poly.service.INoticeService;
import poly.util.CmmUtil;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "NoticeService")
	private INoticeService NoticeService;

	@RequestMapping(value = "notice/NoticeList", method = RequestMethod.GET)
	public String Notice_List(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + ".NoticeList start!");
		List<NoticeDTO> rList = NoticeService.getNoticeList();
		
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
			rList = new ArrayList<NoticeDTO>();

		}
		
		request.setAttribute("count", count2);
		model.addAttribute("rList", rList);

		rList = null;

		log.info(this.getClass().getName() + ".NoticeList end!");

		return "/notice/NoticeList";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "notice/commentreg", method = RequestMethod.POST)
	public String commentreg(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("notice/commentreg");
		
		String user_id=CmmUtil.nvl((String) session.getAttribute("USER_ID"));
		String user_no=CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		String seq=request.getParameter("notice_seq");
		String contents=request.getParameter("comment");
		
		Comment_noticeDTO cDTO = new Comment_noticeDTO();
		
		cDTO.setUser_id(user_id);
		cDTO.setReg_user_no(user_no);
		cDTO.setnotice_seq(seq);
		cDTO.setContents(contents);
		
		System.out.println(user_id);
		System.out.println(user_no);
		System.out.println(seq);
		System.out.println(contents);
		
		if(user_no=="") {
			session.setAttribute("notice_seq",seq);
			request.setAttribute("msg", "로그인 회원만 댓글을 작성할 수 있습니다.");
			request.setAttribute("url", "/notice/NoticeInfo.do");
			return "/notice/MsgToList";
		}
		
		NoticeService.insertComment(cDTO);
		
		
		if(cDTO==null) {
			request.setAttribute("msg", "댓글입력에 실패하였습니다.");
			request.setAttribute("url", "/notice/NoticeInfo.do");
		}else {
		request.setAttribute("msg", "댓글을 작성하였습니다.");
		request.setAttribute("url", "/notice/NoticeInfo.do");
		session.setAttribute("notice_seq",seq);
		}
		return "/notice/MsgToList";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "notice/commentdelete", method = RequestMethod.GET)
	public String commentdelete(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("notice/commentdelete");
		
		String notice_seq=CmmUtil.nvl((String) session.getAttribute("com_notice_seq"));
		String com_seq=request.getParameter("com_seq");
		
		session.setAttribute("com_notice_seq", "");
		
		Comment_noticeDTO cDTO = new Comment_noticeDTO();
		
		cDTO.setcom_seq(com_seq);
		cDTO.setnotice_seq(notice_seq);
		

		System.out.println(com_seq);
		System.out.println(notice_seq);

		NoticeService.deleteComment(cDTO);
		
		cDTO=null;
		
		request.setAttribute("msg", "댓글을 삭제하였습니다.");
		request.setAttribute("url", "/notice/NoticeInfo.do");
		session.setAttribute("notice_seq",notice_seq);
		
		return "/notice/MsgToList";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "notice/commentupdate", method = RequestMethod.POST)
	public String commentupdate(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("notice/commentupdate");
		
		String user_no=CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		String seq=request.getParameter("notice_seq");
		String com_seq=request.getParameter("com_seq");
		String contents=request.getParameter("comment2");
		
		Comment_noticeDTO cDTO = new Comment_noticeDTO();
		
		cDTO.setChg_user_no(user_no);
		cDTO.setcom_seq(com_seq);
		cDTO.setnotice_seq(seq);
		cDTO.setContents(contents);
		
		System.out.println(user_no);
		System.out.println(seq);
		System.out.println(com_seq);
		System.out.println(contents);
		
		NoticeService.updateComment(cDTO);
		
		request.setAttribute("msg", "댓글을 수정하였습니다.");
		request.setAttribute("url", "/notice/NoticeInfo.do");
		session.setAttribute("notice_seq",seq);
		
		cDTO=null;
		
		return "/notice/MsgToList";
	}
	
	@RequestMapping(value = "notice/NoticeInfo", method = RequestMethod.GET)
	public String NoticeInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("NoIn");
		
		String seq= request.getParameter("notice_seq");
		
		if(seq==null) {
			seq=CmmUtil.nvl((String) session.getAttribute("notice_seq"));
			session.setAttribute("notice_seq","");
		}
		
		session.setAttribute("com_notice_seq",seq);
		
		System.out.println(seq);
		
		NoticeDTO rDTO = new NoticeDTO();
		
		rDTO.setnotice_seq(seq);
		
		rDTO=NoticeService.getNoticeInfo(rDTO);
		
		model.addAttribute("rDTO", rDTO);
		rDTO=null;
		
		return "/notice/NoticeInfo";
	}
	
	@RequestMapping(value = "notice/NoticeInfo2", method = RequestMethod.GET)
	public String NoticeInfo2(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("NoIn2");
		
		String seq= CmmUtil.nvl((String) session.getAttribute("com_notice_seq"));
		String com_seq = request.getParameter("com_seq");

		
		session.setAttribute("com_seq",com_seq);
		
		System.out.println(seq);
		System.out.println(com_seq);
		
		NoticeDTO rDTO = new NoticeDTO();
		
		rDTO.setnotice_seq(seq);
		
		rDTO=NoticeService.getNoticeInfo(rDTO);
		
		model.addAttribute("rDTO", rDTO);
		rDTO=null;
		
		return "/notice/NoticeInfo2";
	}
	
	@RequestMapping(value = "notice/NoticeDelete", method = RequestMethod.GET)
	public String NoticeDelete(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("NoDel");
		
		
		String seq= request.getParameter("notice_seq");
		System.out.println(seq);
		
		NoticeDTO rDTO = new NoticeDTO();
		
		rDTO.setnotice_seq(seq);
		
		NoticeService.deleteCommentALL(seq);
		NoticeService.deleteNoticeInfo(rDTO);
		
		rDTO=null;
		
		request.setAttribute("msg", "글 삭제가 완료되었습니다.");
		request.setAttribute("url", "/notice/NoticeList.do");
		
		return "/notice/MsgToList";
	}
	
	@RequestMapping(value = "notice/NoticeReg", method = RequestMethod.GET)
	public String NoticeReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("NoReg");
		
		return "/notice/NoticeReg";
	}
	
	@RequestMapping(value = "notice/NoticeInsert", method = RequestMethod.POST)
	public String NoticeInsert(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("NoInsert");
		
		String title= request.getParameter("title");
		
		String contents= request.getParameter("contents");
		String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
		String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		
		System.out.println(title);
		System.out.println(contents);
		System.out.println(SESSION_USER_ID);
		System.out.println(SESSION_USER_NO);
		
		NoticeDTO rDTO = new NoticeDTO();
		
		rDTO.setTitle(title);
		rDTO.setReg_user_no(SESSION_USER_NO);
		rDTO.setUser_id(SESSION_USER_ID);
		rDTO.setContents(contents);
		
		NoticeService.InsertNoticeInfo(rDTO);
		
		request.setAttribute("msg", "글 작성이 완료되었습니다.");
		request.setAttribute("url", "/notice/NoticeList.do");
		
		rDTO=null;
		
		return "/notice/MsgToList";
	}
	
	@RequestMapping(value = "notice/NoticeEditInfo", method = RequestMethod.GET)
	public String NoticeEditInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("NoEdIn");
		
		String seq= request.getParameter("notice_seq");
		
		System.out.println(seq);
		
		NoticeDTO rDTO = new NoticeDTO();
		
		rDTO.setnotice_seq(seq);
		
		rDTO=NoticeService.getNoticeInfo(rDTO);
		model.addAttribute("rDTO", rDTO);
		
		rDTO=null;
		
		return "/notice/NoticeEditInfo";
	}
	
	@RequestMapping(value = "notice/NoticeUpdate", method = RequestMethod.POST)
	public String NoticeUpdate(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("NoUp");
		
		String title= request.getParameter("title");
		
		String contents= request.getParameter("contents");
		String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		String seq = request.getParameter("notice_seq");
		
		System.out.println(title);
		System.out.println(contents);
		System.out.println(SESSION_USER_NO);
		System.out.println(seq);
		
		NoticeDTO rDTO = new NoticeDTO();
		
		rDTO.setTitle(title);
		rDTO.setChg_user_no(SESSION_USER_NO);
		rDTO.setContents(contents);
		rDTO.setnotice_seq(seq);
		
		NoticeService.updateNoticeInfo(rDTO);
		
		request.setAttribute("msg", "글 수정이 완료되었습니다.");
		request.setAttribute("url", "/notice/NoticeInfo.do");
		session.setAttribute("notice_seq", seq);
		
		rDTO=null;
		
		return "/notice/MsgToList";
	}
}