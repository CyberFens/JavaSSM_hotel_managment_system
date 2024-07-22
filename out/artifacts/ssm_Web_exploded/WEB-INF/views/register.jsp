<%--
  Created by IntelliJ IDEA.
  User: mason
  Date: 2024/5/7
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/jiudian12.jpg');
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

        form {
            max-width: 300px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            border-radius: 3px;
            font-size: 14px;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
    <script>
        function validateForm() {
            //获取输入值并去除空白字符
            var uname = document.getElementById('uname').value.trim();
            var upwd = document.getElementById('upwd').value.trim();
            var usex = document.getElementById('usex').value.trim();
            var age = document.getElementById('age').value.trim();

            if (uname === '' || upwd === '' || usex === '' || age === '') {
                alert('请填写所有必填字段！');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="main-title">注册用户</div>
<form action="${pageContext.request.contextPath}/register" onsubmit="return validateForm()" method="post">
    <h2 style="color: red">${message}</h2>
    <label for="uname">用户名：</label><br>
    <input type="text" id="uname" name="uname"><br>
    <label for="upwd">密码：</label><br>
    <input type="password" id="upwd" name="upwd"><br>
    <label for="usex">性别：</label><br>
    <input type="text" id="usex" name="usex"><br>
    <label for="age">身份证号：</label><br>
    <input type="number" id="age" name="age"><br>
    <button type="submit">注册</button> <span style="margin-left: 20px"><a href="${pageContext.request.contextPath}/userlogin">去登录</a></span>
</form>
</body>
</html>
