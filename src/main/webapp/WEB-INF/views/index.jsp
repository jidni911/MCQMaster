<%@ page contentType="text/html" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!doctype html>
    <html lang="en">

    <head>
      <title>MCQ Master </title>
      <!-- Required meta tags -->
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <link rel="stylesheet" href="/style/style.css">
      <link rel="icon" href="icon.png" type="image/png">

      <!-- Bootstrap CSS v5.2.1 -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    </head>

    <body data-bs-theme="light">
      <header class="sticky-top">
        <!-- Nav tabs -->


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
                  <a class=" nav-link navbar-brand active" href="#tab1Id" data-bs-toggle="tab">MCQ Master</a>
                </li>
                <li class="nav-item">
                  <a href="#tab2Id" class="nav-link " data-bs-toggle="tab">Home</a>
                </li>
                <li class="nav-item">
                  <a href="#tab3Id" class="nav-link " data-bs-toggle="tab">MCQ</a>
                </li>
                <li class="nav-item">
                  <a href="#tab4Id" class="nav-link " data-bs-toggle="tab">Users</a>
                </li>
                <li class="nav-item">
                  <a href="#tab5Id" class="nav-link " data-bs-toggle="tab">Dashboard</a>
                </li>
                <li class="nav-item">
                  <a href="#tab6Id" class="nav-link " data-bs-toggle="tab">Test</a>
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


        <!-- Tab panes -->
        <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade  show active" id="tab1Id" role="tabpanel">
            hello world
            <div>
              ${user != null ? user.getName() : 'Guest'}

            </div>
          </div>
          <div class="tab-pane fade" id="tab2Id" role="tabpanel">

            <div id="homeMainDiv" class="d-flex flex-column text-white bg-overlay background">
              <script src="/script/script.js">
              </script>
              <!-- Hero Section -->
              <div class="container my-auto text-center">
                <h1 class="display-4 fw-bold mb-3">Welcome to MCQ Master</h1>
                <h2 class=" fw-bold mb-3">${user.getName()}</h2>
                <p class="lead mb-4">
                  Create and take quizzes, track your progress, and challenge your knowledge.
                </p>

                <div class="container mt-5">
                  <div class="row text-center">
                    <div class="col-md-4">
                      <h3 class="display-6 fw-bold">${totalMCQ}+</h3>
                      <p>Quizzes Created</p>
                    </div>
                    <div class="col-md-4">
                      <h3 class="display-6 fw-bold">1000+</h3>
                      <p>Questions Answered</p>
                    </div>
                    <div class="col-md-4">
                      <h3 class="display-6 fw-bold">85%</h3>
                      <p>Average Score</p>
                    </div>
                  </div>
                </div>


                <!-- Call-to-Action Buttons -->
                <div class="d-flex flex-column flex-md-row gap-3 justify-content-center">
                  <a href="/mcq/create" class="btn btn-primary btn-lg px-4">Add MCQs</a>
                  <a href="/mcq/quiz" class="btn btn-outline-light btn-lg px-4">Take a Test</a>
                  <a routerLink="/results" class="btn btn-success btn-lg px-4">View Results</a>
                </div>
              </div>

              <!-- Authentication Buttons -->
              <div class="container text-center mt-3" [hidden]="isLoggedin()">
                <p>
                  New here?
                  <a href="/user/signup" class="text-warning"> Sign
                    Up</a>
                  or
                  <a href="/user/login" class="text-warning">Sign
                    In</a>
                </p>
              </div>

              <!-- Footer Section -->
              <footer class="container-fluid mt-auto py-3 bg-dark text-light text-center">
                <p class="mb-0">&copy; {{ Date.getFullYear() }} MCQ Master. All Rights Reserved.</p>
              </footer>
            </div>



          </div>
          <div class="tab-pane fade " id="tab3Id" role="tabpanel">
            <div class="text-center py-5 bg-dark bg-opacity-50 text-white">
              <h1 class="display-5 fw-bold">Engaging MCQs for You!</h1>
              <p class="lead">Challenge your knowledge and learn something new.</p>
            </div>

            <c:if test="${user.getId()!=null}">
              <!-- Button Section -->
              <div class="text-center py-4">
                <a class="btn btn-primary btn-lg mx-2" href="/mcq/create">Add MCQ</a>
                <a class="btn btn-success btn-lg mx-2" href="/mcq/quiz">Start Quiz</a>
                <a class="btn btn-warning btn-lg mx-2">View Results</a>
                <a class="btn btn-danger btn-lg mx-2" routerLink="/mcq/manage">Manage</a>
              </div>
            </c:if>

            <!-- MCQ List Section -->
            <div class="container py-4">
              <div class="row g-4">
                <c:forEach var="mcq" items="${MCQs}">
                  <div class="col-md-6 col-lg-4">
                    <div class="card shadow-sm h-100">
                      <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold mb-3">${ mcq.question }</h5>
                        <div class="mb-3">
                          <c:forEach var="option" items="${mcq.options}">

                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="option${ mcq.id }"
                                id="option{{ mcq.id }}_{{ option }}" />
                              <label class="form-check-label" for="option{{ mcq.id }}_{{ option }}">
                                ${ option.text }
                              </label>
                            </div>


                          </c:forEach>
                        </div>
                        <div class="mt-auto text-muted small">
                          <span class="badge bg-primary">${mcq.topic}</span>
                          <span class="badge bg-primary">${mcq.domain}</span>
                          <span class="badge bg-secondary float-end">created by: ${mcq.credit.name}</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>

              </div>
            </div>

            <c:if test="${user.getId()==null}">

              <div class="container-fluid bg-light py-5">
                <div class="text-center">
                  <h2 class="display-6 fw-bold">Login to Continue</h2>
                  <p class="lead">Please login to access more features and track your progress.</p>
                  <button class="btn btn-primary btn-lg mt-3" data-bs-toggle="modal"
                    data-bs-target="#loggingModal">Login</button>
                </div>
              </div>
            </c:if>

          </div>
          <div class="tab-pane fade" id="tab4Id" role="tabpanel">
            <div style="background-image: url(/userbg.png);
 background-repeat: no-repeat;
