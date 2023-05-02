<%@ page import="http.HttpRequest" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpRequest httpRequest = new HttpRequest();
    long totalAmount = httpRequest.getTotalWifiInfo(application);
%>
<html>
<head>
    <title>Open API Information</title>
    <link rel="stylesheet" href="Resources/css/main.css" type="text/css">
</head>
<body>
    <div id="app">
        <p><%=totalAmount%>개의 WIFI 정보를 정상적으로 저장하였습니다.</p>
        <a href="index.jsp">홈 으로 가기</a>
    </div>
</body>
</html>
