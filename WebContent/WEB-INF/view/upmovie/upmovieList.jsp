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
	session.setAttribute("url", "/upmovie/upmovieList.do");
	String SESSION_USER_ID =CmmUtil.nvl((String) session.getAttribute("USER_ID"));
	String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
	String SES_year = CmmUtil.nvl((String) session.getAttribute("upmyear"));
	String SES_month = CmmUtil.nvl((String) session.getAttribute("upmmonth"));
	System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	System.out.println("ss_user_id : " + SESSION_USER_ID);
	
	int count = (int)request.getAttribute("count");
	System.out.println("count : " + count);

	Date dt= new Date(); 
	dt.setDate(dt.getDate()-4);
	int year3=dt.getYear()+1900;
	int mon3=dt.getMonth()+1;
	int day3=dt.getDate();
	
	if(SES_year.isEmpty()){
		SES_year=year3+"";
	}
	if(SES_month.isEmpty()){
		SES_month=mon3+"";
	}
	
	int year1=Integer.parseInt(SES_year);
	int mon1=Integer.parseInt(SES_month);
	int day1=1;
	
	int day4=28;
	int i=0;
	int n=mon1+1;

	String month="";
	String day2="";

	day4=28;
	String[] date1=new String[7];

	for(mon1=Integer.parseInt(SES_month);mon1<=n;mon1++){
		if(mon1==n){
			day4=1;
		}
		if(Integer.parseInt(SES_year)==year3&&Integer.parseInt(SES_month)==mon3){
			n=mon1;
			day4=day3;
		}
		
		for(day1=1;day1<=day4;day1=day1+5){
			
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
			date1[i]=year1+month+day2;
			System.out.println(date1[i]+" "+i);
			i++;
		}
	}

	mon1=Integer.parseInt(SES_month);
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
	if(moviecc2[0].equals(" ")){
		
	}else{
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
	if(q>count*9+9){
		break;
	}
	}
	}
	}
	i=1;
	String moviecode="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/upmovie/upmovieList.do/../../img/common/icon.ico" type="image/x-icon" />
<title><%=SES_year %>년 <%=SES_month %>월 추천영화 : Lovie</title>
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

