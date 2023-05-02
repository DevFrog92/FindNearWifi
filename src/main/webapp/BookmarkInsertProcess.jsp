<%@ page import="bookmark.BookmarkDTO" %>
<%@ page import="bookmark.BookmarkDAO" %><%--
  Created by IntelliJ IDEA.
  User: devfrog
  Date: 2023/05/02
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String bookmarkGroupName = request.getParameter("groupName");
  String mgrNo = request.getParameter("mgrNo");
  String name = request.getParameter("name");
  BookmarkDTO dto = new BookmarkDTO();
  dto.setName(name);
  dto.setGroupName(bookmarkGroupName);
  dto.setMgrNo(mgrNo);

  BookmarkDAO dao = new BookmarkDAO(application);
  int iResult = dao.insertBookmark(dto);
  dao.close();

  if(iResult == 1) {
    response.sendRedirect("BookmarkList.jsp");
  }else {
    // TODO
  }
%>