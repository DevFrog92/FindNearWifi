<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page import="bookmark.BookmarkGroupDTO" %>
<%@ page import="wifi.data.WIFIInfoDetailDTO" %>
<%@ page import="utils.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mgrNo = request.getParameter("mgrNo");
    List<WIFIInfoDetailDTO> rows = new ArrayList<>();
    WIFIInfoDetailDTO info = new WIFIInfoDetailDTO();
    if(session.getAttribute("rows") != null) {
        rows = (List<WIFIInfoDetailDTO>)session.getAttribute("rows");
        for(WIFIInfoDetailDTO map: rows) {
            if(map.getX_SWIFI_MGR_NO().equals(mgrNo)) {
                info = map;
                break;
            }
        }
    }else {
        JSFunction.alertBack("와이파이의 상제 정보를 불러올 수 없습니다.", out);
    }

    BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
    List<BookmarkGroupDTO> list = dao.getBookmarkGroupList();
    dao.close();
%>
<html>
<jsp:include page="../Common/HeadTag.jsp"/>
<body>
<div id="app">
  <h2 class="main-title">와이파이 정보 구하기</h2>
  <jsp:include page="/Common/Navigation.jsp" />
    <form action="../Bookmark/BookmarkAddProcess.jsp" method="get" onsubmit="return validationForm(this)">
        <input type="hidden" name="mgrNo" value="<%=info.getX_SWIFI_MGR_NO()%>" />
        <input type="hidden" name="name" value="<%=info.getX_SWIFI_MAIN_NM()%>" />
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
        <li class="wifi-info-item"><span class="wifi-info-label">거리(Km)</span> <span><%=info.getDist()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">관리번호</span> <span><%=info.getX_SWIFI_MGR_NO()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">자치구</span> <span><%=info.getX_SWIFI_WRDOFC()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">와이파이명</span> <span><%=info.getX_SWIFI_MAIN_NM()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">도로명주소</span> <span><%=info.getX_SWIFI_ADRES1()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">상세주소</span> <span><%=info.getX_SWIFI_ADRES2()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">설치위치(층)</span> <span><%=info.getX_SWIFI_INSTL_FLOOR()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">설치유형</span> <span><%=info.getX_SWIFI_INSTL_MBY()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">설치기관</span> <span><%=info.getX_SWIFI_SVC_SE()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">서비스구분</span> <span><%=info.getX_SWIFI_CMCWR()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">망종류</span> <span><%=info.getX_SWIFI_CNSTC_YEAR()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">설치년도</span> <span><%=info.getX_SWIFI_INOUT_DOOR()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">WIFI접속환경</span> <span><%=info.getX_SWIFI_REMARS3()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">x좌표</span> <span><%=info.getLAT()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">y좌표</span> <span><%=info.getLNT()%></span></li>
        <li class="wifi-info-item"><span class="wifi-info-label">작업일자</span> <span><%=info.getWORK_DTTM()%></span></li>
    </ul>
    <script>
        const validationForm = (form) =>{
            if(form.groupName.value === ""){
                alert("북마크 그룹을 먼저 생성해주세요.");
                location.href = "../Bookmark/BookmarkGroup.jsp";
                return false;
            }
        }
    </script>
</div>
</body>
</html>
