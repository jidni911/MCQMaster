<!doctype html>
<html lang="en">

<head>
    <title>Sign Up</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-sm navbar-priamry bg-info py-0 ">
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
                            <span class=" nav-link active">Sign up</span>
                        </li>
                        <li class="nav-item">
                            <a href="/user/login" class=" nav-link">Sign in</a>
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
    <main>
        <div class="container py-5">
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">User Registration</h3>
                </div>
                <div class="card-body">
                    <p class="text-danger">${messege}</p>
                    <form action="/user/signup" method="post" enctype="multipart/form-data">
                        <!-- Name -->
                        <div class="mb-3">
                            <label for="name" class="form-label fw-bold">Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name"
                                required>
                        </div>
                        <!-- Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold">Email</label>
                            <input type="email" class="form-control" id="email" name="email"
                                placeholder="Enter your email" required>
                        </div>
                        <!-- Password -->
                        <div class="mb-3">
                            <label for="password" class="form-label fw-bold">Password</label>
                            <input type="password" class="form-control" id="password" name="password"
                                placeholder="Enter your password" required>
                        </div>
                        <!-- Date of Birth -->
                        <div class="mb-3">
                            <label for="dob" class="form-label fw-bold">Date of Birth</label>
                            <input type="date" class="form-control" id="dob" name="dob" required>
                        </div>
                        <!-- Image -->
                        <div class="mb-3">
                            <label for="image" class="form-label fw-bold">Image URL</label>
                            <input type="file" class="form-control" id="image" name="image" required accept="image/*" 
                                placeholder="Enter the image URL">
                        </div>
                        <!-- Submit Button -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary px-4">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <!-- Place footer here -->
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