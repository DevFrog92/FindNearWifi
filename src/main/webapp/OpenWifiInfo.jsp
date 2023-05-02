<%@ page import="http.HttpRequest" %><%--
  Created by IntelliJ IDEA.
  User: devfrog
  Date: 2023/05/01
  Time: 8:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpRequest httpRequest = new HttpRequest();
    long totalAmount = httpRequest.getTotalWifiInfo(application);
%>
<html>
<head>
    <title>Open API Information</title>
</head>
<body>
    <p><%=totalAmount%>개의 WIFI 정보를 정상적으로 저장하였습니다.</p>
    <a href="index.jsp">홈 으로 가기</a>
</body>
</html>
