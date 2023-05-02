<%@ page import="wifi.data.HistoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String lat = request.getParameter("lat");
  String lnt = request.getParameter("lnt");

  HistoryDAO dao = new HistoryDAO(application);
  int iResult = dao.insertHistory(lat, lnt);

  dao.close();

  if(iResult == 1) {
    response.sendRedirect("index.jsp?lat="+lat+"&lnt="+lnt);
  }else {
    ///
  }
%>
