<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!doctype html>

    
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.108.0">
        <title>Employee Management</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="img/profilePhoto.png" sizes="180x180">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">


        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">
<head>
<style>
    body {
        background-image: url('img/web-design.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;  
        background-size: 100% 100%;
    }
    
    a:link, a:visited {
    color: black;
    }
</style>
</head>

    <body class="text-center">

        <main class="form-signin w-100 m-auto">
            <form action="Login" method="Post">
                <img class="mb-4" src="images/profilePhoto.png" alt="" width="120" height="120">
                
                <c:if test="${not empty requestScope.ErrorMsg}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.ErrorMsg}
                    </div>
                </c:if>
                
                <h1 class="h2 mb-3 fw-normal"><b>Log in</b></h1>

                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me">Remember me
                    </label>
                </div>
                <button class="w-50 btn btn btn-primary" type="submit" style= "margin: 5px">Log in</button>
                <!--<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>-->
            </form>
                <!--<button class="w-50 btn btn btn-dark" type="submit">-->
                <a href="signup.jsp" style="text-decoration: none"><b>New user? Sign Up here</b></a>
        </main>
    </body>
</html>