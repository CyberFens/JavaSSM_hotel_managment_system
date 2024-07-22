<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改客房信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
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
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            width: 50%;
            text-align: center;
        }
        h3 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }
        td {
            padding: 10px;
            vertical-align: middle;
        }
        td input[type="text"], td input[type="file"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        td input[type="submit"], td input[type="reset"] {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        td input[type="submit"] {
            background-color: #007bff;
            color: #fff;
        }
        td input[type="reset"] {
            background-color: #6c757d;
            color: #fff;
        }
        td img {
            max-width: 100%;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h3>修改客房信息</h3>

    <form action="${pageContext.request.contextPath}/updateHotel" method="post" enctype="multipart/form-data">
        <input type="hidden" name="hotelid" value="${hotel.hotelid}"/>
        <table>
            <tr>
                <td align="right">房间名称:</td>
                <td><input type="text" class="form-control" id="hotelid" name="hotelid" value="${hotel.hotelid}" disabled/></td>
            </tr>
            <tr>
                <td align="right">房间名称:</td>
                <td><input type="text" value="${hotel.hotelname}" id="hotelname" name="hotelname"/></td>
            </tr>
            <tr>
                <td align="right">价格：</td>
                <td><input type="text" id="price" value="${hotel.price}" name="price"/></td>
            </tr>
            <tr>
                <td align="right">图片：</td>
                <td>
                    <img src="${pageContext.request.contextPath}/images/${hotel.image}"/>
                    <br/><input type="file" id="imageFile" class="form-control" name="imageFile"/>
                </td>
            </tr>
            <tr>
                <td align="right">介绍：</td>
                <td><input type="text" id="introduction" width="200px" value="${hotel.introduction}" name="introduction"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-primary" type="submit" value="提交"/>
                    <input class="btn btn-default" type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
