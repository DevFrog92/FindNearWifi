<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page import="bookmark.BookmarkGroupDTO" %><%--
  Created by IntelliJ IDEA.
  User: devfrog
  Date: 2023/05/02
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
  BookmarkGroupDTO dto = dao.getBookMarkGroupItem(Integer.parseInt(id));
  dao.close();
%>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="Resources/css/main.css" type="text/css">
</head>
<body>
  <div id="app">
    <h2 class="main-title">북마크 삭제</h2>
    <jsp:include page="/Common/Navigation.jsp" />
    <p>북마크 그룹을 삭제하시겠습니까?</p>
    <ul class="wifi-info-container">
      <li class="wifi-info-item"><span class="wifi-info-label">북마크 그룸 이름</span><span><%=dto.getName()%></span></li>
      <li class="wifi-info-item"><span class="wifi-info-label">등록일자</span><span><%=dto.getCreatedAt()%></span></li>
    </ul>
    <div>
      <a href="BookmarkGroup.jsp">돌아가기</a> |
      <button type="button" onclick="location.href='./BookmarkGroupDeleteProcess.jsp?id=<%=dto.getId()%>'">삭제</button>
    </div>
  </div>
</body>
</html>
