<%@ page import="http.HttpRequest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="wifi.data.HistoryDAO" %>
<%@ page import="utils.JSFunction" %>
<%@ page import="wifi.data.WIFIInfoDetailDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String lat = request.getParameter("lat");
    String lnt = request.getParameter("lnt");

    HistoryDAO dao = new HistoryDAO(application);
    int iResult = dao.insertHistory(lat, lnt);
    dao.close();

    HttpRequest httpRequest = new HttpRequest();
    List<WIFIInfoDetailDTO> rows = new ArrayList<>();
    if(session.getAttribute("rows") != null) {
        rows = (List<WIFIInfoDetailDTO>) session.getAttribute("rows");
    }else {
        if(lat != null && lnt != null && !lat.equals("") && !lnt.equals("")) {
            rows = httpRequest.getNearWifiInfoList(application, lat, lnt, httpRequest.getTotalWifiInfo(application));
        }else {
            JSFunction.alertBack("위치 정보를 다시 요청해주세요.", out);
        }
    }

    session.setAttribute("lat", lat);
    session.setAttribute("lnt", lnt);
    session.setAttribute("rows", rows);
    session.setAttribute("status", "finish");

    if(iResult == 1) {
        JSFunction.alertLocation("근처 와이파치 정보를 성공적으로 수집했습니다.", "index.jsp?lat="+lat+"&lnt="+lnt, out);
    }else {
        JSFunction.alertBack("근처 와이파이 정보 수집에 실패앴습니다.", out);
    }
%>
