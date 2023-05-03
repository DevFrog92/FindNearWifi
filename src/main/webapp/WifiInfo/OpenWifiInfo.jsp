<%@ page import="http.HttpRequest" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpRequest httpRequest = new HttpRequest();
    long totalAmount = httpRequest.getTotalWifiInfo(application);
%>
<html>
<jsp:include page="../Common/HeadTag.jsp"/>
<body>
    <div id="app">
        <div class="open-wifi-info-wrapper">
        <p><%=totalAmount%>개의 WIFI 정보를 정상적으로 저장하였습니다.</p>
        <a href="../index.jsp">홈 으로 가기</a>
        </div>
    </div>
</body>
</html>
