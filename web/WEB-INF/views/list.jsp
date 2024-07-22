<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客房信息展示</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h3 {
            margin-top: 0;
            color: #333;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header a {
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .header a:hover {
            background-color: #0056b3;
        }
        form {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-bottom: 20px;
        }
        form input[type="text"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }
        form input[type="submit"] {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
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
            font-weight: bold;
        }
        td img {
            max-width: 100px;
            height: auto;
            border-radius: 5px;
        }
        .pagination {
            margin: 20px 0;
            text-align: center;
        }
        .pagination a {
            text-decoration: none;
            color: #007bff;
            padding: 5px 10px;
            border: 1px solid #ddd;
            margin: 0 2px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
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
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <div><h3>展示所有客房信息</h3></div>
    <c:if test="${sessionScope.LoginUser!=null}">
        <div style="text-align: right;"><span><a href="/userLogout">退出</a></span></div>
        <!-- 标签用于条件渲染，如果用户已经登录（即 sessionScope.LoginUser 不为 null），则显示 "退出" 链接 -->
    </c:if>
    <div style="text-align: left;">
        <form action="${pageContext.request.contextPath}/list" method="get">
            请输入房间号:<input type="text" name="hotelid"/>
            <input type="submit" value="查询">
        </form>
    </div>
    <table>
        <tr>
            <th width="10%"></th>
            <th width="10%">房间号</th>
            <th width="20%">房间名称</th>
            <th width="10%">价格</th>
            <th width="30%">介绍</th>
            <th width="20%">操作</th>
        </tr>
        <c:forEach var="hotel" items="${allHotels}">
            <tr>
                <td><img src="${pageContext.request.contextPath}/images/${hotel.image}" alt="${hotel.hotelname}"/></td>
                <td>${hotel.hotelid}</td>
                <td>${hotel.hotelname}</td>
                <td>${hotel.price}</td>
                <td style="text-align: left">${hotel.introduction}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/orderHotel?id=${hotel.hotelid}">预定</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="pagination">
        <!-- 如果当前页码大于1，则显示“上一页”链接 -->
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/list?pageNum=${currentPage - 1}">&laquo; 上一页</a>
            <!-- &laquo：左双箭头 -->
        </c:if>
        <!-- 显示页码 -->
        <c:forEach var="page" begin="${startPage}" end="${endPage}">
            <c:choose>
                <!-- 如果页码等于当前页码，则显示为不可点击的当前页 -->
                <c:when test="${page == currentPage}">
                    <span class="current">${page}</span>
                </c:when>
                <!-- 否则，显示为可点击的链接 -->
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/list?pageNum=${page}">${page}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="${pageContext.request.contextPath}/list?pageNum=${currentPage + 1}">下一页 &raquo;</a>
        </c:if>
    </div>
</div>
</body>
</html>
