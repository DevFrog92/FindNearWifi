<%@ page import="bookmark.BookmarkDTO" %>
<%@ page import="bookmark.BookmarkDAO" %>
<%@ page import="utils.JSFunction" %>
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
    JSFunction.alertLocation("북마크를 생성했습니다.", "BookmarkList.jsp", out);
  }else {
    JSFunction.alertBack("북마크 생성을 실패했습니다.", out);
  }
%>