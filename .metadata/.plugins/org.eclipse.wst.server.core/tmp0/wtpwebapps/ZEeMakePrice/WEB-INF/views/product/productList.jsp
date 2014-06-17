<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" type="text/css"
	href="http://large.tistory.com/attachment/cfile24.uf@2308843D537D64900C6363.css">
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
	height: 300px;
	PADDING-RIGHT: 0px;
	PADDING-TOP: 5px
}

#img {
	WIDTH: 250px;
	FLOAT: left;
	HEIGHT: 250px
}

#detailText {
	WIDTH: 400px;
	FLOAT: right;
	HEIGHT: 100px
}

/* 링크에서 밑줄 없애기 */
a.no-uline {
	text-decoration: none
}

/* 마우스 지나갈 때만 삭제 + 강제로 없애기 */
a.noul:hover {
	text-decoration: none !important
}
</style>
<title>productList</title>
</head>
<body link="black" vlink="black" alink="red">
	<form id="productList" method="post">

		<c:forEach var="product" items="${productList}">
			<br>
			<br>
			<div>
				<table align="center" border="0" cellpadding="0" cellspacing="0"
					bgcolor="white">

					<tr>
						<td><img
							src="http://cfile22.uf.tistory.com/image/2204FA50537C7EA0118329"></td>
						<td width="600" colspan="2"
							style="background: url('http://cfile24.uf.tistory.com/image/26456E50537C7EA1054717') repeat-x; text-align: center;"></td>
						<td><img
							src="http://cfile26.uf.tistory.com/image/270FB150537C7EA10F105C"></td>
					</tr>
					<tr>
						<td rowspan="2"
							style="background: url('http://cfile9.uf.tistory.com/image/21756050537C7E9F14A8FF') repeat-y; text-align: center;"></td>
						<td rowspan="2"><a
							href="productContext.do?productCode=${product.productCode}"
							class="no-uline"><img id="img" src="${product.productPic }"></a></td>
						<td><a
							href="productContext.do?productCode=${product.productCode}"
							class="no-uline"><h1>${product.productName}</h1></a> </font></td>
						<td rowspan="2"
							style="background: url('http://cfile23.uf.tistory.com/image/2274F750537C7EA014CA2B') repeat-y; text-align: center;"></td>
					</tr>
					<tr>
						<td>가격: ${product.productPrice }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="productContext.do?productCode=${product.productCode}"
							class="no-uline">상세보기</a></td>
					</tr>
					<tr>
						<td><img
							src="http://cfile26.uf.tistory.com/image/2612E550537C7E9F2406E7"></td>
						<td colspan="2"
							style="background: url('http://cfile10.uf.tistory.com/image/25123550537C7E9F27D769') repeat-x; text-align: center;"></td>
						<td><img
							src="http://cfile1.uf.tistory.com/image/225B0650537C7EA018F4E6"></td>
					</tr>
				</table>
			</div>
			<br>
		</c:forEach>
	</form>

	<%-- <form id="productList" method="post">

		<c:forEach var="product" items="${productList}">
			<div id="container">
				<input type="hidden" name="productName"
					value="${product.productName}">
				<div id="img"
					onclick="document.location='productContext.do?productCode=${product.productCode}'">
					<img src="${product.productPic }">
				</div>
				${product.productImg1}
				<div id="detailText"
					onclick="document.location='productContext.do?productCode=${product.productCode}'">
					<h1>${product.productName}</h1>
					<a style="cursor: pointer"
						href="document.location='productContext.do?productCode=${product.productCode}' "></a>
					상세보기
				</div>

				${product.detailText}
			</div>
			<br>
		</c:forEach>
	</form> --%>
</body>
</html>
