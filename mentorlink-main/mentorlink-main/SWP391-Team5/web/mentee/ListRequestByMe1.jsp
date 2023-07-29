<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Mentee" %>
<%@page import = "model.SkillMentee" %>
<%@page import = "dao.requestDAO" %>
<%@page import = "java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- css bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

        <title>Admin Dashboard | Mentee</title>
        <style>
            body {
                padding: 0;
                margin: 0;
                font-size: 14px;
                background: #f5f7f9;
            }
            a {
                text-decoration: none;
                transition: .5s;
            }
            h4 {
                font-size: 20px;
            }
            img {
                width: 35px;
                height: 35px;
                border-radius: 50%;
            }
            .btn_1:hover {
                background-color: #fff;
                border: 1px solid #313f5a;
                color: #2d1967;
            }
            .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing, .dataTables_wrapper .dataTables_paginate {
                color: #333;
            }
            .main_content_iner {
                min-height: 68vh;
                transition: .5s;
                margin: 20px 30px 30px;
            }
            .mb_30 {
                margin-bottom: 30px;
            }
            .mb_50 {
                margin-bottom: 50px;
            }
            .dashboard_header .dashboard_header_title h3 {
                font-size: 33px;
                font-weight: 600;
                color: #2e4765;
                margin-bottom: 7px;
            }

            .dashboard_breadcam p a {
                color: #6f658d;
                font-size: 16px;
                font-weight: 400;
                margin-bottom: 0;
            }
            .list_header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 25px;
                align-items: center;
            }
            .serach_field_2 {
                width: 430px;
                position: relative;
                margin-right: 0;
            }
            @media (min-width: 992px) and (max-width: 1199.98px) {
                .serach_field_2 {
                    width: 300px;
                }
            }
            .serach_field_2 .search_inner {
                width: 80%;
            }
            .serach_field_2 .search_inner button {
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                background: 0 0;
                font-size: 12px;
                border: 0;
                padding-left: 19px;
                padding-right: 11px;
            }
            .serach_field_2 .search_inner input {
                color: #000;
                font-size: 13px;
                height: 40px;
                width: 100%;
                border-radius: 5px;
                padding-left: 55px;
                border: 1px solid #2d1967;
                padding-right: 15px;
            }
            .serach_field_2 .search_inner button i {
                font-size: 12px;
                color: #2d1967;
            }
            .serach_field_2 .search_inner button::before {
                position: absolute;
                width: 1px;
                height: 24px;
                content: '';
                background: #2d1967;
                top: 50%;
                transform: translateY(-50%);
                right: 0;
            }
            .btn_1 {
                background-color: #2d1967;
                border: 1px solid #2d1967;
                color: #fff;
                display: inline-block;
                padding: 11px 23px;
                text-transform: capitalize;
                line-height: 16px;
                font-size: 13px;
                font-weight: 500;
                border-radius: 5px;
                white-space: nowrap;
                transition: .5s;
            }
            table.dataTable {
                width: 100%!important;
                margin: 0 auto;
                clear: both;
                border-collapse: separate;
                border-spacing: 0;
            }
            table.dataTable.no-footer {
                border-bottom: 0 solid transparent;
            }
            .QA_section .QA_table .table {
                background: #fff;
                border-radius: 10px;
                margin-bottom: 35px;
                padding-top: 20px;
            }
            .QA_section .QA_table .table {
                margin-bottom: 0!important;
            }
            .dataTables_wrapper .dataTables_info {
                clear: both;
                float: left;
                padding-top: 0.755em;
            }
            .dataTables_paginate {
                margin-top: 0;
                margin-top: 30px;
            }
            .dataTables_wrapper .dataTables_paginate {
                float: right;
                text-align: right;
                padding-top: 0.25em;
            }
            #DataTables_Table_0_info {
                font-size: 14px;
                color: #415094;
                font-weight: 400;
                margin-top: 35px;
                padding-top: 0;
            }
            /* arrow style */
            [class^=ti-], [class*=" ti-"] {
                font-family: themify;
                speak: none;
                font-style: normal;
                font-weight: 400;
                font-variant: normal;
                text-transform: none;
                line-height: 1;

            }
            .dataTables_paginate a i {
                line-height: 32px;
                font-size: 12px;
                color: #415094;
            }
            .dataTables_paginate a {
                width: 32px;
                height: 32px;
                background: #fff!important;
                border-radius: 3px!important;
                text-align: center!important;
                line-height: 32px;
                padding: 0!important;
                margin: 0!important;
                margin: 0 5px!important;
            }
            .dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
                cursor: default;
                color: #666 !important;
                border: 1px solid transparent;
                background: transparent;
                box-shadow: none;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button {
                box-sizing: border-box;
                display: inline-block;
                min-width: 1.5em;
                padding: 0.5em 1em;
                margin-left: 2px;
                text-align: center;
                text-decoration: none !important;
                cursor: pointer;
                *cursor: hand;
                color: #333 !important;
                border: 1px solid transparent;
                border-radius: 2px;
            }
            .dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
                cursor: default;
                color: #fff!important;
                border: 0;
            }
            .dataTables_paginate a.current {
                background: #ff4409!important;
                box-shadow: 0 5px 10px rgba(59,118,239,.3)!important;
                border: 0!important;
                color: #fff!important;
            }
            /* paginate span */
            .dataTables_paginate a.current {
                background: #ff4409!important;
                box-shadow: 0 5px 10px rgba(59,118,239,.3)!important;
                border: 0!important;
                color: #fff!important;
            }
            .dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
                color: #fff !important;
                border: 1px solid #ff3b00;
                background-color: #ff3b00 !important;
            }
            .dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
                color: #fff!important;
                border: 1px solid #ff4409;
                background-color: #ff4409!important;
            }
            /* table */
            .table>thead {
                vertical-align: bottom;
            }
            .QA_section .QA_table .table thead th:first-child {
                border-radius: 15px 0 0 15px;
            }
            .QA_section .QA_table .table thead th {
                border-bottom: 0 solid transparent;
                background-color: #fff;
                padding: 17px 30px;
                line-height: 16px;
                border: 0 solid transparent;
                font-size: 16px;
                font-weight: 400;
                color: #2f90f7;
                white-space: nowrap;
                text-transform: capitalize;
                font-family: barlow,sans-serif;
                border: 0;
                background: #f2f9ff;
                border: 0!important;
            }
            .table>tbody {
                vertical-align: inherit;
            }
            .QA_section .QA_table tbody tr {
                transition: .3s;
            }
            .QA_section .QA_table tbody tr:hover {
                background: #fff;
            }
            .QA_section .QA_table th, .QA_section .QA_table td {
                font-size: 13px;
                font-weight: 400;
                line-height: 1.9;
                color: #222;
                padding: 16px 30px;
                vertical-align: middle;
            }
            .QA_section .QA_table tbody th {
                font-size: 14px;
                color: #415094;
                font-weight: 400!important;
            }
            .QA_section .QA_table tbody th, .QA_section .QA_table tbody td {
                color: #7e7172;
                font-size: 14px;
                color: #828bb2;
                font-weight: 400;
                border-bottom: 1px solid #f5f7f9;
            }
            .status_btn {
                display: inline-block;
                padding: 2px 15px;
                font-size: 11px;
                font-weight: 300;
                color: #fff!important;
                background: #05d34e;
                border-radius: 30px;
                text-transform: capitalize;
                white-space: nowrap;
                min-width: 70px;
                text-align: center;
            }
            .status_btn1 {
                display: inline-block;
                padding: 2px 15px;
                font-size: 11px;
                font-weight: 300;
                color: #fff!important;
                background: #242625;
                border-radius: 30px;
                text-transform: capitalize;
                white-space: nowrap;
                min-width: 70px;
                text-align: center;
            }
            .QA_section .QA_table tbody th a, .QA_section .QA_table tbody td a {
                font-size: 14px;
                font-weight: 400;
                color: #828bb2;
            }
        </style>
    </head>
    <body>
        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="dashboard_header mb_50">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="dashboard_header_title">
                                        <h3> List Request By Me</h3>
                                        <h4 style="color: #828bb2">Tổng số Request: 
                                            <c:set var = "sum" scope = "request" value = "${sum}"/>
                                            <c:out value = "${sum}"/>
                                        </h4>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="dashboard_breadcam text-end">
                                        <p><a href="dashboard">Dashboard</a> <i class="fas fa-caret-right"></i> List-All-Request</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="QA_section">
                            <div class="white_box_tittle list_header">
                                <h4>List Request</h4>

                                <div class="box_right d-flex lms_block">
                                    <form action="listmentee" method="POST">
                                        <div class="serach_field_2 d-flex">
                                            <div class="search_inner">
                                                <form action="listmentee" method="POST">
                                                    <div class="search_field">
                                                        <input type="text" placeholder="Search mentee here..." name="search">
                                                    </div>
                                                    <button type="submit"> <i class="fa-solid fa-magnifying-glass"></i> </button>
                                                </form>
                                            </div>
                                            <button type="submit" style="margin-left: 20px;" class="btn_1">Search </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="QA_table mb_30">

                                <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer"><table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1531px;">
                                        <thead>
                                            <tr role="row">
                                                <th scope="col" class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 137px;" aria-label="title: activate to sort column ascending">Title</th>
                                                <th scope="col" class="sorting_asc" tabindex="0" rowspan="1" colspan="1" style="width: 192px;" aria-label="Category: activate to sort column descending" aria-sort="ascending">Request Content</th>
                                                <th scope="col" class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 194px;" aria-label="Teacher: activate to sort column ascending">Create date</th>
                                                <th scope="col" class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 194px;" aria-label="Teacher: activate to sort column ascending">Finish date</th>
                                                <th scope="col" class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 110px;" aria-label="Price: activate to sort column ascending">Skill</th>
                                                <th scope="col" class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 110px;" aria-label="Price: activate to sort column ascending">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <p></p>
                                        <c:forEach var="o" items="${lista}">  
                                            <tr role="row" class="odd">
                                                <td>${o.title}</td>
                                                <td>${o.request_content}</td>
                                                <td>${o.created_date}</td>
                                                <td>${o.finish_date}</td>
                                                <td>
                                                    <c:forEach items="${o.getSkill_name()}" var="s">
                                                       <img src="${s.skill_img}">
                                                    </c:forEach>
                                                </td>
                                                <c:choose>
                                                    <c:when test="${o.request_status == 1}">
                                                        <td>
                                                            Open
                                                        </td>
                                                        <td>
                                                            <a href="listrequestbyme1?idDel=${o.request_id}">Delete</a>
                                                        </td>
                                                        <td>
                                                            <a href="updateRequest?request_id=${o.request_id}&mentor_id=${o.mentor_id}">Update</a>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${o.request_status == 2}">
                                                        <td>
                                                            Processing
                                                        </td>
                                                        <td>
                                                            <a href="listrequestbyme1?idDel=${o.request_id}">Delete</a>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${o.request_status == 3}">
                                                        <td>
                                                            Cancel
                                                        </td>
                                                        <td>
                                                            <a href="listrequestbyme1?idDel=${o.request_id}">Delete</a>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${o.request_status == 4}">
                                                        <td>
                                                            <a href="listrequestbyme1?id=${o.request_id}">Closed</a>
                                                        </td>
                                                        <td>
                                                            <a href="listrequestbyme1?idDel=${o.request_id}">Delete</a>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${o.request_status == 5}">
                                                        <td>
                                                            Finish
                                                        </td>
                                                        <td>
                                                            <a href="listrequestbyme1?idDel=${o.request_id}">Delete</a>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>Không xác định</c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                    <div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 to 10 of 11 entries</div>
                                    <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
                                        <a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="DataTables_Table_0_previous"><i class="fa-solid fa-arrow-left"></i></a>
                                        <span>
                                            <a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0">1</a>
                                            <a class="paginate_button " aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">2</a></span><a class="paginate_button next" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" id="DataTables_Table_0_next"><i class="fa-solid fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
