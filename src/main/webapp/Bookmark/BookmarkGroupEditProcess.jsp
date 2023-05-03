<%@ page import="bookmark.BookmarkGroupDTO" %>
<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page import="utils.JSFunction" %>
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
    JSFunction.alertLocation("북마크 그룹을 수정했습니다.", "BookmarkGroup.jsp", out);
  }else {
    JSFunction.alertBack("북마크 그룹 수정을 실패했습니다.", out);
  }
%>
