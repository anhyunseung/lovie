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

import poly.dto.InquiryDTO;
import poly.service.IInquiryService;
import poly.util.CmmUtil;

@Controller
public class InquiryController {
private Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name="InquiryService")
   private IInquiryService InquiryService;
   
   @RequestMapping(value="inquiry/inquiryList", method=RequestMethod.GET)
   public String Inquiry(HttpServletRequest request, HttpServletResponse response, 
         ModelMap model) throws Exception {
      
            log.info(this.getClass().getName() + ".inquiryList start!");
            
            List<InquiryDTO> rList = InquiryService.getinquiryList();
            
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
            
            if (rList==null){
               rList = new ArrayList<InquiryDTO>();
               
            }
            request.setAttribute("count", count2);
            model.addAttribute("rList", rList);
            
            rList = null;
            
            log.info(this.getClass().getName() + ".inquiryList end!");
            
      
      return "/inquiry/inquiryList";
   }
   
	@RequestMapping(value = "inquiry/inquiryInfo", method = RequestMethod.GET)
	public String InquiryInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("inqIn");
		
		String seq= request.getParameter("inq_seq");
		
		if(seq==null) {
			seq=CmmUtil.nvl((String) session.getAttribute("inq_seq"));
			session.setAttribute("inq_seq","");
		}
		
		System.out.println(seq);
		
		InquiryDTO rDTO = new InquiryDTO();
		
		rDTO.setinq_seq(seq);
		rDTO=InquiryService.getinquiryInfo(rDTO);
		
		model.addAttribute("rDTO", rDTO);
		rDTO=null;
		return "/inquiry/inquiryInfo";
	}
	
	@RequestMapping(value = "inquiry/inquiryDelete", method = RequestMethod.GET)
	public String InquiryDelete(HttpServletRequest request,HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("inqDel");
		
		
		String seq= request.getParameter("inq_seq");
		System.out.println(seq);
		
		InquiryDTO rDTO = new InquiryDTO();
		
		rDTO.setinq_seq(seq);
		
		String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
		String a=InquiryService.getInqUserid(seq);
		System.out.println(a);
		
		if(a.equals(SESSION_USER_ID)) {
			InquiryService.deleteinquiryInfo(rDTO);

			rDTO = null;

			request.setAttribute("msg", "문의내역을 삭제하였습니다.");
		}else {
			rDTO = null;

			request.setAttribute("msg", "잘못된 접근입니다.");
		}
		request.setAttribute("url", "/inquiry/inquiryList.do");
		
		return "/MsgToList";
	}
	
	@RequestMapping(value = "inquiry/inquiryReg", method = RequestMethod.GET)
	public String InquiryReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("inqReg");
		
		return "/inquiry/inquiryReg";
	}
	
	@RequestMapping(value = "inquiry/inquiryInsert", method = RequestMethod.POST)
	public String InquiryInsert(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("inqInsert");
		
		String title= request.getParameter("title");
		
		String contents= request.getParameter("contents");
		String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
		String seq = request.getParameter("inq_seq");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		System.out.println(title);
		System.out.println(contents);
		System.out.println(SESSION_USER_NO);
		System.out.println(SESSION_USER_ID);
		System.out.println(seq);
		System.out.println(email1);
		System.out.println(email2);
		
		InquiryDTO rDTO = new InquiryDTO();
		
		rDTO.setTitle(title);
		rDTO.setReg_user_no(SESSION_USER_NO);
		rDTO.setUser_id(SESSION_USER_ID);
		rDTO.setContents(contents);
		rDTO.setEmail1(email1);
		rDTO.setEmail2(email2);
		
		InquiryService.InsertinquiryInfo(rDTO);
		
		request.setAttribute("msg", "글 작성이 완료되었습니다.");
		request.setAttribute("url", "/inquiry/inquiryList.do");
		
		rDTO=null;
		
		return "/MsgToList";
	}
	
	@RequestMapping(value = "inquiry/inquiryEditInfo", method = RequestMethod.GET)
	public String InquiryEditInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("inqEdIn");
		
		String seq= request.getParameter("inq_seq");
		
		System.out.println(seq);
		
		InquiryDTO rDTO = new InquiryDTO();
		
		rDTO.setinq_seq(seq);
		
		rDTO=InquiryService.getinquiryInfo(rDTO);
		model.addAttribute("rDTO", rDTO);
		
		rDTO=null;
		
		return "/inquiry/inquiryEditInfo";
	}
	
	@RequestMapping(value = "inquiry/inquiryUpdate", method = RequestMethod.POST)
	public String InquiryUpdate(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		System.out.println("inqUp");
		
		String title= request.getParameter("title");
		
		String contents= request.getParameter("contents");
		String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		String seq = request.getParameter("inq_seq");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		System.out.println(title);
		System.out.println(contents);
		System.out.println(SESSION_USER_NO);
		System.out.println(seq);
		System.out.println(email1);
		System.out.println(email2);
		
		InquiryDTO rDTO = new InquiryDTO();
		
		rDTO.setTitle(title);
		rDTO.setChg_user_no(SESSION_USER_NO);
		rDTO.setContents(contents);
		rDTO.setinq_seq(seq);
		rDTO.setEmail1(email1);
		rDTO.setEmail2(email2);
		
		InquiryService.updateinquiryInfo(rDTO);
		
		request.setAttribute("msg", "글 수정이 완료되었습니다.");
		request.setAttribute("url", "/inquiry/inquiryInfo.do?inq_seq="+seq);
		session.setAttribute("inq_seq", seq);
		
		rDTO=null;
		
		return "/MsgToList";
	}
   
   
}