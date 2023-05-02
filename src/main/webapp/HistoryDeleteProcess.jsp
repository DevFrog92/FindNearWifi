<%@ page import="wifi.data.HistoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  HistoryDAO dao = new HistoryDAO(application);
  int iResult = dao.deleteHistory(id);
  dao.close();

  if(iResult == 1) {
    response.sendRedirect("HistoryList.jsp");
  }else {
    // TODO
  }
%>
