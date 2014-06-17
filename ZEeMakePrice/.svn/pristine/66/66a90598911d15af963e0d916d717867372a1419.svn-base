<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="http://large.tistory.com/attachment/cfile24.uf@2308843D537D64900C6363.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function() {
		$("#idcheck").click(function() {
			alert("성공");
		});
	});
</script>
</head>
<body>
	<div align="center">
		<h2>회원가입</h2>
		<table align="center" cellpadding="0" cellspacing="0" bgcolor="white"
			border="0">
			<spring:form action="register.do" commandName="users" method="post">
				<tr>
					<td><img
						src="http://cfile22.uf.tistory.com/image/2204FA50537C7EA0118329"></td>
					<td colspan="2"
						style="background: url('http://cfile24.uf.tistory.com/image/26456E50537C7EA1054717') repeat-x; text-align: center;"
						width="272"></td>
					<td><img
						src="http://cfile26.uf.tistory.com/image/270FB150537C7EA10F105C"></td>
				</tr>
				<tr height="20">
					<td rowspan="16"
						style="background: url('http://cfile9.uf.tistory.com/image/21756050537C7E9F14A8FF') repeat-y; text-align: center;"></td>
					<td width="96" colspan="2"></td>
					<td rowspan="16"
						style="background: url('http://cfile23.uf.tistory.com/image/2274F750537C7EA014CA2B') repeat-y; text-align: center;"
						width="0"></td>
				</tr>
				<tr>
					<td width="130">이름</td>
					<td width="172"><spring:input path="name" placeholder="홍길동"
							name="name" /></td>
				</tr>
				<tr height="20">
					<td width="96"></td>

					<td width="172"><font size="2" color="#FF0000"><spring:errors
								path="name" /></font></td>
				</tr>
				<tr>
					<td width="96">아이디</td>

					<td width="172"><spring:input path="userid" placeholder="abcd"
							name="userid" /></td>
				</tr>
				<tr height="20">
					<td width="96"></td>
					<td width="172"><font size="2" color="#FF0000"><spring:errors
								path="userid" /></font></td>
				</tr>
				<tr>
					<td width="96">비밀번호</td>
					<td width="172"><spring:input type="password" path="password"
							placeholder="4-15자리" /></td>
				</tr>
				<tr height="20">
					<td width="96"></td>
					<td width="172"><font size="2" color="#FF0000"><spring:errors
								path="password" /></font></td>
				</tr>
				<tr>
					<td width="96">비밀번호확인</td>
					<td width="172"><spring:input type="password"
							path="passconfirm" placeholder="비밀번호확인" /></td>
				</tr>
				<tr height="20">
					<td width="96"></td>
					<td width="172"><font size="2" color="#FF0000"><spring:errors
								path="passconfirm" /></font></td>
				</tr>
				<tr>
					<td width="96">전화번호</td>
					<td width="172"><spring:select path="phonefirst">
							<spring:option value="010" />
							<spring:option value="011" />
							<spring:option value="016" />
							<spring:option value="017" />
						</spring:select> -<spring:input path="phonesecond" placeholder="0000" /> -<spring:input
							path="phonethird" placeholder="0000" /></td>
				</tr>
				<tr height="20">
					<td width="96"></td>
					<td width="172"><font size="2" color="#FF0000"><spring:errors
								path="phonethird" /></font></td>
				</tr>
				<tr>
					<td width="96">주소</td>
					<td width="172"><spring:input path="address"
							placeholder="상세주소입력" size="100" /></td>
				</tr>
				<tr height="20">
					<td width="96"></td>
					<td width="172"><font size="2" color="#FF0000"><spring:errors
								path="address" /></font></td>
				</tr>
				<tr>
					<td width="96">직업</td>
					<td width="172"><spring:select path="jobcode">
							<c:forEach var="job" items="${list}">
								<spring:option value="${job.jobcode}">${job.job}</spring:option>
							</c:forEach>
						</spring:select></td>
				<tr height="20">
					<td width="96"></td>
					<td width="172"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="가입완료" class="redBtn"><input type="button"
						onclick="document.location='/z/'" value="처음으로" class="redBtn"></td>

				</tr>
				<tr>
					<td width="25"><img
						src="http://cfile26.uf.tistory.com/image/2612E550537C7E9F2406E7"></td>
					<td colspan="2"
						style="background: url('http://cfile10.uf.tistory.com/image/25123550537C7E9F27D769') repeat-x; text-align: center;"
						width="272">
					<td width="17"><img
						src="http://cfile1.uf.tistory.com/image/225B0650537C7EA018F4E6"></td>
				</tr>
			</spring:form>
		</table>
	</div>
</body>
</html>