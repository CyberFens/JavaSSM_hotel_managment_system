<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>客房预定展示</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    .container {
      width: 80%;
      margin: 0 auto;
      text-align: center;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h3 {
      margin-top: 0;
    }
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .header a {
      text-decoration: none;
      color: #fff;
      background-color: #007bff;
      padding: 10px 20px;
      border-radius: 5px;
    }
    .header a:hover {
      background-color: #0056b3;
    }
    form {
      text-align: left;
      margin-bottom: 20px;
    }
    form input[type="text"] {
      padding: 5px;
    }
    form input[type="submit"] {
      padding: 5px 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
    }
    form input[type="submit"]:hover {
      background-color: #0056b3;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    table, th, td {
      border: 1px solid #ddd;
    }
    th, td {
      padding: 10px;
      text-align: center;
    }
    th {
      background-color: #f2f2f2;
    }
    td img {
      max-width: 100px;
    }
    .pagination {
      margin: 20px 0;
    }
    .pagination a {
      text-decoration: none;
      color: #007bff;
      padding: 5px 10px;
      border: 1px solid #ddd;
      margin: 0 2px;
    }
    .pagination a:hover {
      background-color: #007bff;
      color: #fff;
    }
    .pagination .current {
      padding: 5px 10px;
      border: 1px solid #ddd;
      background-color: #007bff;
      color: #fff;
      margin: 0 2px;
    }
  </style>
</head>
<body>
<div class="container">
  <div><h3>客房预定</h3></div>
  <div><h2 style="color: red;padding: 2px;">${message}</h2></div>

  <div style="text-align: center;">
   <a href="/list">回首页</a>
  </div>
</div>
</body>
</html>
