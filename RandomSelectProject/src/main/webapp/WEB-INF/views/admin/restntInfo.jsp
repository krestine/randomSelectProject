<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당 상세 정보</title>
</head>
<body>


	<table border="2">

		<caption>식당 상세 정보</caption>

		<tbody>
			<form action="">
			<tr>
				<th>식당명</th>


				<td><input type="text" value="${restnt.restntName}"></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><input type="text" value="${restnt.adress1}"></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td><input type="text" value="${restnt.adress2}"></td>
			</tr>
			<tr>
				<th>주소3</th>
				<td><input type="text" value="${restnt.adress3}"></td>
			</tr>
			<tr>
				<th>주소4</th>
				<td><input type="text" value="${restnt.adress4}"></td>
			</tr>
			
			<tr>
				<th>연락처</th>
				<td><input type="text" value="${restnt.restnttel}"></td>
			</tr>
			
			
			</form>
			<tr>
				<th>평균 별점</th>

				<td><input type="text" disabled="disabled" value="몰라"></td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
			</tr>



			<%-- <tr>
					
					</td>
					<td>
					<th>주소1</th>
					</td>
					<td>
					
					</td>
					<td>
					<th>주소2</th>
					<input type="text" value="${restnt.adress2}">
					</td>
					<td>
					<th>주소3</th>
					<input type="text" value="${restnt.adress3}">
					</td>
					<td><th>주소4</th><input type="text" value="${restnt.adress4}"></td>

				</tr> --%>
		</tbody>

	</table>


</body>
</html>