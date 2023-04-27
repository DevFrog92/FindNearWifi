<%@ page import="http.HttpRequest" %>
<html>
<body>
<h2>Hello World!!!!</h2>
<%
    out.print("what?");
    HttpRequest httpRequest = new HttpRequest();
    httpRequest.get("http://openapi.seoul.go.kr:8088/6c6467494f79736b3638536f4f4469/json/TbPublicWifiInfo/1/100/");
%>
</body>
</html>
