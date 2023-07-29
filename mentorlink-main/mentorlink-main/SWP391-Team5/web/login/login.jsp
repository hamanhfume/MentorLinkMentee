
<%-- 
    Document   : login
    Created on : May 26, 2023, 12:43:36 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="icon" href="https://scontent.fhan5-1.fna.fbcdn.net/v/t1.15752-9/346119165_204038079126623_4944693773758350157_n.png?_nc_cat=105&ccb=1-7&_nc_sid=ae9488&_nc_ohc=59rA4Ca5SLQAX9FFAc0&_nc_ht=scontent.fhan5-1.fna&oh=03_AdRxmjNtaFmGhZQ4ul_XUCsH5XiC-mmcQODINzz4E7nZ8A&oe=6496E682">
        <link rel="stylesheet" href="https://cdn.usebootstrap.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/style.min.css" type="text/css" />
        <link rel="stylesheet" href="assets/css/responsive.css" type="text/css" />

        <link rel="stylesheet" href="assets/css/custom.minbc11.css?v=99" type="text/css" />
        <link rel="stylesheet" href="assets/css/override.css" type="text/css" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Login</title>

    </head>
    <body>
        <jsp:include page="../home/header.jsp"/>
        <section id="content">
            <div class="content-wrap nopadding" style="min-height: 65vh">
                <div class="login_container"
                     style=" background: url() center center no-repeat; background-size: cover;">
                </div>
                <div class="card card_login divcenter noradius noborder allmargin modal-padding card-login-custom"
                     style="max-width: 500px; background-color: rgba(255,255,255,0.93);">
                    <div class="card-body nopadding">

                        <div class="wrap-title">
                            <h3 class="title">Login</h3>
                        </div>
                        <div class="login-logo">
                            <img src="assets/images/logo2.png" alt="ym">
                        </div>
                        <div class="help-block show_err">
                        </div>

                        <%-- Kiểm tra nếu có thông báo lỗi thì hiển thị --%>
                        <%
                            String mess = (String) request.getSession().getAttribute("mess"); 
                            if(mess != null && !mess.equals("")){ 
                        %>
                        <div class="text-danger alert alert-danger">
                            <div class="centered-text"><%= mess %></div>
                        </div>                       
                        <% 
                            // Sau khi hiển thị thông báo lỗi, xóa nó khỏi session
                            request.getSession().removeAttribute("mess");
                            }
                        %>

                        <c:if test="${requestScope.noti != null}">
                            <div class="text-danger alert alert-success">
                                <div class="centered-text" style="color: black;">${requestScope.noti}</div>
                            </div> 
                        </c:if>

                        <form id="login-account" name="login-account" class="nobottommargin" action="login" method="post">
                            <div class="mb_10">
                                <label for="">Username:</label> 
                                <input type="text" value="${username}" name="user" required
                                       class="form-control not-dark login-form-username" />
                            </div>

                            <div class="mb_10">
                                <label for="">PASSWORD:</label>
                                <input type="password" value="${password}" name="pass" required
                                       class="form-control not-dark login-form-password" />
                            </div>
                            <label class="rmb_pass">
                                <input type="checkbox" name="remember" value="1"> Remember password
                            </label>
                            <div class="mb_10 center">
                                <button class="btn btn-success" type="submit" value="Sign in">Sign in</button>
                            </div>
                        </form>

                        <div class="mb_10 nobottommargin tright mt-3">

                            <a href="forgetPassword" class="">Forgot password</a>
                        </div>
                        <div class="mb_10 nobottommargin">
                            Do not have an account? <a href="signupController" class="">Please click here to register</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <jsp:include page="../home/footer.jsp"/>
</body>

</html>