background-size: cover;
background-position: top center;
">

              <div class="table-responsive text-center container">
                <table class="table table-striped table-hover table-border table-primary align-middle">
                  <thead class="table-light">

                    <div class="text-danger text-center h1">Users</div>
                    <tr>
                      <c:if test="${user.getRole() == 'admin'}">
                        <th>ID</th>
                      </c:if>
                      <th>Name</th>
                      <th>email</th>
                      <c:if test="${user.getRole() == 'admin'}">
                        <th>Password</th>
                      </c:if>
                      <th>DoB</th>
                      <th>Role</th>
                      <th>Image</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody class="table-group-divider">
                    <c:forEach var="user" items="${users}">
                      <tr class="moye">
                        <c:if test="${user.getRole() == 'admin'}">
                          <td>${user.getId()}}</td>
                        </c:if>
                        <td>${ user.name }</td>
                        <td>${ user.email }</td>
                        <c:if test="${user.getRole() == 'admin'}">
                          <td>${user.getPassword()}</td>
                        </c:if>
                        <td>${ user.dob }</td>
                        <td>${ user.role }</td>
                        <td><img [src]="user.image" alt="User Image" width="50" height="50"></td>
                        <td>
                          <a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button"
                            (click)="viewUser(user)">View</a>
                          <a (click)="viewUser(user)" class="btn btn-outline-warning" data-bs-toggle="modal"
                            href="#exampleModalToggle2" role="button" *ngIf="isAdmin()">Edit</a>
                          <a (click)="deleteUser(user.id)" class="btn btn-danger" *ngIf="isAdmin()">Delete</a>
                        </td>
                      </tr>
                    </c:forEach>

                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="7" class="text-center">
                        <c:if test="user.role==admin">
                          <button *ngIf="isAdmin()" type="button" class="btn btn-outline-primary btn-lg"
                            data-bs-toggle="modal" data-bs-target="#addUserModal">
                            Add User
                          </button>
                        </c:if>

                      </td>
                    </tr>
                  </tfoot>
                </table>
              </div>


              <app-user-info [selectingUser]="selecterUser" (notifyParent)="ngOnInit()"></app-user-info>
              <app-user-create (notifyParent)="ngOnInit()"></app-user-create>
            </div>

          </div>
          <div class="tab-pane fade" id="tab5Id" role="tabpanel">
            <div class="">
              <c:if test="${user.role.toLowerCase().equals('user')}">
                <div class="d-flex">
                  <!-- Fixed Sidebar Navigation -->
                  <nav class="navbar navbar-expand-lg navbar-light  flex-column shadow" id="sidebar">
                    <div class="container-fluid">
                      <a class="navbar-brand fw-bold" href="#">Dashboard</a>
                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                      </button>
                      <div class="collapse navbar-collapse" id="sidebarMenu">
                        <ul class="navbar-nav flex-column">
                          <li class="nav-item">
                            <a class="nav-link" href="#overview"><i class="bi bi-speedometer2"></i> Overview</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#mcqStats"><i class="bi bi-list-task"></i> MCQ Statistics</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#testStats"><i class="bi bi-journal-check"></i> Test
                              Statistics</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#actions"><i class="bi bi-tools"></i> Actions</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#graphSection"><i class="bi bi-graph-up"></i> Analytics</a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </nav>

                  <!-- Main Content Area -->
                  <div class="container-fluid ms-3" id="mainContent">
                    <!-- Overview Section -->
                    <section id="overview" class="mb-5">
                      <h4 class="text-primary">User Dashboard Overview</h4>
                      <div class="row">
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Total MCQs</h5>
                              <h3 class="text-success">${userTotalMcqs}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Total Tests Taken</h5>
                              <h3 class="text-primary">${userTestsTaken}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Reported MCQs</h5>
                              <h3 class="text-danger">${userReportedMcqs}</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- MCQ Statistics Section -->
                    <section id="mcqStats" class="mb-5">
                      <h4 class="text-info">MCQ Statistics</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">MCQs Created</h5>
                              <h3 class="text-warning">${userTotalMcqs}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">MCQs Attempted</h5>
                              <h3 class="text-primary">${userMcqsAttempted}</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Test Statistics Section -->
                    <section id="testStats" class="mb-5">
                      <h4 class="text-secondary">Test Statistics</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Tests Taken</h5>
                              <h3 class="text-info">${userTestsTaken}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Average Score</h5>
                              <h3 class="text-success">${userAverageScore}%</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Actions Section -->
                    <section id="actions" class="mb-5">
                      <h4 class="text-danger">Actions</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Manage MCQs</h5>
                              <div class="d-grid">
                                <a href="/mcq/manage" class="btn btn-warning">Update/Delete MCQs</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">View Reports</h5>
                              <div class="d-grid">
                                <a href="/reports" class="btn btn-danger">Reported MCQs</a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Analytics Section -->
                    <section id="graphSection" class="mb-5">
                      <h4 class="text-success">User Analytics</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Test Scores</h5>
                              <canvas id="testScoresChart"></canvas>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">MCQ Performance</h5>
                              <canvas id="mcqPerformanceChart"></canvas>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>
                  </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                  // Test Scores Chart
                  const ctx1 = document.getElementById('testScoresChart').getContext('2d');
                  new Chart(ctx1, {
                    type: 'line',
                    data: {
                      labels: ['Test 1', 'Test 2', 'Test 3', 'Test 4', 'Test 5'],
                      datasets: [{
                        label: 'Score (%)',
                        data: [80, 70, 85, 75, 90],
                        borderColor: 'blue',
                        backgroundColor: 'rgba(0, 123, 255, 0.2)'
                      }]
                    }
                  });

                  // MCQ Performance Chart
                  const ctx2 = document.getElementById('mcqPerformanceChart').getContext('2d');
                  new Chart(ctx2, {
                    type: 'bar',
                    data: {
                      labels: ['Correct', 'Incorrect', 'Skipped'],
                      datasets: [{
                        label: 'Performance',
                        data: [50, 30, 20],
                        backgroundColor: ['green', 'red', 'gray']
                      }]
                    }
                  });
                </script>

              </c:if>
              <c:if test="${user.role.toLowerCase().equals('admin')}">
                <div class="d-flex">
                  <!-- Fixed Sidebar Navigation -->
                  <nav class="navbar navbar-expand-lg navbar-light flex-column shadow" id="sidebar">
                    <div class="container-fluid">
                      <a class="navbar-brand fw-bold" href="#">Admin Dashboard</a>
                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                      </button>
                      <div class="collapse navbar-collapse" id="sidebarMenu">
                        <ul class="navbar-nav flex-column">
                          <li class="nav-item">
                            <a class="nav-link" href="#overview"><i class="bi bi-speedometer2"></i> Overview</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#userStats"><i class="bi bi-people"></i> User Statistics</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#mcqStats"><i class="bi bi-list-task"></i> MCQ Statistics</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#actions"><i class="bi bi-tools"></i> Actions</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#graphSection"><i class="bi bi-graph-up"></i> Analytics</a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </nav>

                  <!-- Main Content Area -->
                  <div class="container-fluid ms-3" id="mainContent">
                    <!-- Overview Section -->
                    <section id="overview" class="mb-5">
                      <h4 class="text-primary">Admin Dashboard Overview</h4>
                      <div class="row">
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Total Users</h5>
                              <h3 class="text-success">${totalUsers}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Active Users</h5>
                              <h3 class="text-primary">${activeUsers}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Reported MCQs</h5>
                              <h3 class="text-danger">${totalReportedMcqs}</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- User Statistics Section -->
                    <section id="userStats" class="mb-5">
                      <h4 class="text-info">User Statistics</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Total Banned Users</h5>
                              <h3 class="text-danger">${bannedUsers}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Suspended Users</h5>
                              <h3 class="text-warning">${suspendedUsers}</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- MCQ Statistics Section -->
                    <section id="mcqStats" class="mb-5">
                      <h4 class="text-secondary">MCQ Statistics</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Total MCQs Created</h5>
                              <h3 class="text-info">${totalMcqs}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Deleted MCQs</h5>
                              <h3 class="text-danger">${deletedMcqs}</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Actions Section -->
                    <section id="actions" class="mb-5">
                      <h4 class="text-danger">Admin Actions</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Manage Users</h5>
                              <div class="d-grid">
                                <a href="/admin/manageUsers" class="btn btn-warning">Suspend/Ban Users</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Manage MCQs</h5>
                              <div class="d-grid">
                                <a href="/admin/manageMcqs" class="btn btn-danger">Delete/Resolve MCQs</a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Analytics Section -->
                    <section id="graphSection" class="mb-5">
                      <h4 class="text-success">Admin Analytics</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">User Activity</h5>
                              <canvas id="userActivityChart"></canvas>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">MCQ Reports</h5>
                              <canvas id="mcqReportsChart"></canvas>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>
                  </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                  // User Activity Chart
                  const ctx1 = document.getElementById('userActivityChart').getContext('2d');
                  new Chart(ctx1, {
                    type: 'bar',
                    data: {
                      labels: ['Active', 'Banned', 'Suspended'],
                      datasets: [{
                        label: 'Users',
                        data: [450, 10, 15],
                        backgroundColor: ['green', 'red', 'orange']
                      }]
                    }
                  });

                  // MCQ Reports Chart
                  const ctx2 = document.getElementById('mcqReportsChart').getContext('2d');
                  new Chart(ctx2, {
                    type: 'doughnut',
                    data: {
                      labels: ['Resolved', 'Pending'],
                      datasets: [{
                        label: 'Reports',
                        data: [20, 10],
                        backgroundColor: ['blue', 'gray']
                      }]
                    }
                  });
                </script>

              </c:if>
              <c:if test="${user.role.toLowerCase().equals('dev')}">
                <div class="d-flex">
                  <!-- Fixed Sidebar Navigation -->
                  <nav class="navbar navbar-expand-lg navbar-light  flex-column shadow" id="sidebar">
                    <div class="container-fluid">
                      <a class="navbar-brand fw-bold" href="#">Developer Dashboard</a>
                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                      </button>
                      <div class="collapse navbar-collapse" id="sidebarMenu">
                        <ul class="navbar-nav flex-column">
                          <li class="nav-item">
                            <a class="nav-link" href="#overview"><i class="bi bi-speedometer2"></i> Overview</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#websiteStats"><i class="bi bi-bar-chart-line"></i> Website
                              Stats</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#trafficStats"><i class="bi bi-traffic-cone"></i> Traffic</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#roleManagement"><i class="bi bi-person-check"></i> Role
                              Management</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#graphSection"><i class="bi bi-graph-up"></i> Analytics</a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </nav>

                  <!-- Main Content Area -->
                  <div class="container-fluid ms-3" id="mainContent">
                    <!-- Overview Section -->
                    <section id="overview" class="mb-5">
                      <h4 class="text-primary">Developer Dashboard Overview</h4>
                      <div class="row">
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Website Uptime</h5>
                              <h3 class="text-success">${websiteUptime}%</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Response Time</h5>
                              <h3 class="text-warning">${responseTime} ms</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Active Roles</h5>
                              <h3 class="text-primary">${activeRoles}</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Website Stats Section -->
                    <section id="websiteStats" class="mb-5">
                      <h4 class="text-info">Website Performance</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Requests Handled</h5>
                              <h3 class="text-success">${totalRequests}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Errors Encountered</h5>
                              <h3 class="text-danger">${totalErrors}</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Traffic Stats Section -->
                    <section id="trafficStats" class="mb-5">
                      <h4 class="text-secondary">Website Traffic</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Monthly Visitors</h5>
                              <h3 class="text-info">${monthlyVisitors}</h3>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Bounce Rate</h5>
                              <h3 class="text-warning">${bounceRate}%</h3>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Role Management Section -->
                    <section id="roleManagement" class="mb-5">
                      <h4 class="text-danger">Role Management</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Manage User Roles</h5>
                              <div class="d-grid">
                                <a href="/dev/manageRoles" class="btn btn-warning">Assign/Modify Roles</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Monitor Site Performance</h5>
                              <div class="d-grid">
                                <a href="/dev/monitorPerformance" class="btn btn-danger">View Logs</a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Analytics Section -->
                    <section id="graphSection" class="mb-5">
                      <h4 class="text-success">Developer Analytics</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Performance Trends</h5>
                              <canvas id="performanceTrendsChart"></canvas>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="card shadow">
                            <div class="card-body">
                              <h5 class="card-title">Traffic Trends</h5>
                              <canvas id="trafficTrendsChart"></canvas>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>
                  </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                  // Performance Trends Chart
                  const ctx1 = document.getElementById('performanceTrendsChart').getContext('2d');
                  new Chart(ctx1, {
                    type: 'line',
                    data: {
                      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                      datasets: [{
                        label: 'Uptime',
                        data: [99.5, 99.8, 99.6, 99.4, 99.7, 99.9],
                        borderColor: 'green',
                        fill: false
                      }]
                    }
                  });

                  // Traffic Trends Chart
                  const ctx2 = document.getElementById('trafficTrendsChart').getContext('2d');
                  new Chart(ctx2, {
                    type: 'bar',
                    data: {
                      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                      datasets: [{
                        label: 'Visitors',
                        data: [12000, 13000, 14000, 15000, 16000, 25000],
                        backgroundColor: 'blue'
                      }]
                    }
                  });
                </script>

              </c:if>
            </div>
          </div>

          <div class="tab-pane fade" id="tab6Id" role="tabpanel">
            <div class="container mt-4">
              <div class="row">
                <!-- Section for Attempting a Test -->
                <div class="col-md-6">
                  <div class="card shadow">
                    <div class="card-body">
                      <h5 class="card-title text-center">Attempt a Test</h5>
                      <form method="post" action="/test/attempt">
                        <div class="mb-3">
                          <label for="testCode" class="form-label">Enter Test Code</label>
                          <input type="text" class="form-control" id="testCode" name="testCode"
                            placeholder="Enter the test code here" required>
                        </div>
                        <div class="d-grid">
                          <button type="submit" class="btn btn-primary">Attempt Test</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>

                <!-- Section for Creating a Test -->
                <div class="col-md-6">
                  <div class="card shadow">
                    <div class="card-body">
                      <h5 class="card-title text-center">Create a Test</h5>
                      <p class="text-center">Want to create a test for others to attempt? Click the button below to get
                        started!</p>
                      <div class="d-grid">
                        <a href="/test/create" class="btn btn-success">Create Test</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      </main>
      <footer>
        <!-- place footer here -->
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