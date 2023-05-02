<%@ page import="bookmark.BookmarkDAO" %><%--
  Created by IntelliJ IDEA.
  User: devfrog
  Date: 2023/05/02
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mgrNo = request.getParameter("mgrNo");
    BookmarkDAO dao = new BookmarkDAO(application);
    int iResult = dao.deleteBookmarkItem(mgrNo);
    if(iResult == 1) {
        response.sendRedirect("BookmarkList.jsp");
    }else {
        // TODO
    }
    dao.close();
%>