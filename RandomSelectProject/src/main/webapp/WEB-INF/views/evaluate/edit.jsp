<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name=writeform method=POST action="editOk.do">
		<table>

			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
							<td>글쓰기</td>
							<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
						</tr>
					</table>
					<table>
					<input type ="hidden" name = "evalScore"  value ="3">
						<tr>	
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input type=text name="title" size="50" maxlength="100" value="${nn.title}"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="writer" size="50" maxlength="50" value="${nn.writer}"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호</td>
							<td><input name="notPasswd" size="50" maxlength="50" value="${nn.notPasswd}"></td>
							<td>&nbsp;</td>
						</tr>
							<tr>
							<td>&nbsp;</td>
							<td align="center">예제 박스</td>
							<td><input type="text" name="box" value="box1111" size="50" maxlength="50" ></td>
							<td>&nbsp;</td>
						</tr>
					<%-- 	<form:select path="code" name="code" items="${code}" itemValue="code" 						
						itemLabel="codenm" />
						 --%>
					
					
		
		
		
		
						<%-- <tr>
					<td width="96">공지사항코드</td>
					<td width="172">
					
					<form:select path="code">
							<c:forEach var="codenm" items="${code}">
								<option value="${codenm.NO}">공지사항</option>
								<option value="${codenm.SM}">시스템점검</option>
								<option value="${codenm.EV}">이벤트</option>
					</c:forEach>
						</form:select></td>
				<tr height="20">
					<td width="96"></td>
					<td width="172"></td>
				</tr> --%>
				
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td><textarea name="issue" cols="50" rows="13" value="${nn.issue}"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td>&nbsp;</td>

							<td colspan="2">
							<!--  <input type=button value="수정"	OnClick="javascript:writeCheck();"> -->
							
							<input type=submit value="수정"	> 
							
								<input type=button
								value="취소" OnClick="javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>