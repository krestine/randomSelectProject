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
	<br>
	<br>
	<h1 align="center">${product.productName }</h1>
	<br>
	<form id="myform" method="post" action="productCon.do">
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			bgcolor="white">
			<tr>
				<td width="5"><img
					src="http://cfile22.uf.tistory.com/image/2204FA50537C7EA0118329"></td>
				<td colspan="3" width="620"
					style="background: url('http://cfile24.uf.tistory.com/image/26456E50537C7EA1054717') repeat-x; text-align: center;"></td>
				<td width="5"><img
					src="http://cfile26.uf.tistory.com/image/270FB150537C7EA10F105C"></td>
			</tr>
			<tr>
				<td rowspan="5"
					style="background: url('http://cfile9.uf.tistory.com/image/21756050537C7E9F14A8FF') repeat-y; text-align: center;"></td>
				<td rowspan="5"><img src="${product.productPic }"></td>
				<td>상품명</td>
				<td>${product.productName }</td>
				<td rowspan="5"
					style="background: url('http://cfile23.uf.tistory.com/image/2274F750537C7EA014CA2B') repeat-y; text-align: center;"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${product.productPrice }</td>
			</tr>
			<tr>
				<td>재고</td>
				<td>${product.productCount }</td>
			</tr>
			<tr>
				<td>수량</td>
				<td><select name="productEA">
						<c:forEach var="count" begin="1" end="10" step="1">
							<option value="${count}">${count}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="hidden" name="productCode"
					value="${product.productCode}" class="redBtn"> <!-- <input
					type="submit" value="구매하기" name="check" class="redBtn"> --> <input
					type="submit" value="장바구니" name="check" class="redBtn"></td>
			</tr>
			<tr>
				<td><img
					src="http://cfile26.uf.tistory.com/image/2612E550537C7E9F2406E7"></td>
				<td colspan="3"
					style="background: url('http://cfile10.uf.tistory.com/image/25123550537C7E9F27D769') repeat-x; text-align: center;"></td>
				<td><img
					src="http://cfile1.uf.tistory.com/image/225B0650537C7EA018F4E6"></td>
			</tr>
		</table>
	</form>
	<br>

	<table align="center" border="0" cellpadding="0" cellspacing="0"
		bgcolor="white" width="630">
		<tr>
			<td><img
				src="http://cfile22.uf.tistory.com/image/2204FA50537C7EA0118329"></td>
			<td width="610"
				style="background: url('http://cfile24.uf.tistory.com/image/26456E50537C7EA1054717') repeat-x; text-align: center;"></td>
			<td><img
				src="http://cfile26.uf.tistory.com/image/270FB150537C7EA10F105C"></td>
		</tr>
		<tr>
			<td
				style="background: url('http://cfile9.uf.tistory.com/image/21756050537C7E9F14A8FF') repeat-y; text-align: center;"></td>
			<td><img
				src="http://cfile3.uf.tistory.com/image/217EB43C537EE25B0901BB"><br>
				<img align="middle" src="${product.productPic2 }"></td>
			<td
				style="background: url('http://cfile23.uf.tistory.com/image/2274F750537C7EA014CA2B') repeat-y; text-align: center;"></td>
		</tr>
		<tr>
			<td><img
				src="http://cfile26.uf.tistory.com/image/2612E550537C7E9F2406E7"></td>
			<td
				style="background: url('http://cfile10.uf.tistory.com/image/25123550537C7E9F27D769') repeat-x; text-align: center;"></td>
			<td><img
				src="http://cfile1.uf.tistory.com/image/225B0650537C7EA018F4E6"></td>
		</tr>
	</table>
	<br><br>
</body>
</html>