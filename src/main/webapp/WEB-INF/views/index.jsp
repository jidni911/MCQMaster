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

  <body>
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
            <form class="d-flex my-2 my-lg-0">
              <input class="form-control me-sm-2" type="text" placeholder="Search" />
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                Search
              </button>
            </form>
          </div>
        </div>
      </nav>









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
                <a routerLink="/mcq/quiz" class="btn btn-outline-light btn-lg px-4">Take a Test</a>
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

          <app-user-create></app-user-create>


        </div>
        <div class="tab-pane fade " id="tab3Id" role="tabpanel">
          <div class="text-center py-5 bg-dark bg-opacity-50 text-white">
            <h1 class="display-5 fw-bold">Engaging MCQs for You!</h1>
            <p class="lead">Challenge your knowledge and learn something new.</p>
          </div>

          <c:if test="${user.getId()!=null}">
            <!-- Button Section -->
            <div class="text-center py-4">
              <button class="btn btn-primary btn-lg mx-2" routerLink="/mcq/create">Add MCQ</button>
              <button class="btn btn-success btn-lg mx-2" routerLink="/mcq/quiz">Start Quiz</button>
              <button class="btn btn-warning btn-lg mx-2">View Results</button>
              <button class="btn btn-danger btn-lg mx-2" routerLink="/mcq/manage">Manage</button>
            </div>
          </c:if>

          <!-- MCQ List Section -->
          <div class="container py-4">
            <div class="row g-4">
              <c:forEach var="item" items="${MCQs}">
                ${item}
              </c:forEach>
              <div *ngFor="let mcq of allMCQs" class="col-md-6 col-lg-4">
                <div class="card shadow-sm h-100">
                  <div class="card-body d-flex flex-column">
                    <h5 class="card-title fw-bold mb-3">{{ mcq.question }}</h5>
                    <div class="mb-3">
                      <div *ngFor="let option of mcq.options" class="form-check">
                        <input class="form-check-input" type="radio" name="option{{ mcq.id }}"
                          id="option{{ mcq.id }}_{{ option }}" />
                        <label class="form-check-label" for="option{{ mcq.id }}_{{ option }}">
                          {{ option }}
                        </label>
                      </div>
                    </div>
                    <div class="mt-auto text-muted small">
                      <span class="badge bg-primary">{{ mcq.topic }}</span>
                      <span class="badge bg-secondary float-end">created by: {{ mcq.credit }}</span>
                    </div>
                  </div>
                </div>
              </div>
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
          Coming soon...
        </div>
        <div class="tab-pane fade" id="tab6Id" role="tabpanel">
          no need
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