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
}