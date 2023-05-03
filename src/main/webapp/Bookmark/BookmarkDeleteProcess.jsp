<%@ page import="bookmark.BookmarkDAO" %>
<%@ page import="utils.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mgrNo = request.getParameter("mgrNo");
    BookmarkDAO dao = new BookmarkDAO(application);
    int iResult = dao.deleteBookmarkItem(mgrNo);
    dao.close();

    if(iResult == 1) {
        JSFunction.alertLocation("북마크를 삭제했습니다.", "BookmarkList.jsp", out);
    }else {
        JSFunction.alertBack("북마크 삭제에 실패했습니다.", out);
    }
%>