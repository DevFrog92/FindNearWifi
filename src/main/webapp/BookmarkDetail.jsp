<%@ page import="bookmark.BookmarkDAO" %>
<%@ page import="bookmark.BookmarkDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mgrNo = request.getParameter("mgrNo");
    BookmarkDAO dao = new BookmarkDAO(application);
    BookmarkDTO dto = dao.getBookmarkItem(mgrNo);
    dao.close();
%>
<html>
<head>
    <title>북마크 삭제</title>
    <link rel="stylesheet" href="Resources/css/main.css" type="text/css">
</head>
<body>
<div id="app">
    <h2 class="main-title">북마크 삭제</h2>
    <jsp:include page="/Common/Navigation.jsp" />
    <p>북마크를 삭제하시겠습니까?</p>
    <ul class="wifi-info-container">
        <li class="wifi-info-item"><span class="wifi-info-label">북마크 이름</span><span><%=dto.getGroupName()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">와이파이명</span><span><%=dto.getName()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">등록일자</span><span><%=dto.getCreatedAt()%></span></li>
    </ul>
    <div>
        <a href="BookmarkList.jsp">돌아가기</a> |
        <button type="button" onclick="location.href='./BookmarkDeleteProcess.jsp?mgrNo=<%=dto.getMgrNo()%>'">삭제</button>
    </div>
</div>
</body>
</html>
