<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.InquiryDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%
	List<InquiryDTO> rList = (List<InquiryDTO>) request.getAttribute("rList");
	String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
	int count2 = (int) request.getAttribute("count");

	if (rList == null) {
		rList = new ArrayList<InquiryDTO>();

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 리스트</title>
<script type="text/javascript">
	function doDetail(seq) {
		location.href = "/inquiry/inquiryInfo.do?inq_seq=" + seq;
	}
</script>
<style>
div.framebgt
{
background-image:url('../img/bg/framebgt.png');
}
div.framebgm
{
background-image:url('../img/bg/framebgm.png');
}
div.framebgm1
{
background-image:url('../img/bg/framebgm1.png');
}
div.framebgm2
{
background-image:url('../img/bg/framebgm2.png');
}
div.framebgd
{
background-image:url('../img/bg/framebgd.png');
}
</style>
</head>
<body>
<div class="framebgt">
	<table border="0" width="100%">
		<tr>
			<td align="center"><br> 
			<a href="/inquiry/inquiryList.do">
			<img src="../img/inquiry/inqt.png" />
			</a>
			</td>
		</tr>
	</table>
	</div>
	<div class="framebgm1">
	<table border="0" width="100%">
		<tr>
			<td width="60" align="center"><img src="../img/total/wrin.png" /></td>
			<td width="250" align="center"><img src="../img/total/tit.png" /></td>
			<td width="60" align="center"><img src="../img/total/wriu.png" /></td>
			<td width="90" align="center"><img src="../img/total/wrid.png" /></td>
		</tr>
		<tr>
			<td colspan="4">
				<hr>
			</td>
		</tr>
		</table>
		</div>
		<%
			int a = rList.size();
			int b = 9;
			int c = a / 20;
			int d = a - c * 20;
			int e = rList.size() / 20;

			if (rList.size() > 20) {
				a = 20;
			}
			if (count2 == c) {
				a = d;
			}
			int listcount = 0;
			for (int i = 0; i < a; i++) {
				b--;
				InquiryDTO rDTO = rList.get(count2 * 20 + i);
				if (rDTO == null) {
					rDTO = new InquiryDTO();
				}
				if (CmmUtil.nvl(rDTO.getUser_id()).equals(SESSION_USER_ID) || SESSION_USER_ID.equals("admin")) {
					listcount = listcount + 1;
		%>
		<div class="framebgm2">
		<table border="0" width="100%">
		<tr>
			<td width="13%" align="center">
				<%
					out.print(CmmUtil.nvl(rDTO.getinq_seq()));
				%>
			</td>
			<td width="54%" align="left"><a
				href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getinq_seq())%>');">
					<span style="color: black; font-weight: bold"> <b><%=CmmUtil.nvl(rDTO.getTitle())%></b>
				</span>
			</a></td>
			<td width="60" align="center"><%=CmmUtil.nvl(rDTO.getUser_name())%></td>
			<td width="90" align="center"><%=CmmUtil.nvl(rDTO.getReg_dt())%></td>
		</tr>
		<tr>
			<td colspan="4">
				<hr>
			</td>
		</tr>
		</table>
	</div>
		<%
			}
			}
		%>
	<div class="framebgm">
	<%
		if (SESSION_USER_ID.equals("admin")) {
	%>
	<%
		} else {
	%>
	<table border="0" width="100%">
		<tr>
			<td align="right"><a href="inquiryReg.do"> <img
					src="../img/button/write.png" />
			</a>&nbsp;</td>
		</tr>
	</table>
	<%
		}
	%>
	</div>
	<div class="framebgm">
	<table border="0" width="100%">
		<tr>
			<td align="center">
				<%
					int line = 0;
					if (rList.size() >= 200 && rList.size() <= 1999) {
						c = rList.size() / 200;
					} else if (rList.size() >= 2000 && rList.size() <= 19999) {
						c = rList.size() / 2000;
					} else if (rList.size() >= 20000 && rList.size() <= 199999) {
						c = rList.size() / 20000;
					} else {
						c = rList.size() / 20;
					}
					if (SESSION_USER_ID.equals("admin")) {
						if (count2 / 10 == 0) {
							int q = 1;
							if (rList.size() > 200) {
								q = 10;
							} else {
								q = rList.size() / 20 + 1;
							}
							count2 = count2 + 1;
							for (line = 1; line <= q; line++) {
				%> <%
 	if (count2 == line) {
 %> &nbsp; <a
				href="inquiryList.do?count=<%=line%>"> <span
					style="color: white; background-color: red"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	} else {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>"> <span
					style="color: black"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	}
 %> <%
 	}
 			if (rList.size() > 200) {
 %> &nbsp; <a href="inquiryList.do?count=<%=11%>"> <span
					style="color: black; background-color: gray"> <b>></b>
				</span>
			</a> <%
 	}
 		} else if (count2 / 10 == c) {
 			int color = count2 + 1;
 %> &nbsp; <a href="inquiryList.do?count=<%=count2 / 10 * 10 - 9%>"> <span
					style="color: black; background-color: gray"> <b><</b>
				</span>
			</a> <%
 	for (line = count2 / 10 * 10 + 1; line <= e + 1; line++) {
 %> <%
 	if (color == line) {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>">
					<span style="color: white; background-color: red"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	} else {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>"> <span
					style="color: black"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	}
 %> <%
 	}
 %> <%
 	} else {
 			int color = count2 + 1;
 %> &nbsp; <a href="inquiryList.do?count=<%=count2 / 10 * 10 - 9%>"> <span
					style="color: black; background-color: gray"> <b><</b>
				</span>
			</a> <%
 	for (line = count2 / 10 * 10 + 1; line <= count2 / 10 * 10 + 10; line++) {
 %> <%
 	if (color == line) {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>">
					<span style="color: white; background-color: red"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	} else {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>"> <span
					style="color: black"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	}
 %> <%
 	}
 %> &nbsp; <a href="inquiryList.do?count=<%=count2 / 10 * 10 + 11%>">
					<span style="color: black; background-color: gray"> <b>></b>
				</span>
			</a> <%
 	}
 	} else {

 		//사용자 시점

 		a = listcount;
 		b = 9;
 		c = a / 20;
 		d = a - c * 20;
 		e = listcount / 20;

 		if (listcount > 20) {
 			a = 20;
 		}
 		if (count2 == c) {
 			a = d;
 		}
 		if (listcount >= 200 && listcount <= 1999) {
 			c = listcount / 200;
 		} else if (listcount >= 2000 && listcount <= 19999) {
 			c = listcount / 2000;
 		} else if (listcount >= 20000 && listcount <= 199999) {
 			c = listcount / 20000;
 		} else {
 			c = listcount / 20;
 		}
 		if (count2 / 10 == 0) {
 			int q = 1;
 			if (listcount > 200) {
 				q = 10;
 			} else {
 				q = listcount / 20 + 1;
 			}
 			count2 = count2 + 1;
 			for (line = 1; line <= q; line++) {
 %> <%
 	if (count2 == line) {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>">
					<span style="color: white; background-color: red"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	} else {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>"> <span
					style="color: black"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	}
 %> <%
 	}
 			if (listcount > 200) {
 %> &nbsp; <a href="inquiryList.do?count=<%=11%>"> <span
					style="color: black; background-color: gray"> <b>></b>
				</span>
			</a> <%
 	}
 		} else if (count2 / 10 == c) {
 			int color = count2 + 1;
 %> &nbsp; <a href="inquiryList.do?count=<%=count2 / 10 * 10 - 9%>"> <span
					style="color: black; background-color: gray"> <b><</b>
				</span>
			</a> <%
 	for (line = count2 / 10 * 10 + 1; line <= e + 1; line++) {
 %> <%
 	if (color == line) {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>">
					<span style="color: white; background-color: red"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	} else {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>"> <span
					style="color: black"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	}
 %> <%
 	}
 %> <%
 	} else {
 			int color = count2 + 1;
 %> &nbsp; <a href="inquiryList.do?count=<%=count2 / 10 * 10 - 9%>"> <span
					style="color: black; background-color: gray"> <b><</b>
				</span>
			</a> <%
 	for (line = count2 / 10 * 10 + 1; line <= count2 / 10 * 10 + 10; line++) {
 %> <%
 	if (color == line) {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>">
					<span style="color: white; background-color: red"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	} else {
 %> &nbsp; <a href="inquiryList.do?count=<%=line%>"> <span
					style="color: black"> <b> <%=line%>
					</b>
				</span>
			</a> <%
 	}
 %> <%
 	}
 %> &nbsp; <a href="inquiryList.do?count=<%=count2 / 10 * 10 + 11%>">
					<span style="color: black; background-color: gray"> <b>></b>
				</span>
			</a> <%
 	}
 	}
 %>
			</td>
		</tr>
	</table>
</div>
			<div class="framebgd">
   <table>
   <tr>
   <td>
   <br>
   </td>
   </tr>
   </table>
   </div>
</body>
</html>