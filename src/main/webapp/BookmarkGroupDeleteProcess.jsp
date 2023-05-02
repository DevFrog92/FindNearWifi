<%@ page import="bookmark.BookmarkGroupDAO" %><%--
  Created by IntelliJ IDEA.
  User: devfrog
  Date: 2023/05/02
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
  int iResult = dao.deleteBookmarkGroupItem(Integer.parseInt(id));
  if(iResult == 1) {
    response.sendRedirect("BookmarkGroup.jsp");
  }else {
    // TODO
  }
  dao.close();
%>