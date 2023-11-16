<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 11/14/2023
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
 <style>
     h2 {
         text-align: center;
     }
     .login-container {
         margin: auto;
         width: 500px;
         border: 1px solid #000;
     }
     form {
         margin: 10px;
         padding: 10px;
     }
     input {
         width: 300px;
     }

 </style>
</head>
<body>
<div class="login-container">
    <h2>Đăng nhập</h2>
    <span style="color: red">${mess}</span>
    <form action="login" method="post">
        <table>
            <thead>
                <tr>
                    <td style="text-align: right"></td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <label for="username">Tên đăng nhập</label>
                    </td>
                    <td>
                        <input type="text" name="username" id="username" placeholder="" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="password">Mật khẩu</label>
                    </td>
                    <td>
                        <input type="password" name="password" id="password" placeholder="" required>
                    </td>
                </tr>
            <tr>
                <td></td>
                <td> <button type="submit">Đăng nhập</button></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
