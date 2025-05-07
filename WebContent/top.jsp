<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>簡易Twitter</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script>
function confirmDelete(messageId) {
  if (window.confirm('このつぶやきを削除しますか？')) {
    document.getElementById('deleteForm_' + messageId).submit();
  }
}
</script>
</head>
<body>
	<div class="header">
		<c:if test="${ empty loginUser }">
			<div class="header-links">
				<a href="login">ログイン</a>
				<a href="signup">登録する</a>
			</div>
		</c:if>
		<c:if test="${ not empty loginUser }">
			<div class="header-links">
				<a href="./">ホーム</a>
				<a href="setting">設定</a>
				<a href="logout">ログアウト</a>
			</div>
			<div class="profile">
				<div class="name"><h2><c:out value="${loginUser.name}" /></h2></div>
				<div class="account">@<c:out value="${loginUser.account}" /></div>
				<div class="description"><c:out value="${loginUser.description}" /></div>
			</div>
			<c:if test="${ not empty errorMessages }">
				<div class="errorMessages">
					<ul>
						<c:forEach items="${errorMessages}" var="errorMessage">
							<li><c:out value="${errorMessage}" /></li>
						</c:forEach>
					</ul>
				</div>
				<c:remove var="errorMessages" scope="session" />
			</c:if>
		</c:if>
		<form action="./" method="get">
			日付 <input type="date" name="startDate" value="${startDate}"> ～ <input type="date" name="endDate" value="${endDate}">
			<input type="submit" value="絞込">
		</form>
		<c:if test="${ not empty loginUser }">
			<div class="form-area">
				<c:if test="${ isShowMessageForm }">
					<form action="message" method="post">
						いま、どうしてる？<br />
						<div class="form">
							<textarea style="box-sizing: border-box;" name="text" cols="100"rows="5" class="tweet-box"></textarea>
						</div>
						<br />
						<input type="submit" value="つぶやく">（140文字まで）
					</form>
				</c:if>
			</div>
		</c:if>
	</div>
	<div class="messages">
		<c:forEach items="${messages}" var="message">
			<div class="message">
				<div class="box">
					<div class="account-name">
						<span class="account">
							<a href="./?user_id=<c:out value="${message.userId}"/> ">
								<c:out value="${message.account}" />
							</a>
						</span>
						<span class="name"><c:out value="${message.name}" /></span>
					</div>
					<div class="text">
						<pre><c:out value="${message.text}" /></pre>
					</div>
					<div class="date">
						<fmt:formatDate value="${message.createdDate}" pattern="yyyy/MM/dd HH:mm:ss" />
					</div>
					<c:if test="${ loginUser.id == message.userId }">
						<table>
							<tr>
								<%-- 編集ボタン --%>
								<td>
									<form action="edit" method="get">
										<input name="message_id" value="${message.id}" id="message_Id" type="hidden" />
										<input type="submit" value="編集" />
									</form>
								</td>
								<%-- 削除ボタン --%>
								<td>
									<form id="deleteForm_${message.id}" action="deleteMessage" method="post" style="display:inline;">
										<input name="messageId" value="${message.id}" id="messageId" type="hidden" />
										<input type="button" value="削除" onclick="confirmDelete('${message.id}')" />
									</form>
								</td>
							</tr>
						</table>
					</c:if>
					<div class="comments">
						<c:forEach items="${comments}" var="comment">
							<c:if test="${ message.id == comment.messageId }">
								<div class="comment">
									<div class="account-name">
										<span class="account"><small><c:out value="${comment.account}" /></small></span>
										<span class="name"><c:out value="${comment.name}" /></span>
									</div>
									<div class="text">
										<pre><c:out value="${comment.text}" /></pre>
									</div>
									<div class="date">
										<fmt:formatDate value="${comment.createdDate}" pattern="yyyy/MM/dd HH:mm:ss" />
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<c:if test="${ isShowMessageForm }">
						<div class="form-area comment-form">
							<form action="comment" method="post">
								<small>返信</small><br />
								<input name="messageId" value="${message.id}" id="messageId" type="hidden" />
								<div class="form">
									<textarea style="box-sizing: border-box;" name="text"
										cols="100" rows="5" class="tweet-box"></textarea>
								</div>
								<br />
								<input type="submit" value="返信">
							</form>
						</div>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="copyright">Copyright(c)NishimuraYoshiki</div>
</body>
</html>