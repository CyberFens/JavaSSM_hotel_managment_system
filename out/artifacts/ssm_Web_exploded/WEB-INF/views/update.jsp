<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="container" style="width: 80%;text-align: center;">
    <center><h3>修改客房信息</h3></center>

    <form action="${pageContext.request.contextPath}/updateHotel" method="post" enctype="multipart/form-data">
        <input type="hidden" name="hotelid" value="${hotel.hotelid}"/>
        <table align="center" width="100%" border="1" cellpadding="1" cellspacing="1">
            <tr>
                <td align="right">房间名称:</td>
                <td><input type="text" class="form-control" id="hotelid" name="hotelid" value="${hotel.hotelid}" disabled/>
                </td>
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
                    <img style="max-width: 100%;" src="${pageContext.request.contextPath}/images/${hotel.image}"/>
                    <br/><input type="file" id="imageFile" class="form-control" name="imageFile"/></td>
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
