<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : userProfile
    Created on : May 25, 2023, 10:03:17 AM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile</title>  
        <link rel="icon" href="temp/logo2.png">
        <link rel="stylesheet" type="text/css" href="assets/css/userProfile.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
                      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <link rel="stylesheet" href="assets/popup.css"/>
        <link rel="stylesheet" href="temp/home1.css">

        <style>
            .cssbuttons-io-button {
                display: flex;
                align-items: center;
                font-family: inherit;
                font-weight: 500;
                font-size: 17px;
                padding: 0.8em 1.5em 0.8em 1.2em;
                color: white;
                background: #ad5389;
                background: linear-gradient(0deg, rgb(120, 47, 255) 0%, rgb(185, 132, 255) 100%);
                border: none;
                box-shadow: 0 0.7em 1.5em -0.5em rgb(184, 146, 255);
                letter-spacing: 0.05em;
                border-radius: 20em;
            }

            .cssbuttons-io-button svg {
                margin-right: 8px;
            }

            .cssbuttons-io-button:hover {
                box-shadow: 0 0.5em 1.5em -0.5em rgb(149, 91, 255);
            }

            .cssbuttons-io-button:active {
                box-shadow: 0 0.3em 1em -0.5em rgb(160, 109, 255);
            }

            .bnt {
                margin-left: 35px;
                margin-bottom: 20px;
                height: 20px;
                width: auto;
            }
        </style>


    </head>

    <body>
        <jsp:include page="/home/header.jsp"/>
        <section class="py-5 my-5">  
            <div id="alertDiv"></div>
            <div class="container">
                <div class="bg-white shadow rounded-lg d-block d-sm-flex">
                    <div class="profile-tab-nav border-left">
                        <div class="p-4">
                            <form id="myForm" action="UploadAvatar" method="post" enctype="multipart/form-data">
                                <div class="img-circle2 text-center mb-3 upload">
                                    <img id="avatarImage" src="assets/upload/${InfoUser.getAvatar()}" alt="Image" class="shadow">
                                    <div class="round">
                                        <input type="file" name="file" id="input-file" onchange="displayImage()">
                                        <i class="fa fa-camera" style="color: #fff;"></i>                                        
                                    </div>    
                                </div>
                                <button class="cssbuttons-io-button bnt" type="submit" >                               
                                    <span><i class="fa-solid fa-upload"></i> Upload</span>
                                </button>    
                            </form>
                            

                            <h4 class="text-center">${InfoUser.getFull_name()}</h4>
                        </div>
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link link" id="account-tab" data-toggle="pill" href="#account" role="tab"
                               aria-controls="account" aria-selected="true">
                                <i class="fa fa-home text-center mr-1 icon"></i>
                                Account
                            </a>
                            <a class="nav-link link" id="password-tab" data-toggle="pill" href="changePass" role="tab"
                               aria-controls="password" aria-selected="false">
                                <i class="fa fa-key text-center mr-1 icon"></i>
                                Change Password
                            </a>

                            <c:if test="${sessionScope.acc.cv_status == 1}">
                                <a class="nav-link link" id="security-tab" data-toggle="pill" href="viewcv?mentor_id=${sessionScope.acc.getUser_id()}" role="tab"
                                   aria-controls="security" aria-selected="false">
                                    <i class="fa fa-user text-center mr-1 icon"></i>
                                    View CV
                                </a>
                                <a data-modal-target="#popup-btn-rq-statistic" class="nav-link link" id="security-tab" data-toggle="pill" href="updatecv" role="tab"
                                   aria-controls="security" aria-selected="false">
                                    <i class="fa fa-user text-center mr-1 icon"></i>
                                    Update CV
                                </a>
                            </c:if>
                        </div>
                    </div>
                    <form id="form2" action="UserProfile" method="post">                       
                        <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                                <div class="header_title text-center">
                                    <h3 class="mb-4">User Profile</h3>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">                                      
                                        <div class="form-group">
                                            <label class="lab">Account Name</label>
                                            <input type="text" class="form-control" name="account_name" value="${InfoUser.username}" required>
                                        </div>
                                    </div>

                                    <div class="col-md-6">                                      
                                        <div class="form-group">
                                            <label class="lab">Full Name</label>
                                            <input type="text" class="form-control" name="full_name" value="${InfoUser.getFull_name()}" required>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="lab">Email</label>
                                            <input type="text" class="form-control" name="email" value="${InfoUser.getEmail()}" required readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="lab">Phone number</label>
                                            <input type="text" class="form-control" name="phone" value="${InfoUser.getPhone()}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="lab">Birth Date</label>
                                            <input type="date" max="<%=java.time.LocalDate.now()%>" class="form-control" name="birthdate" value="${InfoUser.getDate_of_birth()}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <!--                                        <div class="form-group">
                                                                                    <label>Gender</label>
                                        <c:if test="${InfoUser.getGender() == 1}">
                                            <input type="text" class="form-control" name="gender" value="Male" required>
                                        </c:if>
                                        <c:if test="${InfoUser.getGender() == 0}">
                                            <input type="text" class="form-control" name="gender" value="Female" required>
                                        </c:if>
                                    </div>-->
                                        <div class="form-group">
                                            <label class="lab">Gender</label>
                                            <select class="form-control" id="gender" name="gender">
                                                <option value="Male" ${InfoUser.getGender() == 1 ? 'selected' : ''}>Nam</option>
                                                <option value="Female" ${InfoUser.getGender() == 0 ? 'selected' : ''}>Nữ</option>
                                                <option value="other">Khác</option>                                              
                                            </select>
                                        </div>  
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="lab">Address</label>
                                            <input type="text" class="form-control" name="address" value="${InfoUser.getAddress()}" required>
                                        </div>
                                    </div>				                                   
                                </div>
                                <div>
                                    <button class="btn" style="background-color: #175E4C; color: white;">Update</button>							
                                </div>
                            </div>																														
                        </div>
                    </form>   
                 
                    <script>
                        $(document).ready(function () {
                            $("#form2").submit(function (event) {
                                event.preventDefault(); // Ngăn chặn form submit mặc định

                                // Gửi dữ liệu từ form 2 đến servlet bằng AJAX
                                $.ajax({
                                    url: $(this).attr("action"),
                                    type: $(this).attr("method"),
                                    data: $(this).serialize(),
                                    success: function (response) {
                                        // Xử lý kết quả trả về từ servlet
                                        if (response === "success") {
                                            // Hiển thị alert thành công bằng Bootstrap
                                            var alertDiv = $("#alertDiv");
                                            alertDiv.html("<div class='alert alert-success alert-slide-in custom-width' role='alert'><i class='fa-solid fa-check'></i>Update successful information!</div>");
                                            alertDiv.show();
                                            setTimeout(function () {
                                                alertDiv.hide();
                                            }, 3000);
                                        } else {
                                            // Hiển thị alert lỗi bằng Bootstrap
                                            var alertDiv = $("#alertDiv");
                                            alertDiv.html("<div class='alert alert-danger' role='alert'><i class='fa-solid fa-xmark-large'></i>Update failure information!</div>");
                                            alertDiv.show();
                                            setTimeout(function () {
                                                alertDiv.hide();
                                            }, 3000);
                                        }
                                    }
                                });
                            });
                        });
                    </script>
                </div>               
            </div>
            <div id="popup-btn-rq-statistic" class="popup-btn-rq-statistic">
                <div class="check-modal">
                    <h1>List statistic request</h1>
                    <button data-close-button class="popup-close-btn">
                        <i class="fa-solid fa-x"></i>
                    </button>
                </div>
                <div class="sum-of-requests">
                    <h5>The total number of request given you: ${object.getNumTotalRequests()}  request</h5>
                    <h5>The number of accept request: ${object.getNumAcceptedRequests()} request </h5>   
                    <h5>The number of cancel request: ${object.getNumCanceledRequests()} request </h5>
                    <h5>Percentage of accept request: ${object.getCancelPercentage()} </h5>
                    <h5>Percentage of cancel request: ${object.getCompletedPercentage()} </h5>
                    <table class="table">
                        <th>List request for you</th>
                        <tr>
                            <th>STT</th>
                            <th>Mentee Name</th>
                            <th>Title</th>
                            <th>Request Content</th>
                            <th>Created Date</th>
                            <th>Finish Date</th>
                            <th>Request Status</th>
                        </tr>
                        <c:forEach var="o" items="${listR}">

                            <tr>
                                <td>${o.getStt()}</td>
                                <td>${o.getMenteeName()}</td>
                                <td>${o.getTitle()}</td>
                                <td>${o.getRequestContent()}</td>
                                <td>${o.getCreatedDate()}</td>	
                                <td>${o.getFinishDate()}</td>
                                <td>${o.getRequestStatus()}</td>
                            </tr>
                        </c:forEach>

                    </table>
                    <h4> The rank average star of you : ${top} </h4>

                    <table class="table">
                        <th>List Top Rank Average Star for Mentor</th>
                        <tr>
                            <th>TOP</th>
                            <th>Mentor Name</th>
                            <th>Average Start</th>
                        </tr>

                        <c:forEach var="r" items="${listRS}">
                            <tr>
                                <td>${r.getRank()}</td>
                                <td>${r.getFullName()}</td>
                                <td>${r.getAverageRating()}</td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>
            <div id="overlay"></div>
            <script src="assets/js/userProfile.js"></script>
        </section>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/popup1.js"></script>
        <jsp:include page="/home/footer.jsp"/>
    </body>
</html>
