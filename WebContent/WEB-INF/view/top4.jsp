<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%
	request.setCharacterEncoding("UTF-8");
	session.setAttribute("url", "/notice/NoticeList.do");
	String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
	String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("USER_NO"));
	System.out.println("ss_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	System.out.println("ss_user_id : " + SESSION_USER_ID);

	List<NoticeDTO> rList = (List<NoticeDTO>) request.getAttribute("rList");
	int count2 = (int) request.getAttribute("count");

	if (rList == null) {
		rList = new ArrayList<NoticeDTO>();

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon"
	href="http://localhost:8080/notice/NoticeList.do/../../img/common/icon.ico"
	type="image/x-icon" />
<link rel="styleseet" type="text/css" href="styles.css"/>
<title>공지사항 : Lovie</title>
<style>
/* 보관용  */
.mas {
	position: absolute;
	color: #000;
	text-align: center;
	width: 101%;
	font-family: 'Lato', sans-serif;
	font-weight: 300;
	position: absolute;
	font-size: 20px;
	margin-top: 12px;
	overflow: hidden;
}

@
-webkit-keyframes ani {from { -webkit-mask-position:00;
	mask-position: 0 0;
}

to {
	-webkit-mask-position: 100% 0;
	mask-position: 100% 0;
}

}
@
keyframes ani {from { -webkit-mask-position:00;
	mask-position: 0 0;
}

to {
	-webkit-mask-position: 100% 0;
	mask-position: 100% 0;
}

}
@
-webkit-keyframes ani2 {from { -webkit-mask-position:100%0;
	mask-position: 100% 0;
}

to {
	-webkit-mask-position: 0 0;
	mask-position: 0 0;
}

}
@
keyframes ani2 {from { -webkit-mask-position:100%0;
	mask-position: 100% 0;
}

to {
	-webkit-mask-position: 0 0;
	mask-position: 0 0;
}
}
</style>
<script src="pixi.min.js"></script>
<script type="text/javascript">
	var app = new PIXI.Application({
		width : window.innerWidth,
		height : window.innerHeight
	});
	document.body.appendChild(app.view);

	var img = new PIXI.Sprite.from("../img/common/Logo.png");
	img.width = window.innerWidth;
	img.height = window.innerHeight;
	app.stage.addChild(img);
	
	depthMap = new PIXI.Sprite.from("pikachu-map.jpg");
	app.stage.addChild(depthMap);
	        
	displacementFilter = new PIXI.filters.DisplacementFilter(depthMap);
	app.stage.filters = [displacementFilter];
	
	window.onmousemove = function(e) {
		  displacementFilter.scale.x = (window.innerWidth / 2 - e.clientX) /20;
		  displacementFilter.scale.y = (window.innerHeight / 2 - e.clientY) /20;
		};
</script>
</head>
<body style="min-width: 1250px; background-color: #f3f3f3;">
</body>
</html>
