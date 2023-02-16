
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.User}" >
    <jsp:forward page="login.jsp"/>
</c:if>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/product.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <title>Add Employee Details</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product">

        <!--Favicons -->
        <link rel="apple-touch-icon" href="https://getbootstrap.com/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">

        <style>
            body {
                background-image: url('images/blue-vector.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
    </head>

    <body class="text-center">
        <%--<jsp:include page="menu.jsp"></jsp:include>--%>

            <main id="tableShow" class="form-signin w-25 m-auto">
                <form action="AddEmployee" method="Post">
                    <img class="mb-4" src="images/profilePhoto.png" alt="" width="100" height="100">

                <c:if test="${not empty requestScope.SuccessMsg}">
                    <h1 style="color: lightgreen">${requestScope.SuccessMsg}</h1>
                    <% response.setHeader("Refresh", "3;url=home.jsp");%>
                </c:if>

                <c:if test="${not empty requestScope.ErrorMsg}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.ErrorMsg}
                    </div>
                </c:if>

                <h1 class="h3 mb-3 fw-normal"><b>Add New Employee</b></h1>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="First name" name="firstName" required autofocus>
                    <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Last name" name="lastName" required>
                    <label for="floatingInput">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Address" name="address" required>
                    <label for="floatingInput">Address</label>
                </div>
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="Phone Number" name="phoneNo" required>
                    <label for="floatingInput">Phone No</label>
                </div>
                <div class="form-floating">
                    <select name="gender" class="form-select" id="gender" required>
                        <option value="" hidden>Select Gender</option>
                        <option value="Male"> Male  </option>
                        <option value="Female"> Female  </option>
                    </select>
                </div>
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="Age" name="age" required>
                    <label for="floatingInput">Age</label>
                </div>
                <div class="form-floating">

                    <select name="departmentId" class="form-select" id="departmentId" required>
                        <option value="" hidden>Select a Department</option>

                        <c:forEach var="dept" items="${DeptList}">
                            <option value="${dept.getDepartmentId()}"> ${dept.getDepartmentName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-floating">

                    <select name="roleId" class="form-select" id="roleId" required>
                        <option value="" hidden> Select a Role</option>
                        <c:forEach var="role" items="${RoleList}">
                            <option value="${role.getRoleId()}"> ${role.getRoleName()}  </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="basicSalary" name="basicSalary" required>
                    <label for="floatingInput">Basic Salary</label>
                </div>
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="carAllowance" name="carAllowance" value="0" required>
                    <label for="floatingInput">Car Allowance</label>
                </div>
                <!--<div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="SpecialAllowance" name="specialAllowance" value="0" required>
                    <label for="floatingInput">Special Allowance</label>
                </div> -->
                <button class="w-50 btn btn-lg btn-primary" type="submit">Save</button>
            </form>

        </main>
        
    </body>
</html>
