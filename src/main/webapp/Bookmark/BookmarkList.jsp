<%@ page import="java.util.List" %>
<%@ page import="bookmark.BookmarkDTO" %>
<%@ page import="bookmark.BookmarkDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  BookmarkDAO dao = new BookmarkDAO(application);
  List<BookmarkDTO> list = dao.getBookmarkList();
  dao.close();
%>
<html>
<jsp:include page="../Common/HeadTag.jsp"/>
<body>
<div id="app">
  <h2 class="main-title">북마크 목록</h2>
  <jsp:include page="/Common/Navigation.jsp" />
  <table>
    <tr>
      <th>ID</th>
      <th>북마크 이름</th>
      <th>와이파이명</th>
      <th>등록일자</th>
      <th>비고</th>
    </tr>
    <%if(list.size() != 0){
      for(BookmarkDTO dto: list) {
    %>
    <tr>
      <td><%=dto.getId()%></td>
      <td><%=dto.getGroupName()%></td>
      <td><%=dto.getName()%></td>
      <td><%=dto.getCreatedAt()%></td>
      <td>
        <a href="BookmarkDetail.jsp?mgrNo=<%=dto.getMgrNo()%>">삭제</a>
      </td>
    </tr>
    <%
      }
    %>
  </table>
  <%
  } else {%>
  </table>
  <p class="empty-data">북마크 데이터가 없습니다.</p>
  <%}%>
</div>
</body>
</html>
