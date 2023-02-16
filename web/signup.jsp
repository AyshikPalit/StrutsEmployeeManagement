<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.104.2">
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <meta name="theme-color" content="#712cf9">


        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    
  <body class="text-center">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script>
//        function submitForm()
//        {
//            signupForm.submit();
//        }
       function fetchContent(selectedId, targetId)
                        {
                $.ajax({
                url: 'PreSignUp',
                data: {
                    [selectedId]: $("#" + selectedId).val()
                                    },
                                    success: function (responseText) {
                                            $("#" + targetId).html(responseText);
                                    }
                                });
                            }
    </script>
   
        <main class="form-signin w-100 m-auto">
            
                <img class="mb-4" src="images/flower-logo.jpg" alt="" width="200" height="200">
                <h1 class="h3 mb-3 fw-normal">Please provide below information</h1>
                <c:if test="${not empty AlreadyExist}">
                <div class="alert alert-danger" role="alert">
                    <c:out value="${AlreadyExist}"/>
                    <c:remove var="AlreadyExist"/>
                </div>
                </c:if>
                <form action="PreSignUp" method="post" id="signupForm">
                
                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress" value="${User.getEmailAddress()}">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" value="${User.getPassword()}">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="firstName" placeholder="first name" name="firstName" value="${User.getFirstName()}">
                    <label for="firstName">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="lastName" placeholder="last name" name="lastName" value="${User.getLastName()}">
                    <label for="firstName">Last Name</label>
                </div>
                
                <div class="form-floating">
                    <select name="countryCode" class="form-select" id="countryCode" onchange="fetchContent('countryCode','stateCode')">
                            <option value="" hidden>Select a Country</option>
                            <c:forEach var="country" items="${CountryList}">
                                <option value='${country.getCountryCode()}' <c:if test="${country.getCountryCode() == User.getCountryCode()}"> selected </c:if>>${country.getCountryName()} </option>
                            </c:forEach>
                    </select>
                </div>
                <div class="form-floating">
                    <select name="stateCode" class="form-select" id="stateCode" onchange="fetchContent('stateCode','distCode')">
                            <option value="" hidden>Select a State</option>

                    </select>
                </div> 
                <div class="form-floating">
                    <select name="distCode" class="form-select" id="distCode">
                            <option value="" hidden>Select a District</option>
                           
                    </select>
                </div> 
                    
               
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>
                <a href="landingPage.jsp">
                    <button type="button" class="w-100 btn btn-lg btn-warning">Cancel</button>
                </a>
                <p class="mt-5 mb-3 text-muted">&copy; 2017-2022</p>
            </form>
        </main>



    </body>
</html>
