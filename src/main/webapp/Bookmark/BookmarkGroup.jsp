<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="bookmark.BookmarkGroupDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
  List<BookmarkGroupDTO> list = dao.getBookmarkGroupList();
  dao.close();
%>
<html>
<jsp:include page="../Common/HeadTag.jsp"/>
<body>
  <div id="app">
    <h2 class="main-title">북마크 그룹</h2>
    <jsp:include page="/Common/Navigation.jsp" />
    <div>
      <button type="button" onclick="location.href='BookmarkAdd.jsp'">북마크 그룹 이름 추가</button>
    </div>
    <table>
      <tr>
        <th>ID</th>
        <th>북마크 이름</th>
        <th>순서</th>
        <th>등록일자</th>
        <th>수정일자</th>
        <th>비고</th>
      </tr>
      <%if(list.size() != 0){
          for(BookmarkGroupDTO dto: list) {
      %>
        <tr>
          <td><%=dto.getId()%></td>
          <td><%=dto.getName()%></td>
          <td><%=dto.getLevel()%></td>
          <td><%=dto.getCreatedAt()%></td>
          <td><%=dto.getEditedAt()%></td>
          <td>
            <a href="BookmarkUpdate.jsp?id=<%=dto.getId()%>">수정</a>
            <a href="BookmarkGroupDetail.jsp?id=<%=dto.getId()%>">삭제</a>
          </td>
        </tr>
      <%
        }
      %>
      </table>
      <%
      } else {%>
        </table>
        <p class="empty-data">북마크 그룹 데이터가 없습니다.</p>
      <%}%>
  </div>
</body>
</html>
