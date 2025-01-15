<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!doctype html>
    <html lang="en">

    <head>
        <title>Results </title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous" />
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
                                <span class=" nav-link active">Results</span>
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
        <div class="container mt-5">
            <h1 class="mb-4">Results</h1>

            <!-- Quiz Results Section -->
            <h2>Quizzes</h2>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Quiz ID</th>
                        <th>User</th>
                        <th>Number of Questions</th>
                        <th>Attempt</th>
                        <th>Success Rate</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="result" items="${results}">
                        <tr>
                            <td>${result.id}</td>
                            <td>${result.taker.name}</td>
                            <td>${result.getUserAnswers().size()}</td>
                            <td>${result.getUserAnswers().values().size()}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${result.getUserAnswers().size() > 0}">
                                        ${(result.successCount / result.getUserAnswers().size() ) * 100}%
                                    </c:when>
                                    <c:otherwise>0%</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/quiz/view/${quiz.id}" class="btn btn-primary btn-sm">View Result</a>
                                <a href="/quiz/retake/${quiz.id}" class="btn btn-secondary btn-sm">Retake</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Test Results Section -->
            <h2>Tests</h2>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Test ID</th>
                        <th>Creator</th>
                        <th>Number of Questions</th>
                        <th>Attempt</th>
                        <th>Success Rate</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="result" items="${results}">
                        <tr>
                            <td>${result.id}</td>
                            <td>${result.test.maker.name}</td>
                            <td>${result.getUserAnswers().size()}</td>
                            <td>${result.getUserAnswers().values().size()}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${result.getUserAnswers().size() > 0}">
                                        ${(result.successCount / result.getUserAnswers().size() ) * 100}%
                                    </c:when>
                                    <c:otherwise>0%</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/quiz/viewResult/${result.id}" class="btn btn-primary btn-sm">View Result</a>
                                <a href="/quiz/retake/${quiz.id}" class="btn btn-secondary btn-sm">Retake</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- Bootstrap JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
    </body>

    </html>