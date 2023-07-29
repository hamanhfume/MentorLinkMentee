<%-- 
    Document   : temp
    Created on : Jun 11, 2023, 10:51:52 PM
    Author     : Tuan Vinh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="icon" href="https://scontent.fhan5-1.fna.fbcdn.net/v/t1.15752-9/346119165_204038079126623_4944693773758350157_n.png?_nc_cat=105&ccb=1-7&_nc_sid=ae9488&_nc_ohc=59rA4Ca5SLQAX9FFAc0&_nc_ht=scontent.fhan5-1.fna&oh=03_AdRxmjNtaFmGhZQ4ul_XUCsH5XiC-mmcQODINzz4E7nZ8A&oe=6496E682">
        <link rel="stylesheet" href="https://cdn.usebootstrap.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/style.min.css" type="text/css" />
        <link rel="stylesheet" href="assets/css/responsive.css" type="text/css" />

        <link rel="stylesheet" href="assets/css/custom.minbc11.css?v=99" type="text/css" />
        <link rel="stylesheet" href="assets/css/override.css" type="text/css" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Change Password</title>
    </head>
    <body class="stretched side-push-panel no-transition">
        <jsp:include page="../home/header.jsp"/>
        <div id="wrapper" class="clearfix header_white">
            <a id="button" class="show"></a>

            <section id="content">
                <div class="content-wrap nopadding">
                    <div class="card card_login divcenter noradius noborder allmargin card-login-custom modal-padding"
                         style="max-width: 400px; background-color: rgba(255,255,255,0.93);">
                        <div class="card-body nopadding">

                            <div class="wrap-title">
                                <h4 class="title" style="font-size: 14px;">Change Password</h4>
                            </div>
                            <div class="login-logo">
                                <img src="assets/images/logo2.png">
                            </div>
                            <div class="help-block show_err">
                            </div>

                            <c:if test="${sessionScope.acc != null}"> 
                                    <c:if test="${error != null}">
                                <div class="text-danger alert alert-danger">
                                <div class="centered-text">${error}</div>
                            </div> 
                            </c:if>
                                    <c:if test="${noti != null}">
                                <div class="text-danger alert alert-success">
                                <div class="centered-text">${noti}</div>
                            </div> 
                            </c:if>
                                </c:if>
                            
                            


                            <form id="register-account" name="register-account" class="nobottommargin" action="changePass"
                                  method="post">
                                <div class="mb_10">
                                    <label for="">Username <span style="color: red">*</span></label>
                                    <input type="text" name="username" class="form-control not-dark login-form-username" />
                                </div>
                                <div class="mb_10">
                                    <label for="">Old Password <span style="color: red">*</span></label>
                                    <input type="password" name="oldpass" class="form-control not-dark login-form-username" />
                                </div>

                                <div class="mb_10">
                                    <label for="">New Pasword <span style="color: red">*</span></label>
                                    <input id="password" type="password" name="newpass" class="form-control not-dark login-form-password" />
                                </div>
                                <div class="mb_10">
                                    <label for="">Confirm Pasword <span style="color: red">*</span></label>
                                    <input id="password" type="password" name="repass" class="form-control not-dark login-form-password" />
                                </div>
                                <div class="mb_10 center">
                                    <button class="btn btn-success" type="submit">Change Password</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </section>

        </div>

        <jsp:include page="../home/footer.jsp"/>
    </body>
</html>
