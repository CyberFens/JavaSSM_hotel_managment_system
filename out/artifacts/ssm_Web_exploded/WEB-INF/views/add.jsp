<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新增客房信息</title>
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
            width: 80%;
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h3 {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        td {
            padding: 10px;
        }
        td input[type="text"], td input[type="file"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        td input[type="submit"], td input[type="reset"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-default {
            background-color: #6c757d;
            color: #fff;
        }
        .btn-default:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>新增客房信息</h3>
    <form action="${pageContext.request.contextPath}/saveHotel" method="post" enctype="multipart/form-data">
        <table align="center">
            <tr>
                <td align="right">房间名称:</td>
                <td><input type="text" class="form-control" id="hotelname" name="hotelname"/></td>
            </tr>
            <tr>
                <td align="right">价格：</td>
                <td><input type="text" id="price" class="form-control" name="price"/></td>
            </tr>
            <tr>
                <td align="right">图片：</td>
                <td><input type="file" id="imageFile" class="form-control" name="imageFile"/></td>
            </tr>
            <tr>
                <td align="right">介绍：</td>
                <td><input type="text" id="introduction" name="introduction"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-primary" type="submit" value="提交"/>
                    <input class="btn btn-default" type="reset" value="重置"/>
                    <input class="btn btn-default" type="reset" value="返回" onclick="history.go(-1)"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
