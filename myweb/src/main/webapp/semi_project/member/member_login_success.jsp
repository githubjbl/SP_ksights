<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<script type="text/javascript">
$(function(){
	$("#logout_btn").click(function(){
		location.href = "${path}/SP_ksight_member/logout.do";
	});
	$("#go_memberIndex").click(function(){
		location.href = "${path}/SP_ksight_member/mypage.do";
	});
});

</script>
</head>
<body>
<div id="result">
   <div id="input_div">
    <p id="logon_message">${dto.id}님 안녕하세요!</p>
    <button type="button" id="go_memberIndex">회원관리</button>
   </div>
   <button type="button" id="logout_btn">LOG OUT</button>
   </div>
</body>
</html>