<%@ page import="http.HttpRequest" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="wifi.data.HistoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("status", "ing");
    String lat = request.getParameter("lat");
    String lnt = request.getParameter("lnt");

    HistoryDAO dao = new HistoryDAO(application);
    int iResult = dao.insertHistory(lat, lnt);
    dao.close();

    HttpRequest httpRequest = new HttpRequest();
    List<HashMap<String, String>> rows = new ArrayList<>();

    if(session.getAttribute("rows") != null) {
        rows = (List<HashMap<String, String>>)session.getAttribute("rows");
    }else {
        if(lat != null && lnt != null && !lat.equals("") && !lnt.equals("")) {
            rows = httpRequest.getNeatWifiInfoList(application, lat, lnt, httpRequest.getTotalWifiInfo(application));
        }else {
            // TODO
        }
    }

    session.setAttribute("rows", rows);
    session.setAttribute("status", "finish");

    if(iResult == 1) {
        response.sendRedirect("index.jsp?lat="+lat+"&lnt="+lnt);
    }else {
        // TODO
    }
%>
