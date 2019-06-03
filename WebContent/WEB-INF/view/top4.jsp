<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon"
	href="http://localhost:8080/notice/NoticeList.do/../../img/common/icon.ico"
	type="image/x-icon" />
<link rel="styleseet" type="text/css" href="styles.css"/>
<title>공지사항 : Lovie</title>
<script src="pixi.min.js"></script>
<script type="text/javascript">
	var app = new PIXI.Application({
		width : window.innerWidth,
		height : window.innerHeight
	});
	document.body.appendChild(app.view);

	var img = new PIXI.Sprite.from("movie_image.jpg");
	img.width = window.innerWidth;
	img.height = window.innerHeight;
	app.stage.addChild(img);
</script>
</head>
<body>
</body>
</html>
