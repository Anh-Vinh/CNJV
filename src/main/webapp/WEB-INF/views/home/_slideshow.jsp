<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>

<script src="/static/slideshow/js/modernizr.custom.63321.js"></script>
<script src="/static/slideshow/js/jquery.catslider.js"></script>
<link href="/static/slideshow/css/catslider.css" rel="stylesheet" />

<style>

.mi-slider {
	height: 330px;
}

.mi-slider ul li img {
	height: 200px;
	border-radius: 5px;
}

.mi-slider ul li {
	background: linear-gradient(178.6deg, rgb(20, 36, 50) 11.8%, rgb(124, 143, 161) 83.8%);
}

.mi-slider ul li h4{
	color: white;
	font-weight: bold;
}

.mi-slider ul li img:hover {
	transform: scale(1.02);
	border-radius: 5px;
}

</style>
<script>
	$(function() {
		showCatSlider('.mi-slider', 5000);
	});
</script>
</head>
<body>
	<!--Slide show-->
	<div class="mi-slider">
		<!-- 	hiện danh sách 5 sản phẩm -->
		<c:forEach items="${slideshow_cates}" var="c">
			<ul>
				<c:forEach items="${c.products}" var="p">
					<li><a href="/product/detail/${p.id}"> <img
							src="/static/images/products/${p.image}" />
							<h4>${p.unitPrice}</h4>
					</a></li>
				</c:forEach>
			</ul>
		</c:forEach>
		<nav>
			<c:forEach items="${slideshow_cates}" var="c">
				<a href="#" style="font-size: 12px">${c.nameVN}</a>
			</c:forEach>
		</nav>
	</div>
</body>
</html>


