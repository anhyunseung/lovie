<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%
   //전달받은 메시지
   String videosrc = CmmUtil.nvl((String) request.getAttribute("videosrc"));
System.out.print(videosrc);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://localhost:8080/MsgToList.do/../../img/common/icon.ico" type="image/x-icon" />
<title>비디오 : Lovie</title>
<script type="text/javascript">
</script>
</head>
<body>
<iframe width="500" height="340" src="https://www.youtube.com/embed/<%=videosrc %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<link
	href="http://static.plaync.co.kr/bns_v2/common/css/index-f2p.css?20190314"
	rel="stylesheet" type="text/css" media="screen">
	<script src="http://static.plaync.co.kr/common/js/lib/jquery_171_min.js"
	type="text/javascript"></script>
	<script
			src="http://static.plaync.co.kr/bns_v2/common/js/jquery.parallax.js"></script>
						<style type="text/css">
@charset "UTF-8"; 

[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak,
	.x-ng-cloak {
	display: none;
}

ng\:form {
	display: block;
}
</style>
						<script type="text/javascript">
					//<![CDATA[
					menuA = 0;
					menuB = 0;
					showNavi(menuA, menuB);
					clientDownload();
					//]]>
				</script>
						<div class="promotionPosiWrap">
			<section class="mainRollBanner">
			<ul class="mainRollList" id="mainRollBanner"
				style="transform: translate3d(0px, 0px, 0px); transform-style: preserve-3d; backface-visibility: hidden;"
				data-scalar-y="5" data-scalar-x="15">
										<li style="display: list-item; z-index: 2; opacity: 1;"
					view="on" idx="9">
					<div class="layer bgWrap"
						style="left: 0px; top: 0px; display: block; position: absolute; transform: translate3d(35.94px, 5.71489px, 0px); transform-style: preserve-3d; backface-visibility: hidden;"
						data-depth="0.20">
						<div class="moveBg"
							style="background-image: url('http://static.plaync.co.kr/gaiaupload/BladeNSoul/main/7820/BS_1920x650_pc20190515094800.jpg');"></div>
					</div> <a href="http://bns.plaync.com/news/commonnotice/article/7023"
					target="_"> <span class="layer moveImg"
						style='left: 0px; top: 0px; background-image: url("http://static.plaync.co.kr/gaiaupload/BladeNSoul/main/7820/BS_810x540_pc20190515094800.png"); display: block; position: absolute; transform: translate3d(71.88px, 11.4298px, 0px); transform-style: preserve-3d; backface-visibility: hidden;'
						data-depth="0.40"></span>
						<div class="textWrap">
							<div class="wrapCategory none">
								<span class="category "></span>
							</div>
							<h2 class="subject">무한의 실타래 특별 패키지</h2>
							<div class="desc">나만의 매력적인 의상 만들기</div>
						</div>
				</a>
				</li>
				</ul>
		<script>
			// 메인 프로모션 롤링
			jQuery(document)
					.ready(
							function() {
								if (!jQuery('html').hasClass('ie8')) {
									jQuery('#mainRollBanner').parallax();
								}
								// on/off 제어
								jQuery('.mainRollBanner')
										.find('ul li')
										.each(
												function() {
													if (jQuery(this).attr(
															"view")) {
														if (jQuery(this).attr(
																"view") == 'off') {
															jQuery(this)
																	.remove();
														}
													}
												});
								// view가 on일때만 textimg 보여줌
								jQuery('.promoRollingPager')
										.find('ul li')
										.each(
												function() {
													if (jQuery(this).attr(
															"view")) {
														if (jQuery(this).attr(
																"view") == 'on') {
															jQuery(this).show();
														}
													}
												});

								var rolling = new endlessRolling(
										{
											container : '.mainRollBanner',
											items : '.mainRollBanner .promoRollingPager .mainRollThumbList li',
											prevBtn : '.mainRollBanner .prevPage',
											nextBtn : '.mainRollBanner .nextPage',
											distance : '193',
											pageLeng : '6',
											autoPlay : true,
											delayTime : 7000,
											type : 2,
											moveFN : function(_num) {
												changeBanner(_num);
											}
										});

								var oldItem = null;
								currentItemIdx = 1;

								jQuery('#mainRollBanner li')
										.css('z-index', '0').hide();
								var newItem = jQuery(
										'#mainRollBanner li[idx=1]').show();
								var itemList = jQuery('.mainRollBanner .promoRollingPager .mainRollThumbList li');
								jQuery(itemList[0]).addClass('on');

								// 썸네일리스트 중앙정렬
								if (itemList.length < 6) {
									jQuery('.mainRollThumbList').css({
										width : 188 * itemList.length
									});
								}
								;

								jQuery('#numWrap')
										.html(
												'<em class="current">1</em> <span class="slash">/</span> <span class="total total'+itemList.length+'">'
														+ itemList.length
														+ '</span>');

								jQuery(
										'.mainRollBanner .promoRollingPager .mainRollThumbList li')
										.on(
												'click',
												function(event) {
													if (jQuery(this).hasClass(
															'on'))
														return false;
													changeBanner(jQuery(this)
															.attr('idx'));
													rolling.setRolling(jQuery(
															this).attr('idx'));
													return false;
												});

								function changeBanner(_num) {
									var _num = (_num > itemList.length) ? (_num - itemList.length)
											: _num;

									itemList.removeClass('on');
									jQuery(
											'.mainRollBanner .promoRollingPager .mainRollThumbList li[idx='
													+ _num + ']')
											.addClass('on');

									var cur = jQuery('#numWrap').find(
											'.current');
									cur.text(_num);
									cur.removeClass().addClass(
											'current current' + _num);

									jQuery('#mainRollBanner li').css({
										'z-index' : '1'
									});
									oldItem = newItem;
									newItem = jQuery(
											'#mainRollBanner li[idx=' + _num
													+ ']').show().css({
										'z-index' : '2',
										'opacity' : 0
									});
									jQuery.when(newItem.animate({
										'opacity' : 1
									}, 500), oldItem.animate({
										'opacity' : 0
									}, 500)).then(function() {
										oldItem.hide();
									});
								}
							});
		</script>
		
		<!-- (e) 201502_promotion -->
		</section>
		</div>
</body>
</html>