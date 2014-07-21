<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	
	if($('#settingFlag').val()=='1'){
		
		$("#show").html('<h4>설정 적용 완료!!</h4>');
		setTimeout(remove, 3000);
	}	
});	
function remove(){
	$("#show").html('');	
}
function check() {
	var checkValue = 0;
	for(var i =0; i < 14; i++){
		if($("input:checkbox[id='"+i+"']").is(":checked")){
			checkValue += i;
		}
	}
	if(checkValue==91){
		$("#show").html('<h4>아무것도 안드실려고요??</h4>');	
		setTimeout(remove, 3000);
	}
	else{
		$('#settingForm').submit();
	}
}

</script>
</head>
<body>
	<div align="center">

		<input type="hidden" value="${settingProcCode}" id="settingFlag">

		<form action="settingProc.do" method="post" id="settingForm">
			
			
			
				<table>
					
					<tbody style="width: 50%">
						<tr>
						<td colspan="2" align="center"><h3>검색 범위 설정</h3></td>
						</tr>
						<tr>
						<td colspan="2"><select name="walkRange" style="width: 100%; text-align: center;">
				<c:forEach items="${walkRanges}" var="walkRange">
					<c:choose>

						<c:when test="${walkRange.walkRange==userInfo.memWalkRange}">
							<option selected="selected" value="${walkRange.walkRange}" style="text-align: center;">${walkRange.walkRange}m</option>
						</c:when>

						<c:otherwise>
							<option value="${walkRange.walkRange}" style="text-align: center;">${walkRange.walkRange}m
							</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>

			</select></td>
						</tr>
						
						<tr ><td colspan="2" ><h3>제외 메뉴 설정</h3></td></tr>
						<c:forEach items="${excMenus}" var="excMenu" varStatus="num">
							<tr>
								<c:choose>
									<c:when test="${excMenu.excMenu==userSettings[num.index]}">

										<td style="font-size: 15pt;"><input type="checkbox" value="${num.index}"
											name="menus" checked="checked" style="width: 25px; height: 25px;" id="${num.index}"></td>
										<td>${excMenu.excMenu}</td>
									</c:when>
									<c:otherwise>
										<td style="font-size: 15pt;"><input type="checkbox" value="${num.index}" id="${num.index}"
											name="menus" style="width: 25px; height: 25px;"></td>
										<td>${excMenu.excMenu}</td>	
											
									</c:otherwise>

								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</form>
				<button class="btn btn-default" onclick="check()">저장</button>
				<div id="show" align="center">
				
				</div>
			</div>
		




</body>
</html>