<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../Common/HeadTag.jsp"/>
<body>
  <div id="app">
    <h2 class="main-title">북마크 그룹 추가</h2>
    <jsp:include page="/Common/Navigation.jsp" />
    <form class="form" method="post" action="BookmarkGroupProcess.jsp" onsubmit="return validationForm(this)">
      <div class="form-item">
        <label for="bookmarkGroupName">북마크 이름</label>
        <input type="text" name="bookmarkGroupName" id="bookmarkGroupName"/>
      </div>
      <div class="form-item">
        <label for="bookmarkGroupLevel">순서</label>
        <input type="text" name="bookmarkGroupLevel" id="bookmarkGroupLevel" />
      </div>
      <div class="form-item">
        <button type="submit">추가</button>
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
