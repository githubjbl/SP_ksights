<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.emailId == null }">
 <script>
  alert("잘못된 접근입니다.");
  location.href="${path}/semi_project/mainpage.jsp";
 </script>
</c:if>
