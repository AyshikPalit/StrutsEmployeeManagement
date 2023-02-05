<%@page import="com.exavalu.models.Role"%>
<%@page import="com.exavalu.models.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.models.Employee"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.108.0">       
        <title>Employee Management</title>      
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--Favicons -->
        <link rel="apple-touch-icon" href="https://getbootstrap.com/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">
       
        <link href="css/product.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <style>
            body {
                background-image: url('images/blue-vector.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;  
                background-size: 100% 100%;
            }
        </style>

    </head>
    
   <jsp:include page="menu.jsp"></jsp:include>

    <body class="text-center">
            <main class="form-signin w-25 m-auto">
                
            <c:set var="emp" value="${Emp}"/>
            <form action="SaveEmployee" method="Post">
                <img class="mb-4" src="images/profilePhoto.png" alt="" width="100" height="100">
                <h1 class="h3 mb-3 fw-normal"><b>Please Edit Employee Data</b></h1>
                <div class="form-floating" >
                    <input type="text" class="form-control" id="floatingInput" placeholder="employee id" name="employeeId" value="${emp.getEmployeeId()}" readonly>
                    <label for="floatingInput">Employee Id</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="first name" name="firstName" value="${emp.getFirstName()}">
                    <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="last name" name="lastName" value="${emp.getLastName()}">
                    <label for="floatingInput">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="address" name="address" value="${emp.getAddress()}">
                    <label for="floatingInput">Address</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="phone" name="phoneNo" value="${emp.getPhoneNo()}">
                    <label for="floatingInput">Phone No</label>
                </div>
                <div class="form-floating">
                    <select name="gender" class="form-select" id="gender" required>
                        <option value="" hidden>${emp.getGender()}</option>
                            <option value="Male" <c:if test='${emp.getGender().equalsIgnoreCase("Male")}'>selected</c:if>> Male  </option>
                            <option value="Female" <c:if test='${emp.getGender().equalsIgnoreCase("Female")}'>selected</c:if> > Female  </option>
                    </select>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="age" name="age" value="${emp.getAge()}">
                    <label for="floatingInput">Age</label>
                </div>
                <div class="form-floating">
                    <select name="departmentId" class="form-select" id="departmentId">
                            <option value="" hidden>Select a Department</option>
                            <c:forEach var="dept" items="${DeptList}">
                                <option value=${dept.getDepartmentId()}<c:if test="${dept.getDepartmentName().equalsIgnoreCase(emp.getDepartmentName())}"> selected </c:if>> ${dept.getDepartmentName()}  </option>
                            </c:forEach>
                    </select>
                </div>
                <div class="form-floating">
                   <select name="roleId" class="form-select" id="roleId">
                            <option value="" hidden> Select a Role</option>
                            <c:forEach var="role" items="${RoleList}">
                                <option value=${role.getRoleId()}<c:if test="${role.getRoleName().equalsIgnoreCase(emp.getRoleName())}"> selected </c:if>> ${role.getRoleName()}  </option>
                            </c:forEach>
                        </select>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="basicSalary" name="basicSalary" value="${emp.getBasicSalary()}">
                    <label for="floatingInput">Basic Salary</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="carAllowance" name="carAllowance" value="${emp.getCarAllowance()}">
                    <label for="floatingInput">Car Allowance</label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Save</button> 
            </form>
        </main>
    </body>
</html>
