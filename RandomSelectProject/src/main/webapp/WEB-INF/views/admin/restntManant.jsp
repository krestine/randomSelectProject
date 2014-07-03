<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당 관리</title>


</head>
<body>

	<br>
	<table border="2">
		<caption>식당 필터</caption>
		<thead>

			<tr>
				<th>시/도</th>
				<th>시/군/구</th>
				<th>도로</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><form action="restntManantProc.do" method="post">
						<input type="hidden" name="caseCode" value="1"> <select
							name="adress1">
							<c:forEach items="${adress1}" var="adress1">
								<c:choose>
									<c:when test="${adress1==choice.adress1}">
										<option selected="selected">${adress1}</option>
									</c:when>
									<c:otherwise>
										<option>${adress1}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> <input type="submit" value="적용">
					</form></td>
				<td><form action="restntManantProc.do" method="post">
						<input type="hidden" name="adress1" value="${choice.adress1}">
						<input type="hidden" name="caseCode" value="2"> <select
							name="adress2">
							<c:choose>
								<c:when test="${adress2!=null}">
									<c:forEach items="${adress2}" var="adress2">
										<c:choose>
											<c:when test="${adress2==choice.adress2}">
												<option selected="selected">${adress2}</option>
											</c:when>
											<c:otherwise>
												<option>${adress2}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option selected="selected">시/도를 선택하세요</option>
								</c:otherwise>
							</c:choose>
						</select> <input type="submit" value="적용">
					</form></td>
				<td><form action="restntManantProc.do" method="post">
						<input type="hidden" name="adress1" value="${choice.adress1}">
						<input type="hidden" name="adress2" value="${choice.adress2}">
						<input type="hidden" name="caseCode" value="3"> <select
							name="adress3">
							<c:choose>
								<c:when test="${adress3!=null}">
									<c:forEach items="${adress3}" var="adress3">
										<c:choose>
											<c:when test="${adress3==choice.adress3}">
												<option selected="selected">${adress3}</option>
											</c:when>
											<c:otherwise>
												<option>${adress3}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option selected="selected">시/군/구 를 선택하세요</option>
								</c:otherwise>
							</c:choose>
						</select> <input type="submit" value="적용">
					</form></td>
			</tr>
		</tbody>
	</table>



	<table border="2">
		<caption>검색 결과</caption>
		<thead>

			<tr>
				<th>식당명</th>

			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${code.adress3==null}">
					<tr>
						<td>"상세정보 필터를 적용해 주세요."</td>
					</tr>
				</c:when>




				<c:when test="${code.adress3!=null}">
					<c:forEach items="${restnts}" var="restnt">
						<form action="restntInfoForm.do" method="post">
							<tr>

								<td><c:choose>
										<c:when test="${restnt.restntId!=null}">
											<input type="hidden" name="adress1" value="${choice.adress1}">
											<input type="hidden" name="adress2" value="${choice.adress2}">
											<input type="hidden" name="adress3" value="${choice.adress3}">
											<input type="hidden" value="${restnt.restntId }"
												name="restntId">
										${restnt.restntName } <input type="submit" value="상세정보">
										</c:when>
										<c:when test="${restnt.restntId==null}">
											없어
										</c:when>
									</c:choose></td>

							</tr>
						</form>
					</c:forEach>
				</c:when>

			</c:choose>

		</tbody>
	</table>



</body>
</html>