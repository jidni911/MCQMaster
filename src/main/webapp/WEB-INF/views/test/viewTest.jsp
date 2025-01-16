<%@ page import="java.util.Base64" %> <%@ page contentType="text/html" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <title>${test.name}</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
    </head>

    <body>
        <header>
            <nav class="navbar navbar-expand-sm navbar-priamry bg-info py-0">
              <div class="container">
                <button
                  class="navbar-toggler d-lg-none"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapsibleNavId"
                  aria-controls="collapsibleNavId"
                  aria-expanded="false"
                  aria-label="Toggle navigation"
                >
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                  <ul
                    class="navbar-nav nav-tabs me-auto mt-2 mt-lg-0"
                    id="navId"
                    role="tablist"
                  >
                    <li class="nav-item">
                      <a class="nav-link navbar-brand" href="/">MCQ Master</a>
                    </li>
                    <li class="nav-item">
                      <span class="nav-link active">Test: ${test.name}</span>
                    </li>
                  </ul>
                  <div class="d-flex my-2 my-lg-0">
                    <!-- <input class="form-control me-sm-2" type="text" placeholder="Search" />
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                              Search
                            </button> -->
                    <button
                      class="btn btn-outline-success my-2 my-sm-0"
                      type="button"
                      onclick="changeTheme()"
                      id="themeButton"
                    >
                      Theme
                    </button>
                  </div>
                </div>
              </div>
            </nav>
      
            <script>
              let themeButton = document.getElementById("themeButton");
              themeButton.innerHTML = localStorage.getItem("theme") || "dark";
              document.body.setAttribute(
                "data-bs-theme",
                themeButton.innerHTML == "Light" ? "dark" : "Light"
              );
              function changeTheme() {
                document.body.setAttribute("data-bs-theme", themeButton.innerHTML);
                themeButton.innerHTML =
                  themeButton.innerHTML == "Light" ? "dark" : "Light";
                localStorage.setItem("theme", themeButton.innerHTML);
              }
            </script>
          </header>
        <main>
            <div class="container mt-5">
                <div class="text-center mb-5">
                    <h1 class="display-4">Test Details</h1>
                    <p class="lead">Overview of the test and its multiple-choice questions (MCQs).</p>
                </div>
        
                <!-- Test Info -->
                <div class="card mb-4 shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h3 class="mb-0">Test Information</h3>
                    </div>
                    <div class="card-body">
                        <p><strong>Test ID:</strong> ${test.id}</p>
                        <p><strong>Test Name:</strong> ${test.name}</p>
                        <p><strong>Time Created:</strong> ${test.time}</p>
                    </div>
                </div>
        
                <!-- MCQs Table -->
                <div class="table-responsive shadow-sm">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Question</th>
                                <th>Topic</th>
                                <th>Domain</th>
                                <th>Correct Answer</th>
                                <th>Options</th>
                                <th>Created By</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="mcq" items="${test.mcqs}">
                                <tr>
                                    <td>${mcq.id}</td>
                                    <td>${mcq.question}</td>
                                    <td>${mcq.topic}</td>
                                    <td>${mcq.domain}</td>
                                    <td>Option ${mcq.answers}</td>
                                    <td>
                                        <ul class="mb-0">
                                            <c:forEach var="option" items="${mcq.options}">
                                                <li>${option.serial}. ${option.text}</li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        ${mcq.credit.name} <br>
                                        (<a href="mailto:${mcq.credit.email}">${mcq.credit.email}</a>)
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <h2 id="submits">Submits</h2>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Maker</th>
                        <th>Taker</th>
                        <th>Correct</th>
                        <th>Attempt</th>
                        <th>Success Rate</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="result" items="${test.results}">
                        <tr>
                            <td>${result.id}</td>
                            <td>${result.test.maker.name}</td>
                            <td>${result.taker.name}</td>
                            <td>${result.successCount}</td>
                            <td>${result.attemptCount}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${result.attemptCount > 0}">
                                        ${(result.successCount / result.attemptCount ) * 100}%
                                    </c:when>
                                    <c:otherwise>0%</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/mcq/viewResult/${result.id}" class="btn btn-primary btn-sm">View Result</a>
                                <a href="/test/retake/${test.id}" class="btn btn-secondary btn-sm">Retake</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        </main>
        <footer>
            <!-- place footer here -->
        </footer>
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
