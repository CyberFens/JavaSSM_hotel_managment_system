<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2024/6/11
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间详情</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .detail {
            margin: 10px 0;
        }
        .label {
            font-weight: bold;
        }
        .value {
            color: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>查找一个房间</h1>
    <div class="detail">
        <span class="label">房间号：</span>
        <span class="value">${hotel.hotelid}</span>
    </div>
    <div class="detail">
        <span class="label">房间名：</span>
        <span class="value">${hotel.hotelname}</span>
    </div>
    <div class="detail">
        <span class="label">价格：</span>
        <span class="value">${hotel.price}</span>
    </div>
    <div class="detail">
        <span class="label">介绍：</span>
        <span class="value">${hotel.introduction}</span>
    </div>
</div>
</body>
</html>
