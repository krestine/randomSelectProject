<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>evaluateList.jsp</title>
<style>
      a:link {color: blue; text-decoration: none;}
      a:visited {color: purple; text-decoration: none;}
      a:hover {color: red; text-decoration: underline;}
      a:active {color: white; background-color: green;}
    </style>
    
    
<script type="text/javascript">
	function evaluateGo() {

		document.getElementById("select2").action = "evaluateListForm.do";
		document.getElementById("select2").submit();
	}

	function nEvaluateGo() {

		document.getElementById("select2").action = "nEvaluateListForm.do";
		document.getElementById("select2").submit();
	}
	function editGo() {

		document.getElementById("select2").action = "edit.do";
		document.getElementById("select2").submit();
	}

	function mainGo() {
		document.getElementById("select1").action = "main.do";
		document.getElementById("select1").submit();
	}
	function myInfoGo() {
		document.getElementById("select1").action = "myInfoForm.do";
		document.getElementById("select1").submit();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>평가</title>


</head>
<body>


<form id="select2" method="post">
		<input type="button" onclick="evaluateGo()" value="평가한 페이지 "> <input
			type="button" onclick="nEvaluateGo()" value="평가 안한 페이지"> <input
			type="button" onclick="editGo()" value="수정">
	</form>



<!-- <div id="wrap">
		<div class="menu">
			<ul>
				<li class="board"><a class="EvaluateList"  href="WEB-INF/evaluate/evaluateList.jsp"OnClick="evaluateGo()">평가한 페이지</a></li>
				<li class="board"><a class="nEvaluateList" href="WEB-INF/evaluate/nEvaluateList.jsp" OnClick="nEvaluateGo()">평가안한페이지</a></li>
				<li class="board"><a class="edit" href="WEB-INF/evaluate/edit.jsp" OnClick="editGo()">평점수정</a></li>
			</ul>
		</div>
		
		<div class="clear"></div>


		<div class="boardList">
			<dl>
			 -->
			
			<c:forEach var="notice" items="${add}" varStatus="cnt">
				<dt class="listHead">
					<h3>${notice.title}</h3>
					<h4>${notice.regidate}</h4>
				</dt>
				<dd class="listContent">${notice.issue}
				<a class="mainBoard" href="WEB-INF/evaluate/edit.do" OnClick="editgo()">글수정</a>
				<a class="mainBoard" href="#" OnClick="window.location='delete.do?notCD=${notice.notCD}'">삭제</a></dd>
			</c:forEach>
	
			
			</dl>
		</div>
		
		
		
		<a href="#" class="listMore">지난 공지사항 더보기</a>
	</div>
	<div>

	</div>
	<ul>
<c:forEach var="studentName" items="list" end="4">
    <li>${studentName }</li>
</c:forEach>
</ul>
	
 <h3>메인으로 </h3>
 
 <form id="select1" method="post">
		<input type="button" onclick="mainGo()" value="메인으로 "> <input
			type="button" onclick="myInfoFormGo()" value="내정보수정"> 
	</form>
 
   <!--  <ul>
      <li><a href="main.do" OnClick="window.location='main.do'">메인으로</a></li>
     <li><a href="myInfoForm.do" OnClick="window.location='myInfoForm.do'">정보수정</a></li>
    </ul>
 -->


<div align="center">
		<table align="center" border="0" width="90%">
			<tr>
			<!-- 	<td width="33%"></td>
				<td width="34%" align="center"><a href="/z/"><img src="http://cfile25.uf.tistory.com/image/26446E40537C551725476A"></a>
					</td> -->
		</tr>
					<!-- 쇼핑몰 로고 가운데에 나타나게 한 것   -->
			
			
			
		<%-- 	<c:choose>
					<c:when test="${users==null}">
						<td width="33%" align="right">
						<input type="button" onclick="document.location='visitList.do'" value="방문목록"
							class="redBtn"></td>
							</c:when>
					<c:otherwise>
							<td width="33%" align="right"><b>${users.name}</b>${welcome}<input type="button"
							onclick="document.location='logout.do'" value="로그아웃"
							class="redBtn"></td>
					</c:otherwise>
				</c:choose> 
								 --%>
		</table>
	</div>

<select name="Score">
<option value="1">★</option>
<option value="2">★★</option>
<option value="3">★★★</option>
<option value="4">★★★★</option>
<option value="5">★★★★★</option>

</select>
</body>
</html>