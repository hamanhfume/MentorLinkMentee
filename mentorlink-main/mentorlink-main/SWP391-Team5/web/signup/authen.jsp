<%-- 
    Document   : fogetPass
    Created on : Mar 5, 2023, 4:20:25 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset password</title>
        <!--        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            .bt-send {
                width: 76px;
                height: 40px;
                background-color: #175E4C;
                color: white;
                margin-top: 24px;
                border-radius: 40px;
                text-align: center;
                padding-top: 11px;
                display: inline-block;
                
            }
        </style>
    </head>
    <body style="background-color: #dbdada">
        <jsp:include page="../home/header.jsp"/>
        <section class="vh-100" style="background-color: white;">
            <div class="container py-5 h-100" style="background-color: white;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-6 col-lg-8 col-md-12">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black"> 
                                        <form action="registerVerificationController" method="post">
                                            <div class="d-flex align-items-center mb-3 pb-1">
                                                <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                                <span class="h2 fw-bold mb-0">Account verification</span>
                                            </div>
                                            <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Send verification code to your Email</h5>
                                            <div class="mb-4">
                                                <input style="width:80%" type="text" class="form-control form-control-lg d-inline-block me-4" readonly
                                                       value="${sessionScope.drawEmail}"/>
                                                <div class="bt-send">
                                                    <a href="registerVerificationController" style="color: white;text-decoration: none;"> Send</a>
                                                </div>
                                            </div>
                                            <div class="mb-4">
                                                <input style="width:80%" type="text" id="form2Ex" class="form-control form-control-lg" 
                                                       name="code"/>
                                                <label class="form-label" for="form2Ex">Enter the code sent to your email</label>
                                            </div>
                                            <c:if test="${requestScope.err !=null}">
                                                <h6 style="color: red">${requestScope.err} </h6>
                                            </c:if>
                                            <div class="pt-1 mb-4">
                                                <input class="btn btn-dark btn-lg btn-block" type="submit" value="Continue" style="background-color: #175E4C;"/>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../home/footer.jsp"/>
    </body>
</html>