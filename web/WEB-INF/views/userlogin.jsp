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
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/jiudian2.jpg');
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
        }

        .container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            max-width: 800px;
            width: 100%;
            flex-direction: column;
            align-items: center;
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

        .form-container {
            display: flex;
            gap: 20px;
            width: 100%;
            justify-content: space-between;
        }

        .login-form {
            width: 300px;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            flex: 1;
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

        .login-form .form-title {
            text-align: center;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .login-form input:invalid {
            border-color: #ff0000;
        }

        .login-form input:invalid + span {
            color: #ff0000;
            font-size: 12px;
            margin-left: 5px;
        }

        .message {
            text-align: center;
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .additional-forms {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="main-title">欢迎来到城航酒店</div>
    <div class="form-container">
        <div class="login-form">
            <div class="form-title">用户登录</div>
            <h2 class="message">${message}</h2>
            <form action="${pageContext.request.contextPath}/userlogin" method="post">
                <input type="text" name="username" placeholder="用户名" required>
                <br>
                <input type="password" name="userpassword" placeholder="密码" required>
                <br>
                <button type="submit">提交</button>
            </form>
        </div>

        <div class="login-form">
            <div class="additional-forms">
                <div>
                    <div class="form-title">管理员登录</div>
                    <form action="adminlogin">
                        <button type="submit">进入后台</button>
                    </form>
                </div>
                <div>
                    <div class="form-title">注册用户</div>
                    <form action="register">
                        <button type="submit">注册</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
