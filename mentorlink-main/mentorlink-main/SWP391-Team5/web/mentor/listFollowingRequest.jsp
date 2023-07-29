<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listFollowingRequest
    Created on : Jun 14, 2023, 1:06:39 AM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Following Request</title>
        <link rel="stylesheet" href="assets/css/listFollowing.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />


        <style>
            .pagination-custom a {
                color: #333;
                text-decoration: none;
                padding: 8px 10px;
                margin: 0 5px;
                border: 1px solid #ddd;
                border-radius: 3px;
                display: inline-block;
                font-size: 12px;
                width: 2%;
            }

            .pagination-custom a:hover {
                background-color: #ddd;
            }

            .pagination-custom a.active {
                background-color: #1e7e34;
                color: #fff;
            }

            /* Luật CSS mới để áp dụng màu khác cho các nút có class "current" */
            .pagination-custom a.current {
                background-color: #ffffff;
                color: #333;
            }

            .status {
                height: 38px;
                color: white;
                width: auto;
                background-color: #198754;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

        </style>


        <jsp:useBean id="a" class="dao.requestDAO" scope = "request"></jsp:useBean>

        </head>
        <body>
        <jsp:include page="../home/header.jsp"/>


        <div class="container3">

            <section class="main" style="min-height: 70vh;">
                <section class="attendance">
                    <div class="attendance-list">
                        <h1 style="text-align: center;">List Following Request</h1>
                        <div style="text-align: center">
                            <h4 style="padding: 20px 0px;">${mess}</h4>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Content</th>
                                    <th>Skill</th>
                                    <th>Start Time</th>
                                    <th>Duration</th>
                                    <th>End Time</th>
                                    <th style="text-align: center;">Status</th>
                                    <th style="text-align: center;">Action</th>                                   
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="searchValue" value="${sessionScope.acc.user_id}" />
                                <c:set var="mentorId" value="${a.getNumberPage1(searchValue)}"/>
                                <c:forEach var="i" begin="0" end="${listR.size() - 1}" step="1">
                                    <tr>
                                        <td>${listR.get(i).request_id}</td>
                                        <td>${listR.get(i).getTitle()}</td>
                                        <td>${listR.get(i).getRequest_content()}</td>                                        
                                        <td>
                                            <c:forEach var="sk" items="${listR.get(i).getSkill_name()}">
                                                |  ${sk} | 
                                            </c:forEach>        
                                        </td>
                                        <td>${listR.get(i).getCreated_date()}</td>
                                        <td>${listR.get(i).getTime_study()}</td>
                                        <td>${listR.get(i).getFinish_date()}</td>
                                        <td>
                                            <c:if test="${listR.get(i).getRequest_status() == 1}">
                                                <div class="status">
                                                    <span>Open</span>
                                                </div>
                                            </c:if>
                                            <c:if test="${listR.get(i).getRequest_status() == 2}">
                                                <div class="status">
                                                    <span>Processing</span>
                                                </div>
                                            </c:if>
                                            <c:if test="${listR.get(i).getRequest_status() == 4}">
                                                <div class="status">
                                                    <span>Waiting</span>
                                                </div>
                                            </c:if>
                                        </td>
                                        <td>
                                            <div style="text-align: center;">
                                                <c:if test="${listR.get(i).getRequest_status() == 1}">
                                                    <form action="followingRequest" method="post" style="display: inline">
                                                        <button name="requestId_yes" value="${listR.get(i).getRequest_id()}">Accept</button>                                                   
                                                    </form>
                                                    <form action="followingRequest" method="post" style="display: inline">
                                                        <button name="requestId_no" value="${listR.get(i).getRequest_id()}">Reject</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${listR.get(i).getRequest_status() == 2}">
                                                    <form action="followingRequest" method="post" style="display: inline">
                                                        <button name="requestId_Fi" value="${listR.get(i).getRequest_id()}">Finish</button>                                                   
                                                    </form>                                                   
                                                </c:if>                                               
                                            </div>
                                        </td>                                          
                                    </tr>
                                </c:forEach>                                         
                            </tbody>
                        </table>
                        <div class="pagination-custom">
                            <!-- So trang dang dung JspUseBean: Doi tuong cua class CVDAO -->
                            <c:forEach begin="1" end="${mentorId}" var = "i">
                                <!-- Lay ra vi tri trang dang dung -->
                                <a href="followingRequest?index=${i}" class="${indexPagee == i ?  "active" : ""}">${i}</a>
                            </c:forEach>
                        </div>  

                    </div>
                </section> 

            </section>

        </div>
        <div id="footer">
            <jsp:include page="../home/footer.jsp"/>
        </div>
        <!--        <style>
                    #footer {
                        position: absolute;
                        left: 0;
                        bottom: 0;
                        width: 100%;
                    }
                </style>-->


    </body>
</html>
