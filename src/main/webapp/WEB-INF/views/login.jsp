<!doctype html>
<html lang="en">

<head>
    <title>Log in </title>
    <link rel="icon" href="/icon.png" type="image/png">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body class="text-center">
    <header>
        <nav class="navbar navbar-expand-sm navbar-priamry bg-info py-0 fixed-top">
            <div class="container">

                <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav nav-tabs me-auto mt-2  mt-lg-0" id="navId" role="tablist">
                        <li class="nav-item">
                            <a class=" nav-link navbar-brand" href="/">MCQ Master</a>
                        </li>
                        <li class="nav-item">
                            <a href="/user/signup" class=" nav-link ">Sign up</a>
                        </li>
                        <li class="nav-item">
                            <spam  class="active nav-link">Sign in</spam>
                        </li>
                    </ul>
                    <div class="d-flex my-2 my-lg-0">
                        <!-- <input class="form-control me-sm-2" type="text" placeholder="Search" />
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                Search
              </button> -->
                        <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="changeTheme()"
                            id="themeButton">
                            Theme
                        </button>

                    </div>
                </div>
            </div>
        </nav>

        <script>
            let themeButton = document.getElementById("themeButton");
            themeButton.innerHTML = localStorage.getItem("theme") || "dark"
            document.body.setAttribute("data-bs-theme", themeButton.innerHTML == "Light" ? "dark" : "Light")
            function changeTheme() {

                document.body.setAttribute("data-bs-theme", themeButton.innerHTML)
                themeButton.innerHTML = themeButton.innerHTML == "Light" ? "dark" : "Light"
                localStorage.setItem("theme", themeButton.innerHTML)
            }

        </script>
    </header>
    <main class="form-signin w-100 m-auto">
        <form method="post" action="/user/login">
            <img class="mb-4" src="/icon.png" alt="" width="120" height="46" class="shadow">
            <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
            <p class="text-danger">${messege}</p>
            <div class="form-floating mb-3">
                <input  type="email" class="form-control" name="logginginMail" id="logginginMail" placeholder="name@example.com">
                <label for="logginginMail">Email address</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" name="logginginPassword" id="logginginPassword" placeholder="Password">
                <label for="logginginPassword">Password</label>
            </div>

            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="rememberMe" name="rememberMe"> Remember me
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted">&copy; 2017 - 2022</p>
        </form>
    </main>

    <footer>
       
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>