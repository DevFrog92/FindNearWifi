<%@ page import="bookmark.BookmarkGroupDTO" %>
<%@ page import="bookmark.BookmarkGroupDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  BookmarkGroupDAO dao = new BookmarkGroupDAO(application);
  BookmarkGroupDTO dto = dao.getBookMarkGroupItem(Integer.parseInt(id));
  dao.close();
%>
<html>
<jsp:include page="../Common/HeadTag.jsp"/>
<body>
<div id="app">
  <h2 class="main-title">북마크 그룹 추가</h2>
  <jsp:include page="/Common/Navigation.jsp" />
  <form class="form" method="post" action="BookmarkGroupEditProcess.jsp" onsubmit="return validationForm(this)">
    <input type="hidden" name="id" value="<%=dto.getId()%>">
    <div class="form-item">
      <label for="bookmarkGroupName">북마크 이름</label>
      <input type="text" name="bookmarkGroupName" id="bookmarkGroupName" value="<%=dto.getName()%>"/>
    </div>
    <div class="form-item">
      <label for="bookmarkGroupLevel">순서</label>
      <input type="text" name="bookmarkGroupLevel" id="bookmarkGroupLevel" value="<%=dto.getLevel()%>"/>
    </div>
    <div class="form-item">
      <a href="BookmarkGroup.jsp">돌아가기</a> |
      <button type="submit">수정</button>
    </div>
  </form>
</div>
<script>
  const validationForm = (form) => {
    if(form.bookmarkGroupName.value.trim() === "") {
      alert("북마크 그룹 이름을 입력해주세요.");
      form.bookmarkGroupName.focus();
      return false;
    }

    if(form.bookmarkGroupLevel.value.match(/[^0-9]/g)) {
      alert("순서는 정수만 입력해주세요.");
      form.bookmarkGroupLevel.focus();
      return false;
    }
  }
</script>
</body>
</html>