function doSubmit2(s) {
	var now = new Date();
	now.setDate(now.getDate()-1);
	var nowY = now.getFullYear();
	var nowM = now.getMonth()+1;
	   if(s.year.value == nowY){
		   if(s.month.value>nowM){
	      alert("아직 개봉되지 않은 날자입니다.");
	      s.month.focus();
	      return false;
		   }
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
a:link { text-decoration: none;}
 a:visited {text-decoration: none;}
 a:hover { text-decoration: none;}
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
      
input {
        vertical-align: middle;
      }
      input.img-button1 {
        background: url( "../img/upmovie/date.png" ) no-repeat;
        border: none;
        height: 22px;
        width: 76px;
        cursor: pointer;
      }
</style>

</head>
<body background="../img/top/bg.png">
<font face='Segoe UI' style=' line-height:1.4'>
<div>
	<table border="0" height="1510px" width="1800px">
<form name="f" method="post" action="/user/user_login_proc.do" onsubmit="return doSubmit(this);">
		<tr>
			<td width="48px" height="167px"></td>
			<td colspan="4" align="left" width="1500px">
			
			<a href="/top.do">
				<img src="../img/common/Logo.png"/>
			</a>&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/notice/NoticeList.do"
				>
				<img src="../img/top/notice.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;
			
			<a
				href="/newmovie/newmovieList.do" > 
				<img src="../img/top/newmo.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/upmovie/upmovieList.do" > 
				<img src="../img/top/upmo.png"/>
			</a>  &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/bbm/bbmList.do" > 
				<img src="../img/top/bbm.png"/>
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<a
				href="/inquiry/inquiryList.do" > 
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
				<a href="/user/manageList.do" > 
				<span style=" font: 1.5em Georgia, serif ;">
				<%
				out.print(SESSION_USER_ID);
				%> 
				</span> 
			</a>
			 <img src="../img/top/inhi.png"/>
				<%}else{%>
				<a href="/user/userInfo.do" > 
				<span style=" font: 1.5em Georgia, serif ;">
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
			</form>
			<tr>
			<td height="25px">
			</td>
			<%if (SESSION_USER_ID.equals("")) {%>
			<td colspan="2" align="left" width="245px" >
						&nbsp;
				<a href="/user/user_join2.do" >
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
			<td>
			<form name="s" method="post" action="/upmovie/upmovieDate.do" onsubmit="return doSubmit2(this);">
			<table>
			<tr>
			<td>
			<select name="year">
			<%for(int cyear=year3;cyear>=2010;cyear--) {%>
			 <option value="<%=cyear%>" 
			 <%if(cyear==Integer.parseInt(SES_year)){%>
			 selected="selected"
			 <%} %>
			 ><%=cyear%></option>
			 <%} %>
            </select>
            <img src="../img/upmovie/year.png"/>
            <select name="month">
			<%for(int cmonth=1;cmonth<=12;cmonth++) {%>
			 <option value="<%=cmonth%>"
			 <%if(cmonth==Integer.parseInt(SES_month)){%>
			 selected="selected"
			 <%} %>
			 ><%=cmonth%></option>
			 <%} %>
            </select>
            <img src="../img/upmovie/month.png"/>
            <input type="submit" class="img-button1" value=" "/>
            
            </td>
            </tr>
            </table>
            </form>
			</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>
			<%if(count>=1) {%>
			<a href="upmovieList.do?count=<%=count-1%>">
   			<span style=" color: white">
   			<b>
   			<
   			</b>
   			</span>
   			</a>
			<%} %>
			<br>
				<h1>
					<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
				</h1>
			</td>
			<td valign="top">
			<table  border="0">
			<tr>
			
			<!-- 반복문 시작  -->
			<%
			int count2=9+count*9;
			if(count2>=q){
				count2=q;
			}
			for(int qe=count*9;qe<count2;qe++){ %>
			<%if(i<=3){ %>
				<td width="400px" align="center" height="350px" valign="top">
				<%
				System.out.println(moviename22[qe]+" "+year1);
				if(moviename22[qe].contains("%")){
			         moviename22[qe]=moviename22[qe].replaceAll("%", "%25");
			      }
			      if(moviename22[qe].contains("&")){
			         moviename22[qe]=moviename22[qe].replaceAll("&", "%26");
			      }
				if(moviename22[qe].equals("헨젤과 그레텔: 마녀 사냥꾼 3D")){
					moviename22[qe]="헨젤과 그레텔: 마녀 사냥꾼";
				}
				if(moviename22[qe].equals("비정한 도시 감독판")){
					moviename22[qe]="비정한 도시";
				}
				if(moviename22[qe].equals("반지의 제왕 : 두개의 탑 (확장판)")){
					moviename22[qe]="반지의 제왕 : 두개의 탑";
				}
				if(moviename22[qe].equals("반지의 제왕 : 반지원정대 (확장판)")){
					moviename22[qe]="반지의 제왕 : 반지원정대";
				}
				if(moviename22[qe].equals("반지의 제왕 : 왕의 귀환 (확장판)")){
					moviename22[qe]="반지의 제왕 : 왕의 귀환";
				}
				String movienameback="";
				if(moviename22[qe].equals("딥")||moviename22[qe].equals("더 서클")||
						moviename22[qe].equals("더 보이")||moviename22[qe].equals("홈")||
						moviename22[qe].equals("레전드")||moviename22[qe].equals("스파이")||
						moviename22[qe].equals("신들의 전쟁")||moviename22[qe].equals("블라인드")||moviename22[qe].equals("레지던트")||
					      moviename22[qe].equals("레드")||moviename22[qe].equals("골든 슬럼버")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+year1;
				}
				if(moviename22[qe].equals("라이언")||moviename22[qe].equals("그녀")||
						moviename22[qe].equals("슈퍼히어로")||moviename22[qe].equals("눈의 여왕")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+(year1-1);
				}
				 if(moviename22[qe].equals("비지터")||moviename22[qe].equals("파라노말 액티비티")) {
			         moviename22[qe]=moviename22[qe]+"2007";
			      }

				if(moviename22[qe].equals("노트북")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+2004;
				}
				if(moviename22[qe].equals("러브 액츄얼리")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+2003;
				}
				if(moviename22[qe].equals("마스터 ")&&year1==2013){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+(year1-1);
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				if(moviename22[qe].equals(movienameback+year1)||moviename22[qe].equals(movienameback+(year1-1))||
						moviename22[qe].equals(movienameback+2004)||moviename22[qe].equals(movienameback+2003)  ||moviename22[qe].equals(movienameback+2007)){
					moviename22[qe]=movienameback;
				}
				 if(moviename22[qe].contains("%25")){
			         moviename22[qe]=moviename22[qe].replaceAll("%25", "%");
			      }
			      if(moviename22[qe].contains("%26")){
			         moviename22[qe]=moviename22[qe].replaceAll("%26", "&");
			      }
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
						if(moviename22[qe].equals("데블")){
				            tj=7;
				         }
					}
					if(wpq<=con5[0].length()||moviename22[qe].equals("가디언즈 오브 갤럭시")||moviename22[qe].equals("개구쟁이 스머프")) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1&&cnn2>=year1-4){
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==9||moviename22[qe].equals("패션왕")||moviename22[qe].equals("콜드 워")||
							moviename22[qe].equals("그것")||moviename22[qe].equals("더 플랜")||moviename22[qe].equals("링스")||
							moviename22[qe].equals("눈길")||moviename22[qe].equals("그레이트 월")||moviename22[qe].equals("트롤")||
					         moviename22[qe].equals("선생님의 일기")||moviename22[qe].equals("대결")||moviename22[qe].equals("빅")||
					         moviename22[qe].equals("부활")||moviename22[qe].equals("괴물의 아이")||moviename22[qe].equals("카트")||
					         moviename22[qe].equals("이브 생 로랑")||moviename22[qe].equals("살인자")||moviename22[qe].equals("링컨")||
					         moviename22[qe].equals("더 자이언트")||moviename22[qe].equals("용의자X")||moviename22[qe].equals("나는 왕이로소이다")||
					         moviename22[qe].equals("50/50")||moviename22[qe].equals("레지던트")||moviename22[qe].equals("발렌타인 데이")||
					         moviename22[qe].equals("공주와 개구리")){
						break;
					}
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				String[] moviecodeout=linkHref.split("code=");
				moviecode=moviecodeout[1];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<a href="/movieInfo.do?moviecode=<%=moviecode%>">
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				</a>
				<br>
				<a href="/movieInfo.do?moviecode=<%=moviecode%>">
				<span style=" color: white;font-weight:bold">
				<%= moviename22[qe]%>
				</span>
				</a>
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
				if(moviename22[qe].equals("비정한 도시 감독판")){
					moviename22[qe]="비정한 도시";
				}
				if(moviename22[qe].equals("반지의 제왕 : 두개의 탑 (확장판)")){
					moviename22[qe]="반지의 제왕 : 두개의 탑";
				}
				if(moviename22[qe].equals("반지의 제왕 : 반지원정대 (확장판)")){
					moviename22[qe]="반지의 제왕 : 반지원정대";
				}
				if(moviename22[qe].equals("반지의 제왕 : 왕의 귀환 (확장판)")){
					moviename22[qe]="반지의 제왕 : 왕의 귀환";
				}
				String movienameback="";
				if(moviename22[qe].equals("딥")||moviename22[qe].equals("더 서클")||
						moviename22[qe].equals("더 보이")||moviename22[qe].equals("홈")||
						moviename22[qe].equals("레전드")||moviename22[qe].equals("스파이")||
						moviename22[qe].equals("신들의 전쟁")||moviename22[qe].equals("블라인드")||moviename22[qe].equals("레지던트")||
					      moviename22[qe].equals("레드")||moviename22[qe].equals("골든 슬럼버")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+year1;
				}
				if(moviename22[qe].equals("라이언")||moviename22[qe].equals("그녀")||
						moviename22[qe].equals("슈퍼히어로")||moviename22[qe].equals("눈의 여왕")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+(year1-1);
				}
				 if(moviename22[qe].equals("비지터")||moviename22[qe].equals("파라노말 액티비티")) {
			         moviename22[qe]=moviename22[qe]+"2007";
			      }

				if(moviename22[qe].equals("노트북")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+2004;
				}
				if(moviename22[qe].equals("러브 액츄얼리")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+2003;
				}
				if(moviename22[qe].equals("마스터 ")&&year1==2013){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+(year1-1);
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				if(moviename22[qe].equals(movienameback+year1)||moviename22[qe].equals(movienameback+(year1-1))||
						moviename22[qe].equals(movienameback+2004)||moviename22[qe].equals(movienameback+2003)  ||moviename22[qe].equals(movienameback+2007)){
					moviename22[qe]=movienameback;
				}
				 if(moviename22[qe].contains("%25")){
			         moviename22[qe]=moviename22[qe].replaceAll("%25", "%");
			      }
			      if(moviename22[qe].contains("%26")){
			         moviename22[qe]=moviename22[qe].replaceAll("%26", "&");
			      }
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
						if(moviename22[qe].equals("데블")){
				            tj=7;
				         }
					}
					if(wpq<=con5[0].length()||moviename22[qe].equals("가디언즈 오브 갤럭시")||moviename22[qe].equals("개구쟁이 스머프")) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1&&cnn2>=year1-4){
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==9||moviename22[qe].equals("패션왕")||moviename22[qe].equals("콜드 워")||
							moviename22[qe].equals("그것")||moviename22[qe].equals("더 플랜")||moviename22[qe].equals("링스")||
							moviename22[qe].equals("눈길")||moviename22[qe].equals("그레이트 월")||moviename22[qe].equals("트롤")||
					         moviename22[qe].equals("선생님의 일기")||moviename22[qe].equals("대결")||moviename22[qe].equals("빅")||
					         moviename22[qe].equals("부활")||moviename22[qe].equals("괴물의 아이")||moviename22[qe].equals("카트")||
					         moviename22[qe].equals("이브 생 로랑")||moviename22[qe].equals("살인자")||moviename22[qe].equals("링컨")||
					         moviename22[qe].equals("더 자이언트")||moviename22[qe].equals("용의자X")||moviename22[qe].equals("나는 왕이로소이다")||
					         moviename22[qe].equals("50/50")||moviename22[qe].equals("레지던트")||moviename22[qe].equals("발렌타인 데이")||
					         moviename22[qe].equals("공주와 개구리")){
						break;
					}
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				String[] moviecodeout=linkHref.split("code=");
				moviecode=moviecodeout[1];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<a href="/movieInfo.do?moviecode=<%=moviecode%>">
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				</a>
				<br>
				<a href="/movieInfo.do?moviecode=<%=moviecode%>">
				<span style=" color: white;font-weight:bold">
				<%= moviename22[qe]%>
				</span>
				</a>
				</td>
				<%}else if(i>6&&i<10){ %>
				<%if(i==7){%>
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
				if(moviename22[qe].equals("비정한 도시 감독판")){
					moviename22[qe]="비정한 도시";
				}
				if(moviename22[qe].equals("반지의 제왕 : 두개의 탑 (확장판)")){
					moviename22[qe]="반지의 제왕 : 두개의 탑";
				}
				if(moviename22[qe].equals("반지의 제왕 : 반지원정대 (확장판)")){
					moviename22[qe]="반지의 제왕 : 반지원정대";
				}
				if(moviename22[qe].equals("반지의 제왕 : 왕의 귀환 (확장판)")){
					moviename22[qe]="반지의 제왕 : 왕의 귀환";
				}
				String movienameback="";
				if(moviename22[qe].equals("딥")||moviename22[qe].equals("더 서클")||
						moviename22[qe].equals("더 보이")||moviename22[qe].equals("홈")||
						moviename22[qe].equals("레전드")||moviename22[qe].equals("스파이")||
						moviename22[qe].equals("신들의 전쟁")||moviename22[qe].equals("블라인드")||moviename22[qe].equals("레지던트")||
					      moviename22[qe].equals("레드")||moviename22[qe].equals("골든 슬럼버")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+year1;
				}
				if(moviename22[qe].equals("라이언")||moviename22[qe].equals("그녀")||
						moviename22[qe].equals("슈퍼히어로")||moviename22[qe].equals("눈의 여왕")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+(year1-1);
				}
				 if(moviename22[qe].equals("비지터")||moviename22[qe].equals("파라노말 액티비티")) {
			         moviename22[qe]=moviename22[qe]+"2007";
			      }

				if(moviename22[qe].equals("노트북")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+2004;
				}
				if(moviename22[qe].equals("러브 액츄얼리")){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+2003;
				}
				if(moviename22[qe].equals("마스터 ")&&year1==2013){
					movienameback=moviename22[qe];
					moviename22[qe]=moviename22[qe]+(year1-1);
				}
				String link = "https://movie.naver.com/movie/search/result.nhn?section=movie&query="+moviename22[qe]+"&section=all&ie=utf8";
				if(moviename22[qe].equals(movienameback+year1)||moviename22[qe].equals(movienameback+(year1-1))||
						moviename22[qe].equals(movienameback+2004)||moviename22[qe].equals(movienameback+2003)  ||moviename22[qe].equals(movienameback+2007)){
					moviename22[qe]=movienameback;
				}
				 if(moviename22[qe].contains("%25")){
			         moviename22[qe]=moviename22[qe].replaceAll("%25", "%");
			      }
			      if(moviename22[qe].contains("%26")){
			         moviename22[qe]=moviename22[qe].replaceAll("%26", "&");
			      }
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
						if(moviename22[qe].equals("데블")){
				            tj=7;
				         }
					}
					if(wpq<=con5[0].length()||moviename22[qe].equals("가디언즈 오브 갤럭시")||moviename22[qe].equals("개구쟁이 스머프")) {
						String con6[]=conn.split("year=");
						int cnn2=Integer.parseInt(con6[1].substring(0,4));
						if(cnn2<=year1&&cnn2>=year1-4){
						wpq=con5[0].length();
						System.out.println(wpq);
						png3[0]=con3[0].substring(1,con3[0].length()-1);
						}
					}
					tj=tj+1;
					if(tj==9||moviename22[qe].equals("패션왕")||moviename22[qe].equals("콜드 워")||
							moviename22[qe].equals("그것")||moviename22[qe].equals("더 플랜")||moviename22[qe].equals("링스")||
							moviename22[qe].equals("눈길")||moviename22[qe].equals("그레이트 월")||moviename22[qe].equals("트롤")||
					         moviename22[qe].equals("선생님의 일기")||moviename22[qe].equals("대결")||moviename22[qe].equals("빅")||
					         moviename22[qe].equals("부활")||moviename22[qe].equals("괴물의 아이")||moviename22[qe].equals("카트")||
					         moviename22[qe].equals("이브 생 로랑")||moviename22[qe].equals("살인자")||moviename22[qe].equals("링컨")||
					         moviename22[qe].equals("더 자이언트")||moviename22[qe].equals("용의자X")||moviename22[qe].equals("나는 왕이로소이다")||
					         moviename22[qe].equals("50/50")||moviename22[qe].equals("레지던트")||moviename22[qe].equals("발렌타인 데이")||
					         moviename22[qe].equals("공주와 개구리")){
						break;
					}
					
				}
				
				String linkHref = "https://movie.naver.com/"+png3[0];
				String[] moviecodeout=linkHref.split("code=");
				moviecode=moviecodeout[1];
				Document doc2 = Jsoup.connect(linkHref).get();
				Elements pngs2 = doc2.select("div.mv_info_area div.poster a img");
				
				String linkHref2 = pngs2.attr("src");
				i=i+1;
				%>
				<a href="/movieInfo.do?moviecode=<%=moviecode%>">
				<img src="<%=linkHref2%>" border="2px" class="poster"/>
				</a>
				<br>
				<a href="/movieInfo.do?moviecode=<%=moviecode%>">
				<span style=" color: white;font-weight:bold">
				<%= moviename22[qe]%>
				</span>
				</a>
				</td>
				<%} %>
				<%} %>
				</tr>
			</table>
			</td>
			<td>
			<%if(q>(count+1)*9) {%>
			<a href="upmovieList.do?count=<%=count+1%>">
   			<span style=" color: white">
   			<b>
   			>
   			</b>
   			</span>
   			</a>
			<%} %>
			<br>
			<img src="../img/bg/sidebg.png"/></td>
		</tr>
	</table>
</div>
</font>
</body>
</html>
