<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 11/14/2023
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style>
    table {
    border-collapse: collapse;
    width: 100%;
    }

    th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
    }
    th {
        text-align: center;
    }
    </style>
</head>
<body>
  <div style="text-align: right">
    Chào mừng ${user.username} | <a href="logout">Thoát</a>
  </div>
 <h1>Danh mục các mặt hàng đấu giá </h1>
<table>
    <thead>
        <tr>
            <th>Mặt hàng</th>
            <th>Giá</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${listItems}">
            <tr>
                <td>
                    <a href="show-topic?id=${item.id}">${item.description}</a>
                </td>
                <td>
                    <span>Giá khởi đầu: <fmt:formatNumber value="${item.initialPrice}" type="currency" currencySymbol="VND"/></span><br>
                    <span>Giá hiện tại: <fmt:formatNumber value="${item.currentPrice}" type="currency" currencySymbol="VND"/></span><br>
                    <span>${item.bids.size()} lời đặt giá</span>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
