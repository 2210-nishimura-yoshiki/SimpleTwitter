<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ユーザー登録</title>
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
            <form action="signup" method="post">
                <div class="form-group">
                    <label for="name">名前</label>
                    <input type="text" name="name" id="name" />
                    <small>（名前はあなたの公開プロフィールに表示されます）</small>
                </div>

                <div class="form-group">
                    <label for="account">アカウント名</label>
                    <input type="text" name="account" id="account" />
                </div>

                <div class="form-group">
                    <label for="password">パスワード</label>
                    <input type="password" name="password" id="password" />
                </div>

                <div class="form-group">
                    <label for="email">メールアドレス</label>
                    <input type="email" name="email" id="email" />
                </div>

                <div class="form-group">
                    <label for="description">説明</label>
                    <textarea name="description" cols="35" rows="5" id="description"></textarea>
                </div>

                <input type="submit" value="登録" class="button" />
                <a href="./" class="button secondary">戻る</a>
            </form>
        </div>

        <div class="copyright">Copyright(c)NishimuraYoshiki</div>
    </div>
</body>
</html>