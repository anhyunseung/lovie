package poly.controller;

import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.UserDTO;
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
	   log.info("빼애액");
      return "top";
   }
   @RequestMapping(value="top", method=RequestMethod.GET)
   public String Top(HttpServletRequest request, HttpServletResponse response, 
         ModelMap model) throws Exception {
	   
	   log.info("빼애액");

      return "top";
   }
   @RequestMapping(value="top3", method=RequestMethod.GET)
   public String Top3(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	   HashMap<String, Object> map = MovieUtil.getMovieList(request);
	   
	   Iterator<String> mapIter = map.keySet().iterator();
	   
       while(mapIter.hasNext()){

           String key = mapIter.next();
           Object value = map.get( key );

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
}