<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    String lat = request.getParameter("lat");
    String lnt = request.getParameter("lnt");
    List<HashMap<String, String>> rows = new ArrayList<>();
    if(session.getAttribute("rows") != null) {
        rows = (List<HashMap<String, String>>)session.getAttribute("rows");
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search WIFI</title>
    <link rel="stylesheet" href="Resources/css/main.css" type="text/css">
</head>
<body>
<div id="app">
    <div class="message">
        <p class="message-content"></p>
        <p>잠시만 기다려주세요.</p>
    </div>
    <h2 class="main-title">와이파이 정보 구하기</h2>
    <jsp:include page="/Common/Navigation.jsp" />
    <section class="control-container">
        <form class="pos-list" method="get" action="ListProcess.jsp">
            <label class="pos-item">LAT: <input type="text" name="lat" class="pos-lat" value="<%=lat == null ? "" : lat%>"></label>
            <label class="pos-item">LNT: <input type="text" name="lnt" class="pos-lnt" value="<%=lnt == null ? "" : lnt%>"></label>
            <button class="btn btn-get-pos" type="button" onclick="getPosBtnHandler()">내 위치 가져오기</button>
            <button class="btn btn-wifi-info" type="submit">근처 WIFI 정보 보기</button>
        </form>
    </section>
    <table>
        <tr>
            <th>거리(Km)</th>
            <th>관리번호</th>
            <th>자치구</th>
            <th class="cell-size-md">와이파이명</th>
            <th class="cell-size-md">도로명주소</th>
            <th class="cell-size-lg">상세주소</th>
            <th>설치위치(층)</th>
            <th>설치유형</th>
            <th>설치기관</th>
            <th>서비스구분</th>
            <th>망종류</th>
            <th>설치년도</th>
            <th>WIFI접속환경</th>
            <th>x좌표</th>
            <th>y좌표</th>
            <th class="cell-size-md">작업일자</th>
        </tr>
<%
    if(rows.size() != 0){
        for(HashMap<String, String> info: rows) {
%>
    <tr>
        <td><%= info.get("DIST")%></td>
       <td><%= info.get("X_SWIFI_MGR_NO")%></td>
       <td><%= info.get("X_SWIFI_WRDOFC")%></td>
       <td><%= info.get("X_SWIFI_MAIN_NM")%></td>
       <td><%= info.get("X_SWIFI_ADRES1")%></td>
       <td><%= info.get("X_SWIFI_ADRES2")%></td>
       <td><%= info.get("X_SWIFI_INSTL_FLOOR")%></td>
       <td><%= info.get("X_SWIFI_INSTL_MBY")%></td>
       <td><%= info.get("X_SWIFI_SVC_SE")%> </td>
       <td><%= info.get("X_SWIFI_CMCWR")%> </td>
       <td><%=info.get("X_SWIFI_CNSTC_YEAR")%></td>
       <td><%=info.get("X_SWIFI_INOUT_DOOR")%></td>
       <td><%=info.get("X_SWIFI_REMARS3")%></td>
       <td><%= info.get("LAT")%></td>
       <td><%= info.get("LNT")%></td>
       <td><%= info.get("WORK_DTTM")%></td>
    </tr>
<%
        }
    }

%>
    </table>
</div>

<script type="text/javascript">
    const getPosBtnHandler = () => {
        toggleMessage(true, "위치 정보를 받아오고 있습니다.");

        const inputLat = document.querySelector(".pos-lat");
        const inputLnt = document.querySelector(".pos-lnt");

        if(navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    inputLat.value = position.coords.latitude.toFixed(7);
                    inputLnt.value = position.coords.longitude.toFixed(7);
                    toggleMessage(false);
                },
                (error) => {
                    throw new Error(error);
                }
            )
        }else {
            alert("현재 GPS를 지원하지 않습니다.")
        }
    };

    const toggleMessage = (flag, message = "") => {
        const messageElem = document.querySelector(".message");
        const messageContentElem = document.querySelector(".message-content");

        messageContentElem.innerText = message;
        if(flag) {
            messageElem.style.display = "block";
        }else {
            messageElem.style.display = "none";
        }
    }
</script>

</body>
</html>
