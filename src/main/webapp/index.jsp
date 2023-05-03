<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="wifi.data.WIFIInfoDetailDTO" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    String lat = request.getParameter("lat");
    String lnt = request.getParameter("lnt");
    List<WIFIInfoDetailDTO> rows = new ArrayList<>();

    if(session.getAttribute("lat") != null && session.getAttribute("lnt") != null) {
        lat = session.getAttribute("lat").toString();
        lnt = session.getAttribute("lnt").toString();
    }

    if(session.getAttribute("rows") != null) {
        rows = (List<WIFIInfoDetailDTO>)session.getAttribute("rows");
    }
%>
<html>
<jsp:include page="Common/HeadTag.jsp"/>
<body>
<div id="app">
    <div class="wait-message">
        <div class="wait-message-inner-wrapper">
            <p class="wait-message-content"></p>
            <p>잠시만 기다려주세요.</p>
        </div>
    </div>
    <h2 class="main-title">와이파이 정보 구하기</h2>
    <jsp:include page="/Common/Navigation.jsp" />
    <section class="control-container">
        <form class="pos-list" method="get" action="WifiInfo/GetWifiListProcess.jsp">
            <label class="pos-item">LAT: <input type="text" name="lat" class="pos-lat" value="<%=lat == null ? "" : lat%>"></label>
            <label class="pos-item">LNT: <input type="text" name="lnt" class="pos-lnt" value="<%=lnt == null ? "" : lnt%>"></label>
            <button class="btn btn-get-pos" type="button" onclick="getPosBtnHandler()">내 위치 가져오기</button>
            <button class="btn btn-wifi-info" type="submit" onclick="toggleMessage(true, '근처 와이파이 정보를 수집하고 있습니다. \n 다소 시간이 소요될 수 있습니다.')">근처 WIFI 정보 보기</button>
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
        for(WIFIInfoDetailDTO info: rows) {
%>
    <tr>
        <td><%= info.getDist()%></td>
       <td><%= info.getX_SWIFI_MGR_NO()%></td>
       <td><%= info.getX_SWIFI_WRDOFC()%></td>
        <td><a href="WifiInfo/InfoDetail.jsp?mgrNo=<%=info.getX_SWIFI_MGR_NO()%>"><%= info.getX_SWIFI_MAIN_NM()%></a></td>
       <td><%= info.getX_SWIFI_ADRES1()%></td>
       <td><%= info.getX_SWIFI_ADRES2()%></td>
       <td><%= info.getX_SWIFI_INSTL_FLOOR()%></td>
       <td><%= info.getX_SWIFI_INSTL_MBY()%></td>
       <td><%= info.getX_SWIFI_SVC_SE()%> </td>
       <td><%= info.getX_SWIFI_CMCWR()%> </td>
       <td><%=info.getX_SWIFI_CNSTC_YEAR()%></td>
       <td><%=info.getX_SWIFI_INOUT_DOOR()%></td>
       <td><%=info.getX_SWIFI_REMARS3()%></td>
       <td><%= info.getLAT()%></td>
       <td><%= info.getLNT()%></td>
       <td><%= info.getWORK_DTTM()%></td>
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
            alert("현재 장치는 GPS를 지원하지 않습니다.")
        }
    };

    const toggleMessage = (flag, message = "") => {
        const messageElem = document.querySelector(".wait-message");
        const messageContentElem = document.querySelector(".wait-message-content");

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
