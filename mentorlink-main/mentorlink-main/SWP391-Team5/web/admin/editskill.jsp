
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>EDIT</title>
        <link rel="stylesheet" href="assets/css/editskill.css">

        <style>
            body {
                background-color: #4daf97;
                font-family: Arial, sans-serif;
            }

            form {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 500px;
                margin: 50px auto;
                padding: 20px;
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
                color: #333333;
            }

            input[type="text"],
            select {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #cccccc;
                width: 90%;
                margin-bottom: 20px;
                font-size: 16px;
                color: #666666;
            }

            select option {
                color: #666666;
                font-size: 16px;
                width: 95%;
            }

            input[type="submit"] {
                background-color: #0088cc;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #006699;
            }
        </style>
    </head>
    <body>
        <form action="updateskill" method="post">

            <label for="skillName">ID:</label>
            <input type="text" value="${ojectupdate.skill_id}" id="skillName" name="skill_id" readonly><br><br>

            <label for="skillName">Name:</label>
            <input type="text" value="${ojectupdate.skill_name}" id="skillName" name="skill_name"><br><br>

            <label for="skillImage">Image:</label>
            <input type="text" value="${ojectupdate.skill_img}"id="skillImage" name="skill_img"><br><br>

            <label for="skillStatus">Status:</label>
            <select id="skillStatus" name="skill_status">
                <option value="1" ${ojectupdate.skill_status == 1 ? "selected" : ""} >Active</option>
                <option value="0" ${ojectupdate.skill_status == 0 ? "selected" : ""}>Inactive</option>
            </select>

            <input type="submit" value="SAVE">
        </form>
    </body>
</html>