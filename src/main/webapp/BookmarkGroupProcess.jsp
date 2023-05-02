<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page import="bookmark.BookmarkGroupDTO" %><%--
  Created by IntelliJ IDEA.
  User: devfrog
  Date: 2023/05/02
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bookmarkGroupName = request.getParameter("bookmarkGroupName");
    String bookmarkGroupLevel = request.getParameter("bookmarkGroupLevel");
    BookmarkGroupDTO dto = new BookmarkGroupDTO();
    dto.setName(bookmarkGroupName);
    dto.setLevel(bookmarkGroupLevel);

    BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
    int iResult = dao.insertBookmarkGroup(dto);
    dao.close();

    if(iResult == 1) {
        response.sendRedirect("BookmarkGroup.jsp");
    }else {
        // TODO
    }
%>

