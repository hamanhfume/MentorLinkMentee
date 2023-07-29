<%-- 
    Document   : skill
    Created on : Jun 11, 2023, 7:16:08 PM
    Author     : msi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Dashboard </title>
        <!-- <link rel="stylesheet" href="../assets/css/styledashboard.css" /> -->
        <style>
            /*  import google fonts */
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
            *{
                margin: 0;
                padding: 0;
                outline: none;
                border: none;
                text-decoration: none;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }
            body{
                background: rgb(226, 226, 226);
            }
            nav{
                position: sticky;
                top: 0;
                bottom: 0;
                height: 100vh;
                left: 0;
                width: 90px;
                /* width: 280px; */
                background: #fff;
                overflow: hidden;
                transition: 1s;
            }
            nav:hover{
                width: 280px;
                transition: 1s;
            }
            .logo{
                text-align: center;
                display: flex;
                margin: 10px 0 0 10px;
                padding-bottom: 3rem;
            }

            .logo img{
                width: 45px;
                height: 45px;
                border-radius: 50%;
            }
            .logo span{
                font-weight: bold;
                padding-left: 15px;
                font-size: 15px;
                text-transform: uppercase;
            }
            a{
                position: relative;
                width: 280px;
                font-size: 16px;
                color: rgb(85, 83, 83);
                display: table;
                padding: 10px;
            }
            nav .fas{
                position: relative;
                width: 70px;
                height: 40px;
                top: 20px;
                font-size: 20px;
                text-align: center;
            }
            .nav-item{
                position: relative;
                top: 12px;
                margin-left: 10px;
            }
            a:hover{
                background: #eee;
            }
            a:hover i{
                color: #34AF6D;
                transition: 0.5s;
            }
            .logout{
                position: absolute;
                bottom: 0;
            }

            .container{
                display: flex;
            }

            /* MAin Section */
            .main{
                position: relative;
                padding: 20px;
                width: 100%;
            }
            .main-top{
                display: flex;
                width: 100%;
            }
            .main-top i{
                position: absolute;
                right: 0;
                margin: 10px 30px;
                color: rgb(110, 109, 109);
                cursor: pointer;
            }
            .main .users{
                display: flex;
                width: 100%;
            }
            .users .card{
                width: 25%;
                margin: 10px;
                background: #fff;
                text-align: center;
                border-radius: 10px;
                padding: 10px;
                box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
            }
            .users .card img{
                width: 70px;
                height: 70px;
                border-radius: 50%;
            }
            .users .card h4{
                text-transform: uppercase;
            }
            .users .card p{
                font-size: 12px;
                margin-bottom: 15px;
                text-transform: uppercase;
            }
            .users table{
                margin:  auto;
            }
            .users .per span{
                padding: 5px;
                border-radius: 10px;
                background: rgb(223, 223, 223);
            }
            .users td{
                font-size: 14px;
                padding-right: 15px;
            }
            .users .card button{
                width: 100%;
                margin-top: 8px;
                padding: 7px;
                cursor: pointer;
                border-radius: 10px;
                background: transparent;
                border: 1px solid #4AD489;
            }
            .users .card button:hover{
                background: #4AD489;
                color: #fff;
                transition: 0.5s;
            }

            /*Attendance List serction  */
            .attendance{
                margin-top: 20px;
                text-transform: capitalize;
            }
            .attendance-list{
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
            }
            .table{
                border-collapse: collapse;
                margin: 10px 0;
                font-size: 15px;
                min-width: 100%;
                overflow: hidden;
                border-radius: 5px 5px 0 0;
            }
            table thead tr{
                color: #fff;
                background: #34AF6D;
                text-align: left;
                font-weight: bold;
                font-size: 15px;

            }
            .table th,
            .table td {
                padding: 13px 15px;

            }


            .table tbody tr{
                border-bottom: 1px solid #ddd;

            }
            .table tbody tr:nth-of-type(odd){
                background: #f3f3f3;
            }
            .table tbody tr.active{
                font-weight: bold;
                color: #4AD489;
            }
            .table tbody tr:last-of-type{
                border-bottom: 2px solid #4AD489;
            }
            .table button{
                padding: 6px 20px;
                border-radius: 10px;
                cursor: pointer;
                background: transparent;
                border: 1px solid #4AD489;
            }
            .table button:hover{
                background: #4AD489;
                color: #fff;
                transition: 0.5rem;
            }

            .element {
                max-width: 80px;
                max-height: 100px;
            }


            /* Add these styles to your CSS file */

            /* Change color scheme */

            .add-skill-box {
                background-color: #f1f1f1;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            .form-group {
                margin-bottom: 10px;
            }

            label {
                display: inline-block;
                width: 100px;
            }

            input[type="text"], select {
                padding: 5px;
                font-size: 16px;
                border-radius: 3px;
                border: 1px solid #ddd;
            }

            button[type="submit"] {
                padding: 8px 16px;
                background-color: #006400; /* Green color */
                color: #fff;
                border: none;
                border-radius: 3px;
                font-size: 16px;
                cursor: pointer;
            }

            /* Evenly spaced layout */
            #add-skill-popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
                z-index: 9999;
            }

            .add-skill-box {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 80%;
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.2);
                z-index: 99999;
            }

            /* Adjust spacing */
            .add-skill-box .form-group label {
                width: 25%; /* Increase the width of the labels */
                text-align: right; /* Align the labels to the right */
                padding-right: 1em; /* Add some spacing between labels and input fields */
            }

            .add-skill-box .form-group input[type="text"],
            .add-skill-box .form-group select {
                width: 70%; /* Reduce the width of input fields */
                margin-left: 1em; /* Add some spacing between labels and input fields */
            }

            #add-skill-popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
                z-index: 9999;
            }

            #add-dash-boash-popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
                z-index: 9999;
            }
            .custom-button {
                font-size: 15px;
                background-color: #006400;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }

            .custom-button:hover {
                background-color: #228B22;
            }
            .list-all{
                text-align: center;
                font-size: 30px;
                color: forestgreen
            }



            .btn {
                display: inline-block;
                padding: 0.3rem 0.6rem; /* Giảm kích thước nút */
                border-radius: 0.25rem;
                font-size: 1rem;
                line-height: 1.5;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
                cursor: pointer;
                transition: all 0.1s ease;
            }

            .btn-success {
                color: #fff;
                background-color: #28a745;
                border-color: #28a745;
            }

            .btn-danger {
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545;
            }

            /* Nút hover */
            .btn:hover {
                opacity: 0.8; /* Thêm hiệu ứng opacity */
            }

            .btn-success:hover {
                background-color: #218838; /* Thay đổi màu nền khi hover */
                border-color: #1e7e34; /* Thay đổi màu viền khi hover */
            }

            .btn-danger:hover {
                background-color: #c82333; /* Thay đổi màu nền khi hover */
                border-color: #bd2130; /* Thay đổi màu viền khi hover */
            }


            form {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            input[type="text"] {
                padding: 10px;
                border-radius: 5px;
                border: none;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            }

            button[type="submit"] {
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px;
                margin-left: 10px;
                cursor: pointer;
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

        <!-- Font Awesome Cdn Link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

        <!-- Dung cho phan Trang: Doi tuong cua class MentorCVDAO. De dung instance method class  MentorCVDAO-->
        <jsp:useBean id="a" class="dao.MentorCVDAO" scope = "request"></jsp:useBean>
        </head>
        <body>


        <c:if test="${sessionScope.acc != null}">
            <div class="container">
                <nav>
                    <ul>
                        <li><a href="#" class="logo">
                                <img src="assets/images/avatar.jpg">
                                <span class="nav-item">Admin</span>
                            </a></li>
                        <li><a href="skill">
                                <i class="fas fa-database"></i>
                                <span class="nav-item">List-All-Skill</span>
                            </a></li>
                        <li><a href="listmentor">
                                <i class="fas fa-chart-bar"></i>
                                <span class="nav-item">List-All-Mentor</span>
                            </a></li>
                        <li><a href="listmentee">
                                <i class="fas fa-chart-bar"></i>
                                <span class="nav-item">Statistic-Mentee</span>
                            </a></li>

                        <li><a href="logout" class="logout">
                                <i class="fas fa-sign-out-alt"></i>
                                <span class="nav-item">Log out</span>
                            </a></li>
                    </ul>
                </nav>

                <section class="main">
                    <section class="attendance">
                        <div class="attendance-list">

                            <form action="searchControl" method="get">
                                <input type="text" name="txtSearch" placeholder="Search by name ...">
                                <button type="submit" value="search">Search</button>
                            </form>   

                            <h1 class = "list-all">List All Mentor</h1>

                            <table class="table">
                                <thead >
                                <div> 
                                    <tr>
                                        <th>STT</th>
                                        <th>ID</th>
                                        <th>Full Name</th>
                                        <th>Account Name</th>
                                        <th>Profression</th>
                                        <th>Number Request</th>
                                        <th>Percent Done</th>
                                        <th>Rate Star</th>
                                        <th>Status</th>
                                    </tr>
                                </div>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listMentor}" var="o">
                                        <tr>
                                            <td>${o.stt}</td>
                                            <td>${o.id}</td>
                                            <td>${o.fullName}</td>
                                            <td>${o.accountName}</td>
                                            <td>${o.occupation}</td>
                                            <td>${o.numberOfCurrently}</td>
                                            <td>${o.percentageCompleted}</td>
                                            <td>${o.averageStarRating}</td>
                                            <td>
                                                <a href="updatestatusmentor?idmentor=${o.id}&stt=${o.stt}" class="btn btn-${o.activeStatusOfAdvisor == 1 ? 'success' : 'danger'} status-btn">
                                                    <c:choose>
                                                        <c:when test="${o.activeStatusOfAdvisor == 1}">
                                                            Active
                                                        </c:when>
                                                        <c:when test="${o.activeStatusOfAdvisor == 0}">
                                                            Inactive
                                                        </c:when>
                                                    </c:choose>
                                                </a>
                                            </td
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- Logic: SO LUONG TRANG -> MOI TRANG BAO NHIEU BAI -->
                            <!-- In ra so trang -->
                            <div class="pagination-custom">
                                <!-- So trang dang dung JspUseBean: Doi tuong cua class CVDAO -->
                                <c:forEach begin="1" end="${a.getNumberPage()}" var = "i">
                                    <!-- Lay ra vi tri trang dang dung -->
                                    <a href="listmentor?index=${i}" class="${indexPagee == i ?  "active" : ""}">${i}</a>
                                </c:forEach>
                            </div>

                        </div>
                    </section>
                </section>
            </div>
        </c:if>
    </body>
</html>

