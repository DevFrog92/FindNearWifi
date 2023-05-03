<%@ page import="wifi.data.HistoryDAO" %>
<%@ page import="utils.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String lat = request.getParameter("lat");
  String lnt = request.getParameter("lnt");

  HistoryDAO dao = new HistoryDAO(application);
  int iResult = dao.insertHistory(lat, lnt);
  dao.close();

  if(iResult == 1) {
    JSFunction.alertLocation("히스토리에 등록되었습니다.", "index.jsp?lat="+lat+"&lnt="+lnt, out);
  }else {
    JSFunction.alertBack("히스토리 등록에 실패했습니다.", out);
  }
%>
