<%@ page contentType="text/html" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Quiz Result</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="/icon.png" type="image/png" />

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
                <span class="nav-link active">MCQ Result</span>
              </li>
            </ul>
            <div class="d-flex my-2 my-lg-0">
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
        <div class="text-center mb-4">
          <h1 class="display-5 text-success my-5">Quiz Results</h1>
          <div class="row mb-4">
            <!-- Total Questions -->
            <div class="col-md-6">
              <div class="card shadow text-center">
                <div class="card-body">
                  <h5 class="card-title">Total Questions</h5>
                  <h3 class="display-6">${totalQuestions}</h3>
                </div>
              </div>
            </div>

            <!-- Questions Attempted -->
            <div class="col-md-6">
              <div class="card shadow text-center">
                <div class="card-body">
                  <h5 class="card-title">Questions Attempted</h5>
                  <h3 class="display-6">${attemptedQuestions}</h3>
                </div>
              </div>
            </div>
          </div>

          <div class="row mb-4">
            <!-- Correct Answers -->
            <div class="col-md-6">
              <div class="card shadow text-center">
                <div class="card-body">
                  <h5 class="card-title">Correct Answers</h5>
                  <h3 class="display-6 text-success">${correctAnswers}</h3>
                </div>
              </div>
            </div>

            <!-- Attempt Percentage -->
            <div class="col-md-6">
              <div class="card shadow text-center">
                <div class="card-body">
                  <h5 class="card-title">Attempt Percentage</h5>
                  <h3 class="display-6 text-warning">${attemptPercentage}%</h3>
                  <div class="progress mt-2" style="height: 20px">
                    <div
                      class="progress-bar bg-warning"
                      role="progressbar"
                      style="width: ${attemptPercentage}%;"
                      aria-valuenow="${attemptPercentage}"
                      aria-valuemin="0"
                      aria-valuemax="100"
                    >
                      ${attemptPercentage}%
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row mb-4">
            <!-- Total Accuracy -->
            <div class="col-md-6">
              <div class="card shadow text-center">
                <div class="card-body">
                  <h5 class="card-title">Total Accuracy</h5>
                  <h3 class="display-6 text-info">${accuracy}%</h3>
                  <div class="progress mt-2" style="height: 20px">
                    <div
                      class="progress-bar bg-info"
                      role="progressbar"
                      style="width: ${accuracy}%;"
                      aria-valuenow="${accuracy}"
                      aria-valuemin="0"
                      aria-valuemax="100"
                    >
                      ${accuracy}%
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Attempt Accuracy -->
            <div class="col-md-6">
              <div class="card shadow text-center">
                <div class="card-body">
                  <h5 class="card-title">Attempt Accuracy</h5>
                  <h3 class="display-6 text-success">${attemptAccuracy}%</h3>
                  <div class="progress mt-2" style="height: 20px">
                    <div
                      class="progress-bar bg-success"
                      role="progressbar"
                      style="width: ${attemptAccuracy}%;"
                      aria-valuenow="${attemptAccuracy}"
                      aria-valuemin="0"
                      aria-valuemax="100"
                    >
                      ${attemptAccuracy}%
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <!-- Score -->
            <div class="col-md-12">
              <div class="card shadow text-center">
                <div class="card-body">
                  <h5 class="card-title">Score</h5>
                  <h3 class="display-6 text-primary">
                    ${correctAnswers} / ${totalQuestions}
                  </h3>
                  <div class="progress mt-2" style="height: 20px">
                    <div
                      class="progress-bar bg-primary"
                      role="progressbar"
                      style="width: ${accuracy}%;"
                      aria-valuenow="${accuracy}"
                      aria-valuemin="0"
                      aria-valuemax="100"
                    >
                      ${accuracy}%
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="text-center">
          <h1 class="display-5 text-success">Quiz Details</h1>
          <p class="text-muted">Here are the details of the quiz:</p>
        </div>

        <div class="card shadow mb-4">
          <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Your Answers</h5>
          </div>
          <div class="card-body">
            <table class="table table-bordered table-hover table-striped">
              <thead class="table-light">
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Question</th>
                  <th>Options</th>
                  <th scope="col">Your Answer</th>
                  <th>Correct Answer</th>
                </tr>
              </thead>
              <tbody>
                <style>
                  .text-warning td {
                    color: orange;
                  }

                  .text-success td {
                    color: green;
                  }

                  .text-danger td {
                    color: red;
                  }
                </style>
                <c:forEach
                  var="entry"
                  items="${userAnswers}"
                  varStatus="status"
                >
                  <tr
                    class="${entry.value == null || entry.value == '' ? 'text-warning' : (entry.value == entry.key.answers ? 'text-success' : 'text-danger')}"
                  >
                    <td scope="row">${status.count}</td>

                    <td>${entry.key.question}</td>
                    <td>
                      <ol>
                        <c:forEach var="option" items="${entry.key.options}">
                          <li>${option.text}</li>
                        </c:forEach>
                      </ol>
                    </td>
                    <td>${entry.value}</td>
                    <td>${entry.key.answers}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>

        <div class="d-flex justify-content-between">
          <a href="/mcq/quiz" class="btn btn-outline-primary">Retake Quiz</a>
          <a href="/" class="btn btn-outline-secondary">Go to Dashboard</a>
        </div>
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
