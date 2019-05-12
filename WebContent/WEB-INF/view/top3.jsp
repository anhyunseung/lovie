<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.UserDTO"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.URL" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
session.setAttribute("url", "/top.do");
String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
System.out.println("ss_user_id : " + SESSION_USER_ID);

int year1=2019;
int mon1=1;
int day1=1;

Date dt= new Date(); 
int mon3=dt.getMonth()+1;
int day3=dt.getDate();

int day4=28;
int i=0;
int n=mon1+1;

String month="";
String day2="";

day4=28;
String[] date1=new String[7];

for(mon1=1;mon1<=n;mon1++){
	if(mon1==mon3){
		day4=day3;
	}
	if(mon1==n){
		day4=1;
	}
	for(day1=1;day1<=day4;day1=day1+7){
		
		if(mon1<10) { 
				month="0"+mon1; 
			}else {
				month=""+mon1; 
			} 
		
		if(day1<10) {
				day2="0"+day1; 
			}else { 
				day2=""+day1; 
			}
		date1[i]="2019"+month+day2;
		System.out.println(date1[i]+" "+i);
		i++;
	}
}

mon1=1;
int q=0;
String mon5="";
if(mon1<10) { 
	mon5="0"+mon1; 
}else {
	mon5=""+mon1; 
} 

String[] moviename22=new String[50];
for(int c=0;c<i;c++){
	
String targetDt =date1[c];
String itemPerPage ="10"; 
String key = "257a360ca175e71f65d605e4238a4d90";
KobisOpenAPIRestService service = new KobisOpenAPIRestService(key); 
String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, "","", ""); 
ObjectMapper mapper = new ObjectMapper(); 
HashMap<String, Object> map = mapper.readValue(dailyResponse, HashMap.class);

Iterator<String> mapIter = map.keySet().iterator();
String movie="";
String key2="";
Object value="";
while(mapIter.hasNext()){
key2 = mapIter.next(); 
value = map.get( key2 );
}
movie = value.toString();
System.out.println(movie);
String moviec[]=movie.split("movieNm=");
String moviecc[]=movie.split("openDt=");

int a=0;

for(int con=1;con<moviec.length;con++){
	String moviec2[]=moviec[con].split(",");
a=a+1;
}

String[] moviename=new String[a];
for(int con=1;con<moviec.length;con++){
String moviec2[]=moviec[con].split(",");
String moviecc2[]=moviecc[con].split(",");
String openDTy=moviecc2[0].substring(5, 7);
if(openDTy.equals(mon5)){ //1월이면
	int nn=0;
	moviename22[q]="";
	for(int ad=0;ad<=q;ad++){ //중복있는지 확인한다
		if(moviename22[ad].equals(moviec2[0])){
			nn=1;
		}
	}
	if(nn==0){
		moviename22[q]=moviec2[0];
		System.out.println(moviename22[q]+" "+(q));
		q=q+1;
	}
}
}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/top3.do/../img/common/icon.ico" type="image/x-icon" />
<title>Let's see the movie! : Lovie</title>
</head>
<div>
<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit(this);">
	<table border="1" >
		<tr>
			<td>순위</td>
			<td>영화명</td>
		</tr>
		<%for(int qe=0;qe<q;qe++){ %>
		<tr>
		<td>
		<%=qe %>
		</td>
		<td>
		<%= moviename22[qe]%>
		</td>
		</tr>
		<%} %>
	</table>
	</form>
</div>
</body>
</html>
