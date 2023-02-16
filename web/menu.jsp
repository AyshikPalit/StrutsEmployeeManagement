<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!doctype html>
<html lang="en">
    <head>
        <title>Employee Management</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta name="theme-color" content="#712cf9">

        <!-- Custom styles for this template -->
        <link href="css/header.css" rel="stylesheet">
        <!--<link href="css/carousel.css" rel="stylesheet">-->
    </head>
    <header class="p-3 text-bg-dark">
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script>
            function goTo(method)
            {
                $.ajax({
                    url: method,
                    success: function (responseText) {
                        $("#tableShow").html(responseText);
                    }
                });
            }
        </script>

        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="#" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <img src="images/flower-logo.jpg" width="75" height="75">
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a onclick="goTo('addEmployee.jsp')" class="nav-link px-2 text-white">Add Employee</a></li>
                    <li><a onclick="goTo('employeeDetails.jsp')" class="nav-link px-2 text-white">Show Employee</a></li>
                    <li><a onclick="goTo('searchemployee.jsp')" class="nav-link px-2 text-white">Search Employee</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">Update Employee</a></li>
                    <li><a href="ConsumeAPI" class="nav-link px-2 text-white">Get API Data</a></li>
                    <li><a href="landingPage.jsp" class="nav-link px-2 text-white">

                            <c:if test="${not empty User}">Welcome: 
                                <c:out value = "${User.firstName}"/>
                                <c:out value = "${User.lastName}"/>
                            </c:if>
                        </a></li>

                </ul>

                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
                </form>

                <div class="text-end">
                    <c:choose>
                        <c:when test="${empty User}">
                            <a href="login.jsp">
                                <button type="button" class="btn btn-outline-light me-2" >Login</button>
                            </a>
                            <a href="PreSignUp">
                                <button type="button" class="btn btn-warning">Sign-up</button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="Logout">
                                <button type="button" class="btn btn-outline-light me-2" >Log Out</button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </header>
</html>