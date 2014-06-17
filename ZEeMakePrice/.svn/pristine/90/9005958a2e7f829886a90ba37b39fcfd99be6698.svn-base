<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style type="text/css">
#container {
	PADDING-BOTTOM: 10px;
	BACKGROUND-COLOR: #f0f0f0;
	MARGIN: 0px auto;
	PADDING-LEFT: 10px;
	WIDTH: 650px;
	PADDING-RIGHT: 10px;
	PADDING-TOP: 10px
}

#orderInfo {
	/*  WIDTH: 250px;
    FLOAT: left;
    HEIGHT: 200px */
	min-height: 50px;
	background-color: #ccc;
}

#delivery {
	/* WIDTH: 400px;
    FLOAT: right;
    HEIGHT: 200px */
	height: 300px;
	background-color: #999;
}

#bill {
	/*   WIDTH: 400px;
    FLOAT: right;
    HEIGHT: 200px */
	height: 200px;
	background-color: #333;
}
</style>

<title>orderContext</title>
</head>
<body>
	<h1>orderContext</h1>
	<a href="orderList.do">주문내역 리스트</a>
	<a href="/z/">home</a>


	<spring:form action="orderContext.do" commandName="orders"
		method="post">

		<spring:hidden path="productname" value="${order.productname }"
			name="productname" />
		<spring:hidden path="cartnumber" value="${order.cartnumber }"
			name="cartnumber" />
		<spring:hidden path="ea" value=" ${order.ea} " name="ea" />
		<spring:hidden path="totalamount" value=" ${order.amount} "
			name="totalamount" />
			
			1.주문상품
		<table border="1">
			<tr>
				<th width="300">상품명</th>
				<th width="50">수량</th>
				<th width="80">상품가격</th>
			</tr>
			<tr align="center">
				<td>${order.productname }</td>
				<td>${order.ea }</td>
				<td>${price}</td>
			</tr>

			<tr>
				<td align="right">총 결제금액</td>
				<td colspan="2" align="center">${order.amount}만원</td>
			</tr>
			<tr>
				<td colspan="3">2.배송지정보</td>
			</tr>
			<tr>
				<td colspan="3">배송지주소</td>
			</tr>
			<tr>
				<td colspan="3"><input type="radio" id="register"
					name="registerNo" value="registerDefault" checked="checked">
					기본주소 <input type="radio" id="register" name="registerNo"
					value="registerEtc1"> 추가1 <input type="radio" id="register"
					name="registerNo" value="registerEtc2"> 추가2 <input
					type="radio" id="register" name="registerNo" value="registerEtc3">
					추가3</td>
			</tr>
			<tr>
				<td colspan="3"><spring:input path="address"
						value="${users.address}" name="Address" /></td>
			</tr>
			<tr>
				<!-- 			<th><ul> -->
			<tr>
				<td colspan="3">수취인 이름</td>
			</tr>

			<tr>
				<td colspan="3"><spring:input path="name" value="${users.name}"
						name="Name" /></td>

			</tr>
			<tr>
				<td colspan="3">연락처</td>
			</tr>
			<tr>
				<td colspan="3"><spring:input path="phonenumber"
						value="${users.phonenumber}" name="phonenumber" /></td>
			</tr>
			<tr>
				<td colspan="3">배송시 요청사항</td>
			</tr>
			<tr>
				<td colspan="3"><spring:input path="recontext" name="recontext" /></td>
			</tr>
			<tr>
				<td colspan="3">3.결제정보</td>
			</tr>

			<tr>
				<td colspan="3"><spring:select path="payment">
						<spring:option value="신용카드" />신용카드
						<spring:option value="온라인이체" />온라인이체
						<spring:option value="기타" />기타
						<spring:option value="무통장입금" />무통장입금
					</spring:select></td>
			</tr>
		</table>
		<input type="submit" value="결제">
	</spring:form>



</body>
</html>
<!-- 	<div id="orderInfo"> -->

<%-- 	<c:forEach var="i" items="${products }">
					<tr align="center">
						<td>${i.productName }</td>
						<td>${i.productCount }</td>
						<td>${i.productPrice}</td>
						<td>2500</td>
					</tr>
				</c:forEach> --%>

<!-- 	</div> -->

<!-- 	<div id="delivery"> -->
<%-- 	2.배송지정보
		<table border="1" align="left">
			<tr>
				<!-- <th><ul> -->
				<td><li>배송지 주소</li></td>
				<!-- </ul></th> -->
				<td>
					<table>
						<tr>
							<td><input type="radio" id="register" name="registerNo"
								value="registerDefault" checked="checked"> 기본주소 <input
								type="radio" id="register" name="registerNo"
								value="registerEtc1"> 추가1 <input type="radio"
								id="register" name="registerNo" value="registerEtc2">
								추가2 <input type="radio" id="register" name="registerNo"
								value="registerEtc3"> 추가3</td>
						</tr>
						<tr>
							<td><input type="text" size="100px"
								value="${users.address }" name="Address"></td>
						</tr>
					</table>
				</td>
			<tr>
				<!-- 			<th><ul> -->
				<td><li>수취인 이름</li></td>
				<!-- 		</ul></th> -->
				<td><input type="text" size="100px" value="${users.name }"
					name="Name"></td>
			</tr>
			<tr>
				<!-- 				<th><ul> -->
				<td><li>연락처</li></td>
				<!-- </ul></th> -->
				<td><input type="text" size="100px"
					value="${users.phonenumber }" name="PhoneNumber"></td>
			</tr>
			<tr>
				<!-- 				<th><ul> -->
				<ul>
					<td><li>배송시 요청사항</li></td>

					<!-- 						</ul></th> -->
					<td><input type="text" size="100px" name="userText"></td>
			</tr>
		</table>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> 3.결제정보
		<table border="1">
			<tr>
				<td><input type="radio" id="pay" name="pay" value="pay1"
					checked="checked">신용카드 <input type="radio" id="pay"
					name="pay" value="pay2">온라인이체 <input type="radio" id="pay"
					name="pay" value="pay3">기타 <input type="radio" id="pay"
					name="pay" value="pay4">무통장입금 <select name="bank">
						<option value="">은행선택</option>
						<option value="shinhan">신한은행</option>
						<option value="woori">우리은행</option>
						<option value="kookmin">국민은행</option>
				</select></td>
			</tr>
		</table>
		<input type="submit" value="결제하기">
 --%>


<!-- 	</div> -->
<br>
<!-- 		<div id="bill"> -->



<!-- 			</div>
 -->
