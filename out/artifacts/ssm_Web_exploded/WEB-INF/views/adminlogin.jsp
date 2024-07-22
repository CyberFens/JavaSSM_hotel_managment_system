<%--
  Created by IntelliJ IDEA.
  User: mason
  Date: 2024/5/7
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/jiudain11.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
        }

        .main-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: white;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px 20px;
            border-radius: 5px;
        }

        .login-form {
            max-width: 300px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .login-form input[type="text"],
        .login-form input[type="password"],
        .login-form button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }

        .login-form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .login-form button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="main-title">管理员登录</div>
<div class="login-form">
    <form action="${pageContext.request.contextPath}/adminLogin" method="post">
        <h2 style="color: red;">${message}</h2>
        <label for="username">用户名：</label>
        <input type="text" id="username" name="username">
        <br>
        <label for="userpassword">密码：</label>
        <input type="password" id="userpassword" name="userpassword">
        <br>
        <button type="submit">提交</button>
    </form>
</div>
</body>
</html>
