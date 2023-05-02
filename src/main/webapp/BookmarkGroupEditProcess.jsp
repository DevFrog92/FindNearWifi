<%@ page import="bookmark.BookmarkGroupDTO" %>
<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  String bookmarkGroupName = request.getParameter("bookmarkGroupName");
  String bookmarkGroupLevel = request.getParameter("bookmarkGroupLevel");
  BookmarkGroupDTO dto = new BookmarkGroupDTO();
  dto.setId(Integer.parseInt(id));
  dto.setName(bookmarkGroupName);
  dto.setLevel(bookmarkGroupLevel);

  BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
  int iResult = dao.updateBookmarkGroupItem(dto);
  dao.close();

  if(iResult == 1) {
    response.sendRedirect("BookmarkGroup.jsp");
  }else {
    // TODO
  }
%>
