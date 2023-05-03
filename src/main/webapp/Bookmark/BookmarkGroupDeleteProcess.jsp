<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page import="utils.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
  int iResult = dao.deleteBookmarkGroupItem(Integer.parseInt(id));
  dao.close();

  if(iResult == 1) {
    JSFunction.alertLocation("북마크 그룹을 삭제했습니다.", "BookmarkGroup.jsp", out);
  }else {
    JSFunction.alertBack("북마크 그룹 삭제에 실패했습니다.", out);
  }
%>