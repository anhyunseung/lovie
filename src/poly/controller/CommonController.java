package poly.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import com.fasterxml.jackson.databind.ObjectMapper;
import poly.service.ICommonService;
import poly.util.CmmUtil;
import poly.util.MovieUtil;

@Controller
public class CommonController {
   private Logger log = Logger.getLogger(this.getClass());
    
   @Resource(name="CommonService")
   private ICommonService commonService;
   
   @RequestMapping(value="main", method=RequestMethod.GET)
   public String Main(HttpServletRequest request, HttpServletResponse response, 
         ModelMap model) throws Exception {
	   
      return "top";
   }
   @RequestMapping(value="top", method=RequestMethod.GET)
   public String Top(HttpServletRequest request, HttpServletResponse response, 
         ModelMap model) throws Exception {
	   
	   log.info("top");
	   
		
      return "top";
   }
   @RequestMapping(value="top3", method=RequestMethod.GET)
   public String Top3(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	   
	   
      return "top3";
   }
   
   @RequestMapping(value="video", method=RequestMethod.GET)
   public String Video(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	   
	   String videosrc=(String)request.getAttribute("videosrc");
	   
	   request.setAttribute("videosrc", videosrc);
	   
      return "video";
   }
   
   @RequestMapping(value="movieInfo", method=RequestMethod.GET)
   public String movieInfo(HttpServletRequest request,HttpSession session, HttpServletResponse response, ModelMap model) throws Exception {
	   
	   String moviecode=request.getParameter("moviecode");
	   if(moviecode.isEmpty()) {
		   moviecode=CmmUtil.nvl((String) session.getAttribute("moviecodeI"));
	   }
	   
	   String linkHref = "https://movie.naver.com/movie/bi/mi/basic.nhn?code="+moviecode;
	   Document doc = Jsoup.connect(linkHref).get();
	   Element movie = doc.select("div.mv_info_area div.mv_info h3.h_movie a").first();
	   Elements img = doc.select("div.mv_info_area div.poster a img");
	   Elements text = doc.select("div.story_area p.con_tx");
	   Element genres = doc.select("div.mv_info dl.info_spec dd p span").first();
	   
	   String imgsrc = img.attr("src");
	   String moviename=movie.text();
	   String story=text.text();
	   String genre=genres.text();
	   
	   System.out.println(moviename);
	   
	   String videosrc="https://www.google.com/search?q=영화 "+moviename+" 리뷰 유튜브&source=lnms&tbm=vid&sa=X&ved=0ahUKEwi-rO2Nzp_iAhVnGKYKHXFODdYQ_AUIDigB&biw=949&bih=627";
		Document doc2 = Jsoup.connect(videosrc).get();
		System.out.println(videosrc);
		Elements videos = doc2.select("div.g");
		
		int i=0;
		
		String[] videolook=new String[3];
		
		for(Element video : videos) {
			Element vlink = video.getElementsByTag("a").first();
	        String videov=vlink.attr("href");
	        if(videov.contains("https://www.youtube.com/watch?v=")) {
	        	String[] videointo=videov.split("v=");
	        	videolook[i]=videointo[1];
	        	i+=1;
	        }
	        if(i==3) {
	        	break;
	        }
		}
	   
	   session.setAttribute("moviecodeI", moviecode);
	   request.setAttribute("imgI", imgsrc);
	   request.setAttribute("nameI", moviename);
	   request.setAttribute("storyI", story);
	   request.setAttribute("genreI", genre);
	   request.setAttribute("videoL1", videolook[0]);
	   request.setAttribute("videoL2", videolook[1]);
	   request.setAttribute("videoL3", videolook[2]);
	   
	   
      return "movieInfo";
   }
}