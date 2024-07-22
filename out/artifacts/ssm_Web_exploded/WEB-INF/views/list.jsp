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
    <div><h3>展示所有客房信息</h3></div>
    <c:if test="${sessionScope.LoginUser!=null}">
    <div style="text-align: right;"><span><a href="/userLogout">退出</a></span></div>
    </c:if>
    <div style="text-align: left;">
        <form action="${pageContext.request.contextPath}/list" method="get">
            请输入房间号:<input style="margin-right: 10px;" type="text" name="hotelid"/>
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
                <td><img src="${pageContext.request.contextPath}/images/${hotel.image}"/></td>
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
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/list?pageNum=${currentPage - 1}">&laquo; 上一页</a>
        </c:if>
        <c:forEach var="page" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${page == currentPage}">
                    <span class="current">${page}</span>
                </c:when>
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
