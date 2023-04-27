<%@ page import="http.HttpRequest" %>
<%@ page import="api.WIFIInfoDetail" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search WIFI</title>
    <link rel="stylesheet" href="frontend/main.css" type="text/css">
</head>
<body>
<div id="app">
    <table>
<%
    HttpRequest httpRequest = new HttpRequest();
    WIFIInfoDetail[] rows = httpRequest.get("http://openapi.seoul.go.kr:8088/6c6467494f79736b3638536f4f4469/json/TbPublicWifiInfo/1/100/");
    for(WIFIInfoDetail info: rows) {
%>
    <tr>
       <td>X_SWIFI_MGR_NO: <%= info.getX_SWIFI_MGR_NO()%></td>
       <td>X_SWIFI_WRDOFC: <%= info.getX_SWIFI_WRDOFC()%></td>
       <td>X_SWIFI_MAIN_NM: <%= info.getX_SWIFI_MAIN_NM()%></td>
       <td>X_SWIFI_ADRES1: <%= info.getX_SWIFI_ADRES1()%></td>
       <td>X_SWIFI_ADRES2: <%= info.getX_SWIFI_ADRES2()%></td>
       <td>X_SWIFI_INSTL_FLOOR: <%= info.getX_SWIFI_INSTL_FLOOR()%></td>
       <td>X_SWIFI_INSTL_TY: <%= info.getX_SWIFI_INSTL_TY()%></td>
       <td>X_SWIFI_INSTL_MBY: <%= info.getX_SWIFI_INSTL_MBY()%></td>
       <td>X_SWIFI_SVC_SE:<%= info.getX_SWIFI_SVC_SE()%> </td>
       <td>X_SWIFI_CMCWR:<%= info.getX_SWIFI_CMCWR()%> </td>
       <td>X_SWIFI_CNSTC_YEAR: <%=info.getX_SWIFI_CNSTC_YEAR()%></td>
       <td>X_SWIFI_INOUT_DOOR: <%=info.getX_SWIFI_INOUT_DOOR()%></td>
       <td>X_SWIFI_REMARS3: <%=info.getX_SWIFI_REMARS3()%></td>
       <td>LAT: <%= info.getLAT()%></td>
       <td>LNT: <%= info.getLNT()%></td>
       <td>WORK_DTTM: <%= info.getWORK_DTTM()%></td>
    </tr>
<%
    }
%>
    </table>
</div>

</body>
</html>
