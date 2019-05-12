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
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.Random" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
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
	String moviec2[]=moviec[con].split(", openDt=");
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
	i=1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/top.do/../img/common/icon.ico" type="image/x-icon" />
<title>Let's see the movie! : Lovie</title>
<script type="text/javascript">
function doSubmit(f) {
   if(f.user_id.value == ""){
      alert("아이디 또는 비밀번호를 입력해주세요.");
      f.user_id.focus();
      return false;
   }
   if(f.pwd1.value == ""){
      alert("아이디 또는 비밀번호를 입력해주세요.");
      f.pwd1.focus();
      return false;
   }
}
function doId(){
    location.href="/user/user_login_proc.do";
}
function doKeyIdPw(event) {
	   event = event || window.event;
	   var keyID = (event.which) ? event.which : event.KeyCode;
	   
	   if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || (keyID >= 65 && keyID <= 90) || keyID==8 || keyID==37 || keyID==39 || keyID==9){
	      return true;
	   }else{
	      return false;
	   }
	}

</script>
<style>
input {
        vertical-align: middle;
      }
      input.img-button {
        background: url( "../img/button/login.png" ) no-repeat;
        border: none;
        height: 45px;
        width: 58px;
        cursor: pointer;
      }
      img.poster{
      border:2px solid gray;
      }
</style>

