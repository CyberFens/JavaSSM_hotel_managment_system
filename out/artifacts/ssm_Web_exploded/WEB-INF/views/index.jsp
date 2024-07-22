<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2024/6/5
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客栈预定系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            text-align: center;
            margin-top: 50px;
        }
        h2 {
            color: #2e8b57;
            font-size: 2em;
            margin-bottom: 20px;
        }
        form {
            display: inline-block;
            margin-top: 20px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>欢迎来到客栈预定系统</h2>
<form action="/list">
    <button type="submit">点击进入预定系统</button>
</form>
</body>
</html>
