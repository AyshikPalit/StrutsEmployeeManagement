<%@page import="com.exavalu.services.EmployeeService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.exavalu.services.RoleService"%>
<%@page import="com.exavalu.services.DepartmentService"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 
<c:if test="${empty sessionScope.User}" >
    <jsp:forward page="login.jsp"/>
</c:if>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.108.0">
        <title>Employee Web</title>

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

        <!-- Custom styles for this template -->
        <link href="css/product.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
    </head>

    <%--<jsp:include page="menu.jsp"></jsp:include>--%>
    <h1><b><center><u>Enter Employee Details</u></center></b></h1>
    <div class="table-responsive">
        <table class="table table-striped">
            
            <!-- search-->
            <form class="form-inline" action="SearchEmployee" method="get">
                <div class="container" >
                    <div class="row">
                        <div class="form-control col-sm">
                            <input class="form-control" type="text" placeholder="First Name" name="firstName">
                        </div>
                        <div class="form-control col-sm">
                            <input class="form-control" type="text" placeholder="Last Name" name="lastName">
                        </div>
                        <div class="form-control col-sm">
                            <input class="form-control" type="text" placeholder="Gender" name="gender">
                        </div>
                        
                        <div class="form-control col-sm">
                        <select name="departmentName" class="form-select" id="departmentName">
                            <option value="" hidden>Department</option>
                            <c:forEach var="dept" items="${DeptList}">
                                <option value="${dept.getDepartmentName()}"> ${dept.getDepartmentName()}</option>
                            </c:forEach>
                        </select> 
                        </div>
                        
                        <div class="form-control col-sm">
                        <select name="roleName" class="form-select" id="roleName">
                            <option value="" hidden>Role</option>
                            <c:forEach var="role" items="${RoleList}">
                                <option value="${role.getRoleName()}"> ${role.getRoleName()}  </option>
                            </c:forEach>
                        </select>
                        </div>
                                  
                        <div class="form-control col-sm">
                            <button type="submit" class="form-control btn btn-primary mb-2">Search</button>
                        </div>
                
                    </div>
                </div>
            </form>            
            <!--search end-->
            
             <tr>
                                <th>Employee Id</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Address</th>
                                <th>Phone No</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Department Name</th>
                                <th>Role Name</th>
                                <th>Basic Salary</th>
                                <th>Car Allowance</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${EmpList}" var="emp">
                                <tr data-index="0">
                                    <td>${emp.getEmployeeId()}</td>
                                    <td>${emp.getFirstName()}</td>
                                    <td>${emp.getLastName()}</td>
                                    <td>${emp.getAddress()}</td>
                                    <td>${emp.getPhoneNo()}</td>
                                    <td>${emp.getGender()}</td>
                                    <td>${emp.getAge()}</td>
                                    <td>${emp.getDepartmentName()}</td>
                                    <td>${emp.getRoleName()}</td>
                                    <td>${emp.getBasicSalary()}</td>
                                    <td>${emp.getCarAllowance()}</td>
                                    <td>
                                            <a href='EditEmployee?employeeId=${emp.employeeId}'>
                                                <button class="btn-primary">Edit</button>
                                            </a>
                                            <a href='DeleteEmployee?employeeId=${emp.employeeId}'>
                                                <button class="btn-dark">Delete</button>
                                            </a>
                                    </td>
                                </tr>
                            </c:forEach>
           
    </div>
</table>

<script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</html>