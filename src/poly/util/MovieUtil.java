package poly.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public class MovieUtil {
	public static HashMap<String, Object> getMovieList (HttpServletRequest request) throws OpenAPIFault, Exception {
		String						targetDt		= request.getParameter("targetDt")==null?"20190410":request.getParameter("targetDt");
		String						itemPerPage		= request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");
		String						key				= "257a360ca175e71f65d605e4238a4d90";
		KobisOpenAPIRestService		service			= new KobisOpenAPIRestService(key);
		String						dailyResponse	= service.getDailyBoxOffice(true, targetDt, itemPerPage, "", "", "");
		ObjectMapper				mapper			= new ObjectMapper();
		HashMap<String, Object>		codeResult		= mapper.readValue(dailyResponse, HashMap.class);
		
		return codeResult;
	}
}
