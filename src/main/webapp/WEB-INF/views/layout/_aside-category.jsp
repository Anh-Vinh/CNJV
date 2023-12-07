<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>

<style>

	.panel-title {
		color: white;
	}

	#cart-img {
		width: 100%;
	}

	li {
		/*text-align: left;*/
	}

</style>

<div class="panel panel-success">
	<div class="panel-heading">
		<h3 class="panel-title">
			<span class="glyphicon glyphicon-th-large"></span> DANH MỤC
		</h3>
	</div>
	<div class="list-group">
		<c:forEach var="c" items="${cates}">
			<a href="/product/list-by-category/${c.id}" class="list-group-item">${c.nameVN}</a>
		</c:forEach>
	</div>
</div>
<style id="cart-effect">
.cart-fly {
	background-color: yellow;
}
</style>