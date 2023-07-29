<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listrequestbyme
    Created on : Jul 16, 2023, 5:05:05 PM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Request</title>
        <link rel="stylesheet" href="assets/css/listrequestbyme.css"/>
        <link rel="icon" href="temp/logo2.png">
        <jsp:useBean id="a" class="dao.requestDAO" scope = "request"></jsp:useBean>
        </head>

        <style>
            .title {
                height: 90px;
                width: 550px;
                color: white;
                background-color: #175E4C;
                text-align: center;
                border-radius: 46px;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 30px;
            }

            .outer {
                display: flex;
                justify-content: center;
            }

            .num {
                margin: 15px 0px;
                height: 31px;
                width: 333px;
                color: white;
                border-radius: 14px;
                background-color: #175E4C;
                text-align: center;
                font-size: 70px;
            }

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

        </style>

        <body>
        <jsp:include page="../home/header.jsp"/>

        <div class="header_fixed" style="min-height: 54vh;">
            <div class="outer">
                <div class="title">
                    <h1>List Request</h1>
                </div>
            </div>
            <div class="num">
                <h4>Total number of requests: ${sum}</h4>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Skill</th>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Finish Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>                   
                    <c:set var="menteeid" value="${sessionScope.acc.user_id}" />
                    <c:forEach begin="0" end="${lista.size()-1}" step="1" var="i">
                        <tr>
                            <td>${lista.get(i).request_id}</td>
                            <td>
                                <c:forEach items="${lista.get(i).getSkill_name()}" var="s">
                                    <img src="${s.skill_img}">
                                </c:forEach>
                            </td>
                            <td>${lista.get(i).title}</td>
                            <td>${lista.get(i).request_content}</td>
                            <td>${lista.get(i).finish_date}</td>
                            <c:choose>
                                <c:when test="${lista.get(i).request_status == 1}">
                                    <td>
                                        Open
                                    </td>
                                    <td>                                                                                                                                                                                
                                        <a href="updateRequest?request_id=${lista.get(i).request_id}&mentor_id=${lista.get(i).mentor_id}"><button>Update</button></a>
                                        <a href="listrequestbyme1?idCancel=${lista.get(i).request_id}"><button>Cancel</button></a>
                                    </td>
                                </c:when>
                                <c:when test="${lista.get(i).request_status == 2}">
                                    <td>
                                        Processing
                                    </td>
                                    <td>                                        
                                    </td>
                                </c:when>
                                <c:when test="${lista.get(i).request_status == 3}">
                                    <td>
                                        Cancel
                                    </td>
                                    <td>
                                        <a href="listrequestbyme1?idDel=${lista.get(i).request_id}"><button>Delete</button></a>
                                    </td>
                                </c:when>
                                <c:when test="${lista.get(i).request_status == 4}">
                                    <td>
                                        Closed
                                    </td>
                                    <td>
                                        <a href="listrequestbyme1?idAcc=${lista.get(i).request_id}"><button>Accept</button></a>
                                        <a href="listrequestbyme1?idRej=${lista.get(i).request_id}"><button>Reject</button></a>
                                    </td>
                                </c:when>
                                <c:when test="${lista.get(i).request_status == 5}">
                                    <td>
                                        Finish
                                    </td>
                                    <td>                                        
                                    </td>
                                </c:when>
                                <c:otherwise></c:otherwise>
                            </c:choose>
                        </tr>      
                    </c:forEach>  
                </tbody>
            </table>

        </div>
        <div class="pagination-custom" style="margin-bottom: 20px; margin-left: 15px">
            <!-- So trang dang dung JspUseBean: Doi tuong cua class CVDAO -->
            <c:forEach begin="1" end="${a.getNumberPage4(menteeid)}" var = "i">
                <!-- Lay ra vi tri trang dang dung -->
                <a href="listrequestbyme1?index=${i}" class="${indexPagee == i ?  "active" : ""}">${i}</a>
            </c:forEach>
        </div>
        <jsp:include page="../home/footer.jsp"/>
    </body>

</html>