</head>
<body background="../img/top/bg.png">
<div>
<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit(this);">
	<table border="0" height="1510px" width="1800px">
		<tr>
			<td width="48px" height="167px"></td>
			<td colspan="4" align="right" width="1500px">
			
			<a href="/top.do">
				<img src="../img/common/Logo.png"/>
			</a>&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/notice/NoticeList.do"
				target="ifrMain">
				<img src="../img/top/notice.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
			
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/newmo.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/upmo.png"/>
			</a>  &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" target="ifrMain"> 
				<img src="../img/top/bbm.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/inquiry/inquiryList.do" target="ifrMain"> 
				<img src="../img/top/inq.png"/>
			</a>
			<br>
			</td>
		</tr>
		<tr>
			<td height="50px">
				<img src="../img/bg/rp.png"/>
			</td>
			<td align="right" valign="top" width="180">
				<%if (SESSION_USER_ID.equals("")) {%>		
			<img src="../img/top/Id.png"/> &nbsp;
			
			 <input type="text" name="user_id" maxlength="20"
				style="width: 110px;" onkeydown="return doKeyIdPw(event)"/>
				
				<br>
				
				<img src="../img/top/pw.png"/>&nbsp;
			<input type="password" name="pwd1" maxlength="20" style="width:110px;" onkeydown="return doKeyIdPw(event)"/>	
				<br>
				<% } else if(SESSION_USER_ID.equals("admin")) { %> 
				<a href="/user/manageList.do" target="ifrMain"> 
				<span style=" font: italic 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
				<%}else{%>
				<a href="/user/userInfo.do" target="ifrMain"> 
				<span style=" font: italic 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
			 			 <%}%>
			 			 </td>
			 <td width="120px">
			<%if (SESSION_USER_ID.equals("")) {%>	 
			<input type="submit" class="img-button" value=" "/>
			<%}else{ %>
			<img src="../img/top/loginss.png"/>
			<%} %>
			</td>
			<td>
			</td>
			</tr>
			<tr>
			<td height="25px">
			</td>
			<%if (SESSION_USER_ID.equals("")) {%>
			<td colspan="2" align="left" width="245px" >
						&nbsp;
				<a href="/user/user_join2.do" target="ifrMain">
				<img src="../img/top/join.png"/>
				</a>
				<a href="/user/user_id_search.do" onClick="window.open('/user/user_id_search.do','아이디 찾기','width=470, height=226, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
				<img src="../img/user/userjoin/idf.png"/>
				</a>
				<a href="/user/user_pw_search.do" onClick="window.open('/user/user_pw_search.do','비밀번호 찾기','width=470, height=366, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
				<img src="../img/top/pwf.png"/>
				</a> 
				<% } else { %> 
				<td colspan="2" align="center" width="245px" >
				<a href="/user/user_logout.do" >
			 <img src="../img/top/logout.png"/>
			 </a>
			 			 &nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;
			 <%}%>
				</td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>
				<h1>
					<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
				</h1>
			</td>
			<td valign="top">
			<table  border="0">
			<tr>
			<%for(int qe=0;qe<q;qe++){ %>
			<%if(i<=3){ %>
				<td width="400px" align="center" height="350px" valign="top">
				<%
				if(moviename22[qe].contains("%")){
					String moviec3[]=moviename22[qe].split("%");
					moviename22[qe]="";
					for(int hk=0;hk<moviec3.length;hk++){
						if(hk==moviec3.length-1){
							moviename22[qe]=moviename22[qe]+moviec3[hk];
						}else{
						moviename22[qe]=moviename22[qe]+moviec3[hk]+"%25";
						}
						if(moviec3.length-1==0) {
							moviename22[qe]=moviec3[hk]+"%25";
						}
					}
				}
				if(moviename22[qe].equals("헨젤과 그레텔: 마녀 사냥꾼 3D")){
					moviename22[qe]="헨젤과 그레텔: 마녀 사냥꾼";
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				System.out.println(link);
				Document doc = Jsoup.connect(link).get();
				
				Elements pngs = doc.select("ul.search_list_1 li dl");
				
				String[] png3=new String[1];
				
				int tj=0;
				int wpq=0;
				for(Element pngs2 : pngs) {
					String con=pngs2.text();
					String con2[]=pngs2.toString().split("href=");
					
					String con3[]=con2[1].split(">");
					String conn=pngs2.toString();
					String con4[]=conn.split("<em class=\""+"cuser_cnt"+"\">");
					String con5[]=con4[1].split("</em>");
					
					if(tj==0) {
						wpq=con5[0].length();
						png3[0]=con3[0].substring(1,con3[0].length()-1);
					}
					if(wpq<=con5[0].length()) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1){
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==8){
						break;
					}
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				<br><span style=" color: white;font-weight:bold">
				
				<%= moviename22[qe]%>
				</span>
				</td>
				<%}else if(i>3&&i<7){
				if(i==4){%>
				</tr>
				<tr>
				<%} %>
				<td width="400px" align="center" height="450px" valign="top">
				<br><br><br><br>
				<%
				System.out.println(moviename22[qe]+" "+year1);
				if(moviename22[qe].contains("%")){
					String moviec3[]=moviename22[qe].split("%");
					moviename22[qe]="";
					for(int hk=0;hk<moviec3.length;hk++){
						if(hk==moviec3.length-1){
							moviename22[qe]=moviename22[qe]+moviec3[hk];
						}else{
						moviename22[qe]=moviename22[qe]+moviec3[hk]+"%25";
						}
						if(moviec3.length-1==0) {
							moviename22[qe]=moviec3[hk]+"%25";
						}
					}
				}
				if(moviename22[qe].equals("헨젤과 그레텔: 마녀 사냥꾼 3D")){
					moviename22[qe]="헨젤과 그레텔: 마녀 사냥꾼";
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				System.out.println(link);
				Document doc = Jsoup.connect(link).get();

				Elements pngs = doc.select("ul.search_list_1 li dl");
				
				String[] png3=new String[1];
				
				int tj=0;
				int wpq=0;
				for(Element pngs2 : pngs) {
					String con=pngs2.text();
					String con2[]=pngs2.toString().split("href=");
					
					String con3[]=con2[1].split(">");
					String conn=pngs2.toString();
					String con4[]=conn.split("<em class=\""+"cuser_cnt"+"\">");
					String con5[]=con4[1].split("</em>");
					
					if(tj==0) {
						wpq=con5[0].length();
						png3[0]=con3[0].substring(1,con3[0].length()-1);
					}
					if(wpq<=con5[0].length()) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1){
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==8){
						break;
					}
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				<br><span style=" color: white;font-weight:bold">
				<%= moviename22[qe]%>
				</span>
				</td>
				<%}else if(i>6&&i<10){ %>
				<%if(i==7){%>
				</tr>
				<tr>
				<%} %>
				<td width="400px" align="center" height="460px" valign="top">
				<br><br><br>
				<%
				System.out.println(moviename22[qe]+" "+year1);
				if(moviename22[qe].contains("%")){
					String moviec3[]=moviename22[qe].split("%");
					moviename22[qe]="";
					for(int hk=0;hk<moviec3.length;hk++){
						if(hk==moviec3.length-1){
							moviename22[qe]=moviename22[qe]+moviec3[hk];
						}else{
						moviename22[qe]=moviename22[qe]+moviec3[hk]+"%25";
						}
						if(moviec3.length-1==0) {
							moviename22[qe]=moviec3[hk]+"%25";
						}
					}
				}
				if(moviename22[qe].equals("헨젤과 그레텔: 마녀 사냥꾼 3D")){
					moviename22[qe]="헨젤과 그레텔: 마녀 사냥꾼";
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				System.out.println(link);
				Document doc = Jsoup.connect(link).get();

				Elements pngs = doc.select("ul.search_list_1 li dl");
				
				String[] png3=new String[1];
				
				int tj=0;
				int wpq=0;
				for(Element pngs2 : pngs) {
					String con=pngs2.text();
					String con2[]=pngs2.toString().split("href=");
					
					String con3[]=con2[1].split(">");
					String conn=pngs2.toString();
					String con4[]=conn.split("<em class=\""+"cuser_cnt"+"\">");
					String con5[]=con4[1].split("</em>");
					
					if(tj==0) {
						wpq=con5[0].length();
						png3[0]=con3[0].substring(1,con3[0].length()-1);
					}
					if(wpq<=con5[0].length()) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1){
							
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==8){
						break;
					}
					
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				<br><span style=" color: white;font-weight:bold">
				<%= moviename22[qe]%>
				</span>
				</td>
				<%}else if(i>9&&i<13){ %>
				<%if(i==10){%>
				</tr>
				<tr>
				<%} %>
				<td width="400px" align="center" height="460px" valign="top">
				<br><br><br>
				<%
				System.out.println(moviename22[qe]+" "+year1);
				if(moviename22[qe].contains("%")){
					String moviec3[]=moviename22[qe].split("%");
					moviename22[qe]="";
					for(int hk=0;hk<moviec3.length;hk++){
						if(hk==moviec3.length-1){
							moviename22[qe]=moviename22[qe]+moviec3[hk];
						}else{
						moviename22[qe]=moviename22[qe]+moviec3[hk]+"%25";
						}
						if(moviec3.length-1==0) {
							moviename22[qe]=moviec3[hk]+"%25";
						}
					}
				}
				if(moviename22[qe].equals("헨젤과 그레텔: 마녀 사냥꾼 3D")){
					moviename22[qe]="헨젤과 그레텔: 마녀 사냥꾼";
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				System.out.println(link);
				Document doc = Jsoup.connect(link).get();

				Elements pngs = doc.select("ul.search_list_1 li dl");
				
				String[] png3=new String[1];
				
				int tj=0;
				int wpq=0;
				for(Element pngs2 : pngs) {
					String con=pngs2.text();
					String con2[]=pngs2.toString().split("href=");
					
					String con3[]=con2[1].split(">");
					String conn=pngs2.toString();
					String con4[]=conn.split("<em class=\""+"cuser_cnt"+"\">");
					String con5[]=con4[1].split("</em>");
					
					if(tj==0) {
						wpq=con5[0].length();
						png3[0]=con3[0].substring(1,con3[0].length()-1);
					}
					if(wpq<=con5[0].length()) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1){
							
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==8){
						break;
					}
					
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				<br><span style=" color: white;font-weight:bold">
				<%= moviename22[qe]%>
				</span>
				</td>
				<%}else if(i>12&&i<16){ %>
				<%if(i==13){%>
				</tr>
				<tr>
				<%} %>
				<td width="400px" align="center" height="420px" valign="top">
				<br><br><br>
				<%
				System.out.println(moviename22[qe]+" "+year1);
				if(moviename22[qe].contains("%")){
					String moviec3[]=moviename22[qe].split("%");
					moviename22[qe]="";
					for(int hk=0;hk<moviec3.length;hk++){
						if(hk==moviec3.length-1){
							moviename22[qe]=moviename22[qe]+moviec3[hk];
						}else{
						moviename22[qe]=moviename22[qe]+moviec3[hk]+"%25";
						}
						if(moviec3.length-1==0) {
							moviename22[qe]=moviec3[hk]+"%25";
						}
					}
				}
				if(moviename22[qe].equals("헨젤과 그레텔: 마녀 사냥꾼 3D")){
					moviename22[qe]="헨젤과 그레텔: 마녀 사냥꾼";
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				System.out.println(link);
				Document doc = Jsoup.connect(link).get();

				Elements pngs = doc.select("ul.search_list_1 li dl");
				
				String[] png3=new String[1];
				
				int tj=0;
				int wpq=0;
				for(Element pngs2 : pngs) {
					String con=pngs2.text();
					String con2[]=pngs2.toString().split("href=");
					
					String con3[]=con2[1].split(">");
					String conn=pngs2.toString();
					String con4[]=conn.split("<em class=\""+"cuser_cnt"+"\">");
					String con5[]=con4[1].split("</em>");
					
					if(tj==0) {
						wpq=con5[0].length();
						png3[0]=con3[0].substring(1,con3[0].length()-1);
					}
					if(wpq<=con5[0].length()) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1){
							
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==8){
						break;
					}
					
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				<br><span style=" color: white;font-weight:bold">
				<%= moviename22[qe]%>
				</span>
				</td>
				<%}else if(i>15&&i<19){ %>
				<%if(i==16){%>
				</tr>
				<tr>
				<%} %>
				<td width="400px" align="center" height="430px" valign="top">
				<br><br><br>
				<%
				System.out.println(moviename22[qe]+" "+year1);
				if(moviename22[qe].contains("%")){
					String moviec3[]=moviename22[qe].split("%");
					moviename22[qe]="";
					for(int hk=0;hk<moviec3.length;hk++){
						if(hk==moviec3.length-1){
							moviename22[qe]=moviename22[qe]+moviec3[hk];
						}else{
						moviename22[qe]=moviename22[qe]+moviec3[hk]+"%25";
						}
						if(moviec3.length-1==0) {
							moviename22[qe]=moviec3[hk]+"%25";
						}
					}
				}
				if(moviename22[qe].equals("헨젤과 그레텔: 마녀 사냥꾼 3D")){
					moviename22[qe]="헨젤과 그레텔: 마녀 사냥꾼";
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				System.out.println(link);
				Document doc = Jsoup.connect(link).get();

				Elements pngs = doc.select("ul.search_list_1 li dl");
				
				String[] png3=new String[1];
				
				int tj=0;
				int wpq=0;
				for(Element pngs2 : pngs) {
					String con=pngs2.text();
					String con2[]=pngs2.toString().split("href=");
					
					String con3[]=con2[1].split(">");
					String conn=pngs2.toString();
					String con4[]=conn.split("<em class=\""+"cuser_cnt"+"\">");
					String con5[]=con4[1].split("</em>");
					
					if(tj==0) {
						wpq=con5[0].length();
						png3[0]=con3[0].substring(1,con3[0].length()-1);
					}
					if(wpq<=con5[0].length()) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1){
							
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==8){
						break;
					}
					
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				<br><span style=" color: white;font-weight:bold">
				<%= moviename22[qe]%>
				</span>
				</td>
				<%} %>
				<%} %>
				</tr>
			</table>
			</td>
			<td><img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>
