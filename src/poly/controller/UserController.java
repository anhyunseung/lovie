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

import poly.dto.NoticeDTO;
import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.service.impl.UserService;
import poly.util.CmmUtil;

 
@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	private IUserService userService;

	@RequestMapping(value = "/user/user_join2", method = RequestMethod.GET)
	public String User_join2(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + "/user/user_join2 start!");

		return "/user/user_join2";
	}
	
	@RequestMapping(value = "/user/user_join", method = RequestMethod.GET)
	public String User_join3(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + "/user/user_join start!");

		return "/user/user_join";
	}
	
	@RequestMapping(value = "/user/user_join3", method = RequestMethod.POST)
	public String User_join(HttpServletRequest request,HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + "/user/user_join3 start!");
		
		String user_id=(String) request.getParameter("user_id");
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		
		System.out.println(user_id);
		
		String id_over = userService.getidover(uDTO);
		System.out.println(id_over);
		if(id_over==null) {
			session.setAttribute("id_over", user_id);
			String msg="사용이 가능한 아이디입니다.";
			String url="/user/user_join.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
		}else {
			String msg="사용이 불가능한 아이디입니다.";
			String url="/user/user_join2.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
		}

		return "/MsgToList";
	}

	
	@RequestMapping(value = "/user/user_id_search", method = RequestMethod.GET)
	public String User_id_search(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + "/user/user_id_search start!");

		return "/user/user_id_search";
	}

	@RequestMapping(value = "/user/user_pw_search", method = RequestMethod.GET)
	public String User_pw_search(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + "/user/user_pw_search start!");

		return "/user/user_pw_search";
	}

	@RequestMapping(value = "/user/user_join_save", method = RequestMethod.POST)
	public String User_join_save(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("/user/user_join_save");

		String user_name = (String) request.getParameter("user_name");
		String user_id = CmmUtil.nvl((String) session.getAttribute("id_over"));
		String user_pw = (String) request.getParameter("pwd1");
		String email1 = (String) request.getParameter("email1");
		String email2 = (String) request.getParameter("email2");
		String tel_1 = (String) request.getParameter("tel_1");
		String tel_2 = (String) request.getParameter("tel_2");
		String tel_3 = (String) request.getParameter("tel_3");
		String birthday = (String) request.getParameter("birthday");
	    session.setAttribute("id_over", "");

		System.out.println(user_name);
		System.out.println(user_id);
		System.out.println(user_pw);
		System.out.println(email1);
		System.out.println(email2);
		System.out.println(tel_1);
		System.out.println(tel_2);
		System.out.println(tel_3);
		System.out.println(birthday);

		UserDTO pDTO = new UserDTO();

		pDTO.setUser_name(user_name);
		pDTO.setUser_id(user_id);
		pDTO.setPassword(user_pw);
		pDTO.setEmail1(email1);
		pDTO.setEmail2(email2);
		pDTO.setTel_1(tel_1);
		pDTO.setTel_2(tel_2);
		pDTO.setTel_3(tel_3);
		pDTO.setBirthday(birthday);

		userService.userJoin(pDTO);

		if (pDTO.equals(null)) {
			String msg="회원가입에 실패하였습니다.";
			session.setAttribute("id_over", user_id);
			String url="/user/user_join.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			

		} else {
			String msg="회원가입이 완료되었습니다.";
			String url="/top.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			log.info(pDTO.getUser_id());
			log.info(pDTO.getPassword());

			pDTO.equals(null);

		}
		return "/MsgToList";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/user/user_login_proc", method = RequestMethod.POST)
	public String User_login_proc(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/user_login_proc");

		String user_id = (String) request.getParameter("user_id");
		String user_pw = (String) request.getParameter("pwd1");
		log.info(user_id);
		log.info(user_pw);

		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO.setPassword(user_pw);

		String user_no = userService.userLogin(uDTO);

		log.info(uDTO.getUser_id());
		log.info(uDTO.getPassword());
		log.info(uDTO.getUser_no());
		log.info(uDTO.getUser_name());
		log.info(uDTO.getEmail1());
		if (user_no == null) {
			request.setAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다.");
			request.setAttribute("url", "/user/user_login.do");
			log.info(uDTO.getUser_id());
			log.info(uDTO.getPassword());
		} else {
			request.setAttribute("msg", "");
			request.setAttribute("url",  CmmUtil.nvl((String) session.getAttribute("url")));
			session.setAttribute("USER_NO", user_no);
			session.setAttribute("USER_ID", user_id);
		}

		uDTO.equals(null);

		return "/MsgToList";
	}

	@RequestMapping(value = "/user/user_id_search_proc")
	public String User_id_search_proc(HttpServletRequest request, HttpSession session, ModelMap model)
			throws Exception {
		log.info("/user/user_id_search");
		String user_id;
		UserDTO pDTO = new UserDTO();
		String user_name = (String) request.getParameter("user_name");
		String email1 = (String) request.getParameter("email1");
		String email2 = (String) request.getParameter("email2");
		log.info(user_name);
		log.info(email1);
		log.info(email2);
		pDTO.setUser_name(user_name);
		pDTO.setEmail1(email1);
		pDTO.setEmail2(email2);

		user_id = userService.userIdsearch(pDTO);

		if (user_id == null) {
			request.setAttribute("msg", "입력한 정보가 맞지 않습니다.");
			request.setAttribute("url", "/user/user_id_search.do");
		} else {
			request.setAttribute("msg", "");
			request.setAttribute("url", "/user/user_id_confirm.do");
			session.setAttribute("USER_NAME", user_name);
			session.setAttribute("USER_ID", user_id);
		}

		return "/user/user_pw_proc";
	}

	@RequestMapping(value = "/user/user_id_confirm", method = RequestMethod.GET)
	public String User_id_confirm(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/user_id_con");

		return "/user/user_id_confirm";
	}

	@RequestMapping(value = "/user/user_pw_search_proc", method = RequestMethod.POST)
	public String User_pw_search_proc(HttpServletRequest request, HttpSession session, ModelMap model)
			throws Exception {

		log.info("/user/user_pw_search_proc");

		UserDTO pDTO = new UserDTO();
		String user_name = (String) request.getParameter("user_name");
		String user_id = (String) request.getParameter("user_id");
		String email1 = (String) request.getParameter("email1");
		String email2 = (String) request.getParameter("email2");
		String tel_1 = (String) request.getParameter("tel_1");
		String tel_2 = (String) request.getParameter("tel_2");
		String tel_3 = (String) request.getParameter("tel_3");
		pDTO.setUser_name(user_name);
		pDTO.setUser_id(user_id);
		pDTO.setEmail1(email1);
		pDTO.setEmail2(email2);
		pDTO.setTel_1(tel_1);
		pDTO.setTel_2(tel_2);
		pDTO.setTel_3(tel_3);
		System.out.println(tel_1);
		String user_id2 = userService.userPwsearch(pDTO);

		log.info(user_id2);

		if (user_id2 == null) {
			System.out.println("!");
			request.setAttribute("msg", "입력한 정보가 맞지 않습니다.");
			request.setAttribute("url", "/user/user_pw_search.do");
		} else {
			request.setAttribute("msg", "");
			request.setAttribute("url", "/user/user_pw_newpw.do");
			session.setAttribute("PW_USER_ID", user_id2);
		}
		return "/user/user_pw_proc";
	}

	@RequestMapping(value = "/user/user_pw_newpw", method = RequestMethod.GET)
	public String User_pw_newpw(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/user_newpw");

		String user_id = (String) request.getParameter("user_id");

		session.setAttribute("USER_ID", user_id);

		return "/user/user_pw_newpw";
	}

	@RequestMapping(value = "/user/user_pw_confirm", method = RequestMethod.POST)
	public String User_pw_uppw(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/user_newpw");

		String user_id = (String) request.getParameter("user_id");
		String password = (String) request.getParameter("pwd1");

		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO.setPassword(password);
		System.out.println(user_id);
		System.out.println(password);
		userService.updatePw(uDTO);

		uDTO = null;

		return "/user/user_pw_confirm";
	}

	@RequestMapping(value = "/user/user_logout", method = RequestMethod.GET)
	public String User_logout(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/user_logout");

		session.setAttribute("USER_NO", "");
		session.setAttribute("USER_ID", "");
		
		System.out.println(session.getAttribute("url"));
		
		return "/user/user_logout";
	}

	@RequestMapping(value = "/user/userInfo", method = RequestMethod.GET)
	public String User_Info(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/userInfo");

		String user_no = CmmUtil.nvl((String) session.getAttribute("USER_NO"));

		System.out.println(user_no);

		UserDTO rDTO = new UserDTO();

		rDTO.setUser_no(user_no);

		rDTO = userService.getUserInfo(rDTO);
		
		
		List<UserDTO> rList = userService.getUserList();

		if (rList == null) {
			rList = new ArrayList<UserDTO>();

		}

		model.addAttribute("rList", rList);

		rList = null;

		model.addAttribute("rDTO", rDTO);
		rDTO = null;
		return "/user/userInfo";
	}
	
	@RequestMapping(value = "/user/userDelete", method = RequestMethod.GET)
	public String UserDelete(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/user_Delete");
		
		String user_no= request.getParameter("user_no");
		System.out.println(user_no);
		String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
		
		UserDTO rDTO = new UserDTO();
		
		rDTO.setUser_no(user_no);
		
		if(SESSION_USER_NO.equals(user_no)) {
			
			userService.deleteUserInfo(rDTO);
			
			request.setAttribute("msg", "이용해주셔서 감사합니다.");
			
			session.setAttribute("USER_NO", "");
			session.setAttribute("USER_ID", "");
			
		}else {
		
			request.setAttribute("msg", "잘못된 접근입니다.");
		
		}
		request.setAttribute("url", "/top.do");
		
		rDTO=null;

		return "/MsgToList";
	}
	
	@RequestMapping(value = "/user/userEditInfo", method = RequestMethod.GET)
	public String UserEditInfo(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/userEditInfo");

		String user_no = request.getParameter("user_no");

		System.out.println(user_no);

		UserDTO rDTO = new UserDTO();

		rDTO.setUser_no(user_no);

		rDTO = userService.getUserInfo(rDTO);
		
		request.setAttribute("user_no",user_no);
		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;

		return "/user/userEditInfo";
	}
	
	@RequestMapping(value = "/user/userUpdate", method = RequestMethod.POST)
	public String UserUpdate(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/userUpdate");
		
		String user_no = (String) request.getParameter("user_no");
		String user_name = (String) request.getParameter("user_name");
		String user_id = (String) request.getParameter("user_id");
		String user_pw = (String) request.getParameter("pwd1");
		String email1 = (String) request.getParameter("email1");
		String email2 = (String) request.getParameter("email2");
		String tel_1 = (String) request.getParameter("tel_1");
		String tel_2 = (String) request.getParameter("tel_2");
		String tel_3 = (String) request.getParameter("tel_3");
		String birthday = (String) request.getParameter("birthday");

		System.out.println(user_no);
		System.out.println(user_name);
		System.out.println(user_id);
		System.out.println(user_pw);
		System.out.println(email1);
		System.out.println(email2);
		System.out.println(tel_1);
		System.out.println(tel_2);
		System.out.println(tel_3);
		System.out.println(birthday);

		UserDTO pDTO = new UserDTO();

		pDTO.setUser_no(user_no);
		pDTO.setUser_name(user_name);
		pDTO.setUser_id(user_id);
		pDTO.setPassword(user_pw);
		pDTO.setEmail1(email1);
		pDTO.setEmail2(email2);
		pDTO.setTel_1(tel_1);
		pDTO.setTel_2(tel_2);
		pDTO.setTel_3(tel_3);
		pDTO.setBirthday(birthday);

		userService.updateUserInfo(pDTO);

		if (pDTO.equals(null)) {

			request.setAttribute("msg", "수정에 실패하였습니다.");
			request.setAttribute("url", "/user/userInfo.do");
		} else {
			request.setAttribute("msg", "회원정보를 수정하였습니다.");
			request.setAttribute("url", "/user/userInfo.do");
	}
		return "/MsgToList";
	}
	
	@RequestMapping(value = "/user/manageList", method = RequestMethod.GET)
	public String User_manageList(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/manageList");

		
		List<UserDTO> rList = userService.getUserList();
		
		String count=request.getParameter("count");
		
		if(count==null) {
			count="0";
		}
		
		System.out.println(Integer.parseInt(count));
		
		int count2 = Integer.parseInt(count);
		
		if(count2!=0) {
			count2=count2-1;
		}
		
		
		if (rList == null) {
			rList = new ArrayList<UserDTO>();

		}
		
		request.setAttribute("count", count2);
		model.addAttribute("rList", rList);

		rList = null;
		
		return "/user/manageList";
	}
	
	@RequestMapping(value = "/user/manageInfo", method = RequestMethod.GET)
	public String UsermanageInfo(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/manageInfo");

		String user_no = request.getParameter("user_no");
		if(user_no==null) {
			user_no = CmmUtil.nvl((String) session.getAttribute("Manage_user_no"));
			session.setAttribute("Manage_user_no","");
		}

		System.out.println(user_no);

		UserDTO rDTO = new UserDTO();

		rDTO.setUser_no(user_no);

		rDTO = userService.getUserInfo(rDTO);
		
		request.setAttribute("user_no",user_no);
		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;

		return "/user/manageInfo";
	}
	
	@RequestMapping(value = "/user/manageDelete", method = RequestMethod.GET)
	public String UsermanageDelete(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/manageDelete");
		
		String user_no= request.getParameter("user_no");
		System.out.println(user_no);
		String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
		UserDTO rDTO = new UserDTO();
		
		rDTO.setUser_no(user_no);
		
		if(SESSION_USER_ID.equals("admin")) {
			
			userService.deleteUserInfo(rDTO);
			
			request.setAttribute("msg", "회원을 탈퇴시켰습니다.");
			request.setAttribute("url", "/user/manageList.do");
			
		}else {
			
			request.setAttribute("msg", "잘못된 접근입니다.");
			request.setAttribute("url", "/top.do");
			
		}
		
		rDTO=null;

		return "/MsgToList";
	}
	
	@RequestMapping(value = "/user/manageEditInfo", method = RequestMethod.GET)
	public String UsermanageEditInfo(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/manageEditInfo");

		String user_no = request.getParameter("user_no");

		System.out.println(user_no);

		UserDTO rDTO = new UserDTO();

		rDTO.setUser_no(user_no);

		rDTO = userService.getUserInfo(rDTO);
		
		request.setAttribute("user_no",user_no);
		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;

		return "/user/manageEditInfo";
	}
	
	@RequestMapping(value = "/user/manageUpdate", method = RequestMethod.POST)
	public String manageUpdate(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/userUpdate");
		
		String user_no = (String) request.getParameter("user_no");
		String user_name = (String) request.getParameter("user_name");
		String user_id = (String) request.getParameter("user_id");
		String user_pw = (String) request.getParameter("pwd1");
		String email1 = (String) request.getParameter("email1");
		String email2 = (String) request.getParameter("email2");
		String tel_1 = (String) request.getParameter("tel_1");
		String tel_2 = (String) request.getParameter("tel_2");
		String tel_3 = (String) request.getParameter("tel_3");
		String birthday = (String) request.getParameter("birthday");

		System.out.println(user_no);
		System.out.println(user_name);
		System.out.println(user_id);
		System.out.println(user_pw);
		System.out.println(email1);
		System.out.println(email2);
		System.out.println(tel_1);
		System.out.println(tel_2);
		System.out.println(tel_3);
		System.out.println(birthday);

		UserDTO pDTO = new UserDTO();

		pDTO.setUser_no(user_no);
		pDTO.setUser_name(user_name);
		pDTO.setUser_id(user_id);
		pDTO.setPassword(user_pw);
		pDTO.setEmail1(email1);
		pDTO.setEmail2(email2);
		pDTO.setTel_1(tel_1);
		pDTO.setTel_2(tel_2);
		pDTO.setTel_3(tel_3);
		pDTO.setBirthday(birthday);

		userService.updateUserInfo(pDTO);

		if (pDTO.equals(null)) {

			request.setAttribute("msg", "수정에 실패하였습니다.");
			request.setAttribute("url", "/user/manageinfo.do");
		} else {
			session.setAttribute("Manage_user_no",user_no);
			request.setAttribute("msg", "회원정보를 수정하였습니다.");
			request.setAttribute("url", "/user/manageInfo.do");
	}
		return "/MsgToList";
	}
	
	@RequestMapping(value = "/user/manage_id_change", method = RequestMethod.GET)
	public String manage_id_change(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/manage_id_change");

		String user_id = (String) request.getParameter("user_id");
		String user_id2=CmmUtil.nvl((String)session.getAttribute("USER_ID_CHE"));
		System.out.println(user_id);
		if(user_id==null) {
			System.out.println(user_id2);
		}else {
		session.setAttribute("USER_ID_CHE",user_id);
		}
		
		return "/user/manage_id_change";
	}
	
	@RequestMapping(value = "/user/manage_id_check", method = RequestMethod.POST)
	public String manage_id_update(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/user/manage_id_check");

		String user_id = (String) request.getParameter("user_id");
		String user_id2 = CmmUtil.nvl((String)session.getAttribute("USER_ID_CHE"));
		session.setAttribute("USER_ID_CHE",user_id2);
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		
		System.out.println("중복 확인 :"+user_id);
		
		String id_over = userService.getidover(uDTO);
		if(id_over==null) {
			uDTO.setUser_id(user_id2);
			System.out.println("번호 가져올 아이디 :"+user_id2);
			String id_over2 = userService.getidover(uDTO);
			
			uDTO.setUser_no(id_over2);
			System.out.println("가져온 번호 :"+id_over2);
			
			uDTO.setUser_id(user_id);
			System.out.println("바꿀 아이디 :"+user_id);
			userService.updateId(uDTO);
			
			session.setAttribute("USER_ID_CHE","");
			uDTO = null;
			return "/user/manage_id_confirm";
		}else {
			request.setAttribute("msg", "이미 존재하는 아이디입니다.");
			request.setAttribute("url", "/user/manage_id_change.do");
		uDTO = null;
		}

		return "/user/user_pw_proc";
	}
	
	
}