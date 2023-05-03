<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KSIGHT</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnOkid").click(function(){
		$("#id").attr("readonly", true);
		$("#btnCek").attr("disabled", true);
		$("#btnOkid").attr("disabled", true);
		$("#checking").val("pass");
	});
});
</script>
</head>
<body>

<div id="check">
	<label for="id" class="col-sm-2 col-form-label">Nickname</label>

	<c:if test="${check eq 'y'}">
		<div class="col-sm-8" >
			<input class="form-control" name="id" id="id" value="${id}">
			<div id="nickinfo">사용가능합니다.
				<input type="button" id="btnOkid" value="사용하기">
				<input type="hidden" id="checking" name="checking">
			</div>
		</div>
	</c:if>

	<c:if test="${check ne 'y'}">
		<div class="col-sm-8" >
			<input class="form-control" name="id" id="id" placeholder="한글,영문,숫자가능">
			<div id="nickinfo">중복된 활동명입니다.</div>
		</div>
	</c:if>
	
	<input class="btn btn-sm btn-default" type="button" value="중복확인" id="btnCek" onclick="checkId()">
</div>

</body>
</html>