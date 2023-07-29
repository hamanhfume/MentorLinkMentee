<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listMentorSuggestion
    Created on : Jun 24, 2023, 3:09:54 PM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mentor Suggestion</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />   

    <link rel="icon" href="temp/logo2.png">
    <link rel="stylesheet" id="google-fonts-css"
          href="https://fonts.googleapis.com/css?family=Poppins%3A100%2C200%2C300%2C400%2C500%2C600%2C700%2C800%2C900%26display%3Dswap%7COpen+Sans%3A300%2C400%2C600%2C700%2C800%26display%3Dswap"
          type="text/css" media="all" />

    <!-- Can -->
    <link rel="stylesheet" id="mentoring_style-css"
          href="https://mentoring-wp.dreamguystech.com/wp-content/themes/mentoring/style.css?ver=6.2.2" type="text/css"
          media="all" />

    <link rel="stylesheet" id="mentoring_theme-css"
          href="https://mentoring-wp.dreamguystech.com/wp-content/themes/mentoring/assets/css/theme.css?ver=1.2.2"
          type="text/css" media="all" />

    <link rel="stylesheet" id="mentoring_responsive-css"
          href="https://mentoring-wp.dreamguystech.com/wp-content/themes/mentoring/assets/css/responsive.css?ver=1.2.2"
          type="text/css" media="all" />


    <jsp:useBean id="a" class="dao.MentorCVDAO" scope = "request"></jsp:useBean>
    <jsp:useBean id="b" class="dao.FeedbackDAO" scope = "request"></jsp:useBean>
    </head>

    <body>
    <jsp:include page="/home/header.jsp"/>
    <div id="content" class="site-content">
        <div class="sigma_subheader after-title text-left style-1 dark-overlay ">
            <div class="container" style="margin-top: 50px">
                <div class="sigma_subheader-inner">
                    <h1 class="page-title" style="font-weight: 600; font-size: 40px">List Mentor Suggestion</h1>
                    <div class="breadcrumb-nav">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb" itemscope itemtype="#">
                                <li itemprop="itemListElement" itemscope itemtype="#"
                                    class="breadcrumb-item"><a itemprop="item"
                                                           href="#"><span
                                            itemprop="name"></span></a></li>
                                <li class="breadcrumb-item-page"></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content" style="min-height: 56vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-4">
                        <div class="card search-filter search_block">
                            <div class="card-header">
                                <h4 class="card-title mb-0">Filter</h4>
                            </div>
                            <div class="card-body">
                                <form action="mentorSuggestion" method="post">
                                    <div class="dc-innerbanner">
                                        <div class="dc-formtheme dc-form-advancedsearch">
                                            <!--                                            <div class="form-group">
                                                                                            <input type="hidden" name="searchby" class="form-control"
                                                                                                   value="both">
                                                                                            <input type="text" name="keyword" class="form-control"
                                                                                                   placeholder="Search" value>
                                                                                        </div>-->
                                            <div class="form-group">
                                                <h4>Rating</h4>
                                                <div class="dc-select">
                                                    <select name="sort" class="chosen-select">
                                                        <option value="default">Select a sort</option>
                                                        <option data-flag class=" level-0" value="default">
                                                            Default</option>    
                                                        <option data-flag class=" level-0" value="asc">
                                                            Sort increase</option>
                                                        <option data-flag class=" level-0" value="desc">
                                                            Sort reduction</option>    

                                                    </select>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group">
                                                                                            <h4>Request</h4>
                                                                                            <div class="dc-select">
                                                                                                <select name="request_sort" class="chosen-select">
                                                                                                    <option value>Select a sort</option>
                                                                                                    <option data-flag class=" level-0" value="default">
                                                                                                        Default</option>    
                                                                                                    <option data-flag class=" level-0" value="asc">
                                                                                                        Sort increase</option>
                                                                                                    <option data-flag class=" level-0" value="desc">
                                                                                                        Sort reduction</option> 
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>-->
                                            <div class="dc-btnarea">
                                                <input type="submit" value="Submit" style="background: #175E4C; border: none">
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <style>
                        .dc-select:after {
                            top: 0;
                            right: 15px;
                            z-index: 2;
                            display: block;
                            font-size: 18px;
                            font-family: "font awesome 5 pro";
                            content: "▼";
                            position: absolute;
                            text-align: center;
                            line-height: 50px;
                            pointer-events: none;
                            color: var(--terthemecolor)

                        }
                    </style>
                    <div class="col-md-12 col-lg-8">

                        <div class="col-12 order-last">
                            <c:forEach var="s" items="${listS}">
                                <div class="mentor-widget">
                                    <div class="user-info-left">
                                        <div class="mentor-img">
                                            <a
                                                href="viewcv?mentor_id=${s.getMentor_id()}">
                                                <img class="img-fluid user-image-res" style="height: 100%; object-fit: cover; border-radius: 5.4rem" src="assets/upload/${s.getInfor().getAvatar()}" >
                                                <!--                                                                <img class="img-fluid user-image-res-2x"
                                                                                                                     src="https://mentoring-wp.dreamguystech.com/wp-content/uploads/2022/07/user3-1.jpg"
                                                                                                                     alt="Carl Kelly">-->
                                            </a>
                                        </div>
                                        <div class="user-info-cont">
                                            <h3>
                                                <a
                                                    href="viewcv?mentor_id=${s.getMentor_id()}">${s.getInfor().getFull_name()}</a>
                                                <i class="fa fa-leaf" data-toggle="tooltip" style="width: 30px; height: 20px; margin-left: 1px;
                                                   line-height: 20px; font-size: 18px; color: #175E4C; background-color: white" title="Verified user"></i>
                                            </h3>
                                            <div class="user-tag">
                                                <a
                                                    href="#">@${s.getInfor().getUsername()}</a>
                                            </div>
                                            <div class="user-feedback">
                                                <!--                                                                <div class="empty-stars"></div>
                                                                                                                <div class="full-stars" style="width: 100%"></div>-->
                                                <span style="font-weight:700;">${s.getRating()}/5 </span><i class="fa-sharp fa-solid fa-star" style="color: yellow"></i>
                                            </div>
                                            <c:set var="mentorId" value="${s.getMentor_id()}" />
                                            <div class="user-feedback">
                                                <span><i class="fa-solid fa-comment"></i>${b.getNumberOfFeedback(mentorId)} Feedback</span>
                                            </div>
                                            <div class="user-location">
                                                <span><i class="fa-sharp fa-solid fa-clipboard-question"></i>${s.getNumberRequest()} Request</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="user-info-right" style="min-width: 280px">
                                        <div class="user-infos">
                                            <ul>
                                                <li><i class="fa-solid fa-user"></i>Nghề Nghiệp: ${s.getProfession()}</li>
                                                <li>
                                                    <i class="fa-solid fa-phone"></i>Phone : ${s.getInfor().getPhone()}
                                                </li>
                                                <li><i class="fa-solid fa-envelope"></i>
                                                    Email: ${s.getInfor().getEmail()}</li>
                                                <li><i class="far fa-clipboard"></i>
                                                    <em class="dc-available">Available Today</em>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="user-booking">
                                            <a href="requestMentor?mentor_id=${s.getMentor_id()}" style="background: #175E4C; border: none">Create Request</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>



                            <!-- <div class="dc-paginationvtwo">
                                    <nav class="dc-pagination">
                                        <ul>
                                            <li class="dc-prevpage"><a
                                                    href="https://mentoring-wp.dreamguystech.com/search-mentors/"><i
                                                        class="fas fa-angle-double-left"></i></i></a>
                                            </li>
                                            <li><a
                                                    href="https://mentoring-wp.dreamguystech.com/search-mentors/">1</a>
                                            </li>
                                            <li class="dc-active"><a href="javascript:;">2</a></li>
                                        </ul>
                                    </nav>
                                </div> -->


                        </div>


                    </div>
                    <c:set var="listSki" value="${listSki}" />
                    <div class="pagination-custom">
                        <!-- So trang dang dung JspUseBean: Doi tuong cua class CVDAO -->
                        <c:forEach begin="1" end="${a.getNumberPage3(listSki)}" var = "i">
                            <!-- Lay ra vi tri trang dang dung -->
                            <a href="mentorSuggestion?index=${i}" class="${indexPagee == i ?  "active" : ""}">${i}</a>
                        </c:forEach>
                    </div>
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
                    </style>
                </div>

            </div>

        </div>
    </div>
    <jsp:include page="/home/footer.jsp"/>
</body>

</html>
