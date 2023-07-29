<%-- 
    Document   : ListRequestByMe
    Created on : Jun 11, 2023, 5:03:53 PM
    Author     : damtu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 20px;
            }

            h1 {
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            tr:hover {
                background-color: #e9e9e9;
            }

            a {
                color: #337ab7;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            .total-row {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            .header-container {
                background-color: #f2f2f2;
                padding: 10px;
            }

            .title-container {
                margin-top: 20px;
            }

            .content-wrapper {
                margin-bottom: 20px;
                /* Thay đổi giá trị của margin-bottom tùy theo yêu cầu */
            }

            #footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: #f2f2f2;
                padding: 10px;
            }
        </style>



    </head>
    <body>

        <div class="header-container">
            <jsp:include page="../home/header.jsp"/>
        </div>

        <div class="title-container">  
            <h1>Request Information</h1>
        </div>
        <div style="display: flex; justify-content: space-between;">
            <h4 style="color: #828bb2; display: inline-block;">Tổng số Request:
                <c:set var="sum" scope="request" value="${sum}"/>
                <c:out value="${sum}"/>
            </h4>
            <h4 style="color: #828bb2; display: inline-block;">Tổng Thời Gian Học:
                <c:set var="sum_study" scope="request" value="${sum_study}"/>
                <c:out value="${sum_study}"/>
            </h4>
            <h4 style="color: #828bb2; display: inline-block;">Tổng số mentor:
                <c:set var="count" scope="request" value="${count}"/>
                <c:out value="${count}"/>
            </h4>
        </div>
        <div class="content-wrapper">
            <form >
                <table>
                    <tr>
                        <th>STT</th>

                        <th>Title</th>
                        <th>Nội dung yêu cầu</th>
                        <th>Thời gian học</th>
                        <th>Ngày tạo</th>
                        <th>Ngày hoàn thành</th>
                        <th>Trạng thái</th>
                        <th></th> 
                    </tr>

                    <c:forEach items="${lista}" var="o" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${o.title}</td>
                            <td>${o.request_content}</td>
                            <td>${o.time_study}</td> 
                            <td>${o.created_date}</td>
                            <td>${o.finish_date}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${o.request_status == 1}">Mở</c:when>
                                    <c:when test="${o.request_status == 2}">Đang xử lý</c:when>
                                    <c:when test="${o.request_status == 3}">Đóng</c:when>
                                    <c:when test="${o.request_status == 4}">Đã hoàn thành</c:when>
                                    <c:otherwise>Không xác định</c:otherwise>
                                    
                                </c:choose>
                            </td>
                            <td>
                                <a href="listRequestMenTee?idDel=${o.request_id}">Xóa</a>
                            </td>                       
                        </c:forEach>

                    </table>
                </form>
            </div>
            <div style="clear: both;"></div>
        <jsp:include page="../home/footer.jsp"/>
    </body>
</html>