<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        h2 {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<div style="text-align: right">
    <b>
        Chào  <span style="color: blue">${user.username}</span> | <a href="logout">Thoát</a>
    </b>
</div>
<h1>${item.description}</h1>
<table>
    <thead>
        <tr>
            <th style="width: 50%">

            </th>
            <th style="width: 50%">
                <h2>Thông tin người bán</h2>
            </th>
        </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <c:set value="${item.bids.size()}" var="bidsSize"/>
            <div><b>Giá hiện tại: </b><fmt:formatNumber value="${item.currentPrice}" type="currency" currencySymbol="VND"/></div>
            <div><b>Người đặt: </b> <a href="">${item.bids[bidsSize -1].bidder.username}</a> (có ${bidsSize} đặt giá)</div>
            <div><b>Giá khởi điểm: </b><fmt:formatNumber value="${item.initialPrice}" type="currency" currencySymbol="VND"/></div>
            <div><b>Bước giá: </b><fmt:formatNumber value="${item.priceStep}" type="currency" currencySymbol="VND"/></div>
            <div style="color: red"><b>Bắt đầu lúc: <fmt:formatDate value="${item.startDate.time}"  pattern = "HH:mm:ss dd/MM/yyyy"/></b></div>
            <div><b>Kết thúc lúc: </b> <fmt:formatDate value="${item.endDate.time}"  pattern = "HH:mm:ss dd/MM/yyyy"/></div>
            <div><b>Thời gian còn: </b>${item.getDuration()}</div>
            <form action="bid-action" method="post">
                <label><b>Giá đặt: </b></label>
                <input name="id" value="${item.id}" hidden>
                <c:if test="${item.currentPrice == 0}">
                    <c:set var="amount" value="${item.initialPrice + item.priceStep}"/>
                </c:if>
                <c:if test="${item.currentPrice != 0}">
                    <c:set var="amount" value="${item.currentPrice + item.priceStep}"/>
                </c:if>
                <input type="number" name="amount" id="amount" min="${amount}">
                <span> >=
            <fmt:formatNumber value="${amount}" type="currency" currencySymbol=""/>
        </span><br><br>
                <button>Đặt giá</button>
            </form>
        </td>
        <td>
            <c:set var="seller" value="${item.seller}"/>
            <div><b>Tên người bán: </b> <a href="">${seller.username}</a></div>
            <div><b>Tên cửa hàng: </b>${seller.fullName}</div>
            <div><b>Điện thoại: </b>${seller.phone}</div>
            <div><b>Email: </b><a href="">${seller.email}</a></div>
            <div><b>Địa chỉ: </b>${seller.address}</div>
        </td>
    </tr>
    </tbody>
</table>
<a href="list-items">Danh sách đấu giá</a>
</body>
</html>
