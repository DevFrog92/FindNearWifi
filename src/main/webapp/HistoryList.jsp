<%@ page import="wifi.data.HistoryDAO" %>
<%@ page import="wifi.data.HistoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HistoryDAO dao = new HistoryDAO(application);
    List<HistoryDTO> rows = dao.getHistoryList();
    dao.close();
%>
<html>
<head>
    <title>위치 히스토리 목록</title>
    <link rel="stylesheet" href="Resources/css/main.css" type="text/css">
</head>
<body>
<div id="app">
    <h2 class="main-title">위치 히스토리 목록</h2>
    <jsp:include page="Common/Navigation.jsp" />
    <table>
        <tr>
            <th>ID</th>
            <th>X 좌표</th>
            <th>Y 좌표</th>
            <th>조회일자</th>
            <th>비고</th>
        </tr>
        <%
            if(rows.size() != 0){
                for(HistoryDTO info: rows) {
        %>
        <tr>
            <td><%= info.getId()%></td>
            <td><%= info.getLat()%></td>
            <td><%= info.getLnt()%></td>
            <td><%= info.getSearchAt()%></td>
            <td><button type="button" onclick="location.href='HistoryDeleteProcess.jsp?id=<%=info.getId()%>'">삭제</button></td>
        </tr>
        <%
                }
            }else {
        %>
            </table>
            <p class="empty-data">히스토리 데이터가 없습니다.</p>
        <%
            }
        %>

</div>
</body>
</html>
