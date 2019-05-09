package poly.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import com.fasterxml.jackson.databind.ObjectMapper;
import poly.service.ICommonService;
import poly.util.MovieUtil;

@Controller
public class CommonController {
   private Logger log = Logger.getLogger(this.getClass());
    
   @Resource(name="CommonService")
   private ICommonService commonService;
   
   @RequestMapping(value="main", method=RequestMethod.GET)
   public String Main(HttpServletRequest request, HttpServletResponse response, 
         ModelMap model) throws Exception {
	   
		/*
		 * log.info("top");
		 * 
		 * Date dt= new Date(); dt.setDate(dt.getDate()-1); int year=dt.getYear()+1900;
		 * int mon=dt.getMonth()+1; String month=""; if(mon<10) { month="0"+mon; }else {
		 * month=""+mon; } int day=dt.getDate(); String day2=""; if(day<10) {
		 * day2="0"+day; }else { day2=""+day; } String date=year+month+day2;
		 * System.out.println(date);
		 * 
		 * String targetDt =
		 * request.getParameter("targetDt")==null?date:request.getParameter("targetDt");
		 * String itemPerPage =
		 * request.getParameter("itemPerPage")==null?"10":request.getParameter(
		 * "itemPerPage"); String key = "257a360ca175e71f65d605e4238a4d90";
		 * KobisOpenAPIRestService service = new KobisOpenAPIRestService(key); String
		 * dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, "",
		 * "", ""); ObjectMapper mapper = new ObjectMapper(); HashMap<String, Object>
		 * map = mapper.readValue(dailyResponse, HashMap.class);
		 * 
		 * Iterator<String> mapIter = map.keySet().iterator();
		 * 
		 * while(mapIter.hasNext()){
		 * 
		 * String key2 = mapIter.next(); Object value = map.get( key2 );
		 * 
		 * log.info(key+" : "+value);
		 * 
		 * }
		 * 
		 * log.info("빼애액"); model.addAttribute("map",map);
		 */
      return "top";
   }
   @RequestMapping(value="top", method=RequestMethod.GET)
   public String Top(HttpServletRequest request, HttpServletResponse response, 
         ModelMap model) throws Exception {
	   
	   log.info("top");
	   
		/*
		 * Date dt= new Date(); dt.setDate(dt.getDate()-1); int year=dt.getYear()+1900;
		 * int mon=dt.getMonth()+1; String month=""; if(mon<10) { month="0"+mon; }else {
		 * month=""+mon; } int day=dt.getDate(); String day2=""; if(day<10) {
		 * day2="0"+day; }else { day2=""+day; } String date=year+month+day2;
		 * System.out.println(date);
		 * 
		 * String targetDt =
		 * request.getParameter("targetDt")==null?date:request.getParameter("targetDt");
		 * String itemPerPage =
		 * request.getParameter("itemPerPage")==null?"3":request.getParameter(
		 * "itemPerPage"); String key = "257a360ca175e71f65d605e4238a4d90";
		 * KobisOpenAPIRestService service = new KobisOpenAPIRestService(key); String
		 * dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, "",
		 * "", ""); ObjectMapper mapper = new ObjectMapper(); HashMap<String, Object>
		 * map = mapper.readValue(dailyResponse, HashMap.class);
		 * 
		 * Iterator<String> mapIter = map.keySet().iterator();
		 * 
		 * while(mapIter.hasNext()){
		 * 
		 * String key2 = mapIter.next(); Object value = map.get( key2 );
		 * 
		 * log.info(key+" : "+value);
		 * 
		 * }
		 */
	   log.info("빼애액");
		/* request.setAttribute("map",map); */
      return "top";
   }
   @RequestMapping(value="top3", method=RequestMethod.GET)
   public String Top3(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	   
	   String						targetDt		= request.getParameter("targetDt")==null?"20190411":request.getParameter("targetDt");
	   String						itemPerPage		= request.getParameter("itemPerPage")==null?"3":request.getParameter("itemPerPage");
	   String						key				= "257a360ca175e71f65d605e4238a4d90";
	   KobisOpenAPIRestService		service			= new KobisOpenAPIRestService(key);
	   String						dailyResponse	= service.getDailyBoxOffice(true, targetDt, itemPerPage, "", "", "");
	   ObjectMapper					mapper			= new ObjectMapper();
	   HashMap<String, Object>		map				= mapper.readValue(dailyResponse, HashMap.class);
	   
	   Iterator<String> mapIter = map.keySet().iterator();
	   
       while(mapIter.hasNext()){

           String key2 = mapIter.next();
           Object value = map.get( key2 );

           log.info(key+" : "+value);

       }
       
	   log.info("빼애액");
	   model.addAttribute("map",map);
	   
      return "top3";
   }
   @RequestMapping(value="top2", method=RequestMethod.GET)
   public String Top2(HttpServletRequest request, HttpServletResponse response, 
         ModelMap model) throws Exception {
	   
	   log.info("빼애액");

      return "top2";
   }
   @RequestMapping(value="test", method=RequestMethod.GET)
   public String test(HttpServletRequest request, HttpServletResponse response, 
		   ModelMap model) throws Exception {
	   
	   log.info("빼애액");
	   
	   return "test.page";
   }
}