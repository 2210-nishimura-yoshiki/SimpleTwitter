<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ログイン</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="main-contents">
		<div class="header">
			<a href="./">ホーム</a>
		</div>

		<c:if test="${ not empty errorMessages }">
			<div class="errorMessages">
				<ul>
					<c:forEach items="${errorMessages}" var="errorMessage">
						<li><c:out value="${errorMessage}" />
					</c:forEach>
				</ul>
			</div>
		</c:if>

		<div class="form-area">
			<form action="login" method="post">
				<div class="form-group">
					<label for="accountOrEmail">アカウント名かメールアドレス</label> <input
						type="text" name="accountOrEmail" id="accountOrEmail" />
				</div>

				<div class="form-group">
					<label for="password">パスワード</label> <input type="password"
						name="password" id="password" />
				</div>

				<input type="submit" value="ログイン" class="button" /> <a href="./"
					class="button secondary">戻る</a>
			</form>
		</div>

		<div class="copyright">Copyright(c)YourName</div>
	</div>
</body>
</html>