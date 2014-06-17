<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- <script type="text/javascript">
function productContext(){
	document.getElementById('productList').action="productContext.do";
	document.getElementById('productList').submit();
	
}
</script> -->
<style type="text/css">
#container {
	PADDING-BOTTOM: 5px;
	BACKGROUND-COLOR: #f0f0f0;
	MARGIN: 0px auto;
	PADDING-LEFT: 0px;
	WIDTH: 650px;
	height: 110px;
	PADDING-RIGHT: 0px;
	PADDING-TOP: 5px
}

#img {
	WIDTH: 250px;
	FLOAT: left;
	HEIGHT: 100px
}

#detailText {
	WIDTH: 400px;
	FLOAT: right;
	HEIGHT: 100px
}
</style>
<title>productList</title>
</head>

<body>
	<form id="productList" method="post">

		<c:forEach var="product" items="${productList}">
			<div id="container">
				<input type="hidden" name="productName"
					value="${product.productName}">
				<div id="img"
					onclick="document.location='productContext.do?productCode=${product.productCode}'">
					<img
						src="${product.productPic }">
				</div>
				<%-- ${product.productImg1} --%>
				<div id="detailText"
					onclick="document.location='productContext.do?productCode=${product.productCode}'">
					<h1>${product.productName}</h1>
					<a style="cursor: pointer"
						href="document.location='productContext.do?productCode=${product.productCode}' "></a>
					상세보기
				</div>
				<%-- 
${product.detailText} --%>
			</div>

			<br>

		</c:forEach>

	</form>


</body>
</html>
