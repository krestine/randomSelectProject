<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function orderRes() {
		document.getElementById('myform').action = "orderRes.do";
		document.getElementById('myform').submit();

	}
	function cartContext() {
		document.getElementById('myform').action = "cartContext.do";
		document.getElementById('myform').submit();

	}
</script>
<style type="text/css">
#container {
	PADDING-BOTTOM: 10px;
	BACKGROUND-COLOR: #f0f0f0;
	MARGIN: 0px auto;
	/* PADDING-LEFT: 10px; */
	WIDTH: 650px;
	PADDING-RIGHT: 10px;
	PADDING-TOP: 10px;
}

#imgView {
	WIDTH: 250px;
	FLOAT: left;
	HEIGHT: 200px
}

#contextView {
	WIDTH: 400px;
	FLOAT: right;
	HEIGHT: 200px
}

#detailImgView {
	CLEAR: both;
	overflow: auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>productContext</h1>
	<br>
	<!-- <input type="button" onclick="document.location='productList.do'"
		value="상품 리스트"> -->
	<!-- <div align="left" id="container"> -->

		<form id="myform" method="post" action="productCon.do">
			<div id="imgView">
				<img src="${product.productPic }">
			</div>
			<div id="contextView">
				상품명 : ${product.productName }<br> 가격 : ${product.productPrice }
				<br> 재고 : ${product.productCount } <br> 수량 :
				 <select name="productEA">
					<c:forEach var="count" begin="1" end="10" step="1">
						<option value="${count}">${count}</option>
					</c:forEach>
				</select><br>
				<%-- 	총금액 :   ${product.productPrice }<br>  --%>
				

				<input type="hidden" name="productCode"
					value="${product.productCode}">
				<%-- 	<input type="button"  id="orderRes" value=" 바로구매 " onclick="orderRes()"> 
					<input type="button" id="cartContext" value=" 장바구니"
					onclick="document.location='cartContext.do?productCode=${product.productCode}&productEA=${productEA}' " > --%>
				<input type="submit" value="구매하기" name="check"> 
				<input type="submit" value="장바구니" name="check">
			</div>
			<div id="detailImgView">
				<%-- ${productList.productDetailImg } --%>
			</div>

		</form>
		<img align="middle" src="${product.productPic2 }">
<!-- 	</div> -->
</body>

<%-- <body>
	<h1>productContext</h1>
	<br>
	<input type="button" onclick="document.location='productList.do'"
		value="상품 리스트">
		<div id="container">
	<form id="myform" method="post">
		<div id="imgView">
		이미지 : ${product.productImg2 }
		</div>
		<div id="contextView">
			상품명 : ${product.productName }<br> 
			가격 : ${product.productPrice } <br> 
			수량 :
			<select name="productCount">
				<c:forEach var="count" begin="1" end="10" step="1">
					<option value="${productCount }">${productCount }</option>
				</c:forEach>
			</select><br> 
			총금액 : ${count *product.productPrice }<br> 
		<input type="hidden" name="productName" value="${product.productName}">	
		<input type="button" id="orderRes" value=" 바로구매 " onclick="orderRes()">
		<input type="button" id="cartContext" value=" 장바구니" onclick="cartContext()">

		</div>
		<div id="detailImgView">${product.productDetailImg }</div>

	</form>
	</div>
</body> --%>
</html>