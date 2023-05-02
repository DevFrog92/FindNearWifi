<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page import="bookmark.BookmarkGroupDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mgrNo = request.getParameter("mgrNo");
    List<HashMap<String, String>> rows = new ArrayList<>();
    HashMap<String, String> info = new HashMap<>();
    if(session.getAttribute("rows") != null) {
        rows = (List<HashMap<String, String>>)session.getAttribute("rows");
        for(HashMap<String, String > map: rows) {
            if(map.get("X_SWIFI_MGR_NO").equals(mgrNo)) {
                info = map;
                break;
            }
        }
    }else {
        // TODO
    }

    BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
    List<BookmarkGroupDTO> list = dao.getBookmarkGroupList();
    dao.close();
%>
<html>
<head>
    <title>Search WIFI</title>
    <link rel="stylesheet" href="Resources/css/main.css" type="text/css">
</head>
<body>
<div id="app">
  <h2 class="main-title">와이파이 정보 구하기</h2>
  <jsp:include page="/Common/Navigation.jsp" />
    <form action="BookmarkInsertProcess.jsp" method="get" onsubmit="return validationForm(this)">
        <input type="hidden" name="mgrNo" value="<%=info.get("X_SWIFI_MGR_NO")%>" />
        <input type="hidden" name="name" value="<%=info.get("X_SWIFI_MAIN_NM")%>" />
        <select name="groupName">
            <option value="" disabled selected>북마크 그룹 선택</option>
            <%
                for(BookmarkGroupDTO item: list){
            %>
                <option value="<%=item.getName()%>"><%=item.getName()%></option>
            <%
                }
            %>
        </select>
        <button type="submit">북마크 축가하기</button>
    </form>
    <ul class="wifi-info-container">
        <li class="wifi-info-item"><span class="wifi-info-label">거리(Km)</span> <span><%=info.get("DIST")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">관리번호</span> <span><%=info.get("X_SWIFI_MGR_NO")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">자치구</span> <span><%=info.get("X_SWIFI_WRDOFC")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">와이파이명</span> <span><%=info.get("X_SWIFI_MAIN_NM")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">도로명주소</span> <span><%=info.get("X_SWIFI_ADRES1")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">상세주소</span> <span><%=info.get("X_SWIFI_ADRES2")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">설치위치(층)</span> <span><%=info.get("X_SWIFI_INSTL_FLOOR")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">설치유형</span> <span><%=info.get("X_SWIFI_INSTL_MBY")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">설치기관</span> <span><%=info.get("X_SWIFI_SVC_SE")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">서비스구분</span> <span><%=info.get("X_SWIFI_CMCWR")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">망종류</span> <span><%=info.get("X_SWIFI_CNSTC_YEAR")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">설치년도</span> <span><%=info.get("X_SWIFI_INOUT_DOOR")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">WIFI접속환경</span> <span><%=info.get("X_SWIFI_REMARS3")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">x좌표</span> <span><%=info.get("LAT")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">y좌표</span> <span><%=info.get("LNT")%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">작업일자</span> <span><%=info.get("WORK_DTTM")%></span></li>
    </ul>
    <script>
        const validationForm = (form) =>{
            if(form.groupName.value === ""){
                alert("북마크 그룹을 먼저 생성해주세요.");
                location.href = "./BookmarkGroup.jsp";
                return false;
            }
        }
    </script>
</div>
</body>
</html>
