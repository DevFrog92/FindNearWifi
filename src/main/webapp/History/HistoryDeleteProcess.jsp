<%@ page import="wifi.data.HistoryDAO" %>
<%@ page import="utils.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  HistoryDAO dao = new HistoryDAO(application);
  int iResult = dao.deleteHistory(id);
  dao.close();

  if(iResult == 1) {
    JSFunction.alertLocation("히스토리를 삭제했습니다.", "HistoryList.jsp", out);
  }else {
    JSFunction.alertBack("히스토리 삭제에 실패했습니다.", out);
  }
%>
