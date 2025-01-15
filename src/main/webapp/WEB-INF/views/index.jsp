<%@ page import="java.util.Base64" %> <%@ page contentType="text/html" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>MCQ Master</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="stylesheet" href="/style/style.css" />
    <link rel="icon" href="icon.png" type="image/png" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
  </head>

  <body data-bs-theme="light">
    <header class="sticky-top">
      <!-- Nav tabs -->

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
                <a
                  class="nav-link navbar-brand"
                  href="#tab1Id"
                  data-bs-toggle="tab"
                  >MCQ Master</a
                >
              </li>
              <li class="nav-item">
                <a href="#tab2Id" class="nav-link active" data-bs-toggle="tab"
                  >Home</a
                >
              </li>
              <li class="nav-item">
                <a href="#tab3Id" class="nav-link" data-bs-toggle="tab">MCQ</a>
              </li>
              <li class="nav-item">
                <a href="#tab4Id" class="nav-link" data-bs-toggle="tab"
                  >Users</a
                >
              </li>
              <li class="nav-item">
                <a href="#tab5Id" class="nav-link" data-bs-toggle="tab"
                  >Dashboard</a
                >
              </li>
              <li class="nav-item">
                <a
                  href="#tab6Id"
                  class="nav-link"
                  data-bs-toggle="tab"
                  id="navBartest"
                  >Test</a
                >
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
      <!-- Tab panes -->
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="tab1Id" role="tabpanel">
          <%@ include file="homeComponents/intro.jsp" %>
        </div>
        <div class="tab-pane fade show active" id="tab2Id" role="tabpanel">
          <%@ include file="homeComponents/home.jsp" %>
        </div>
        <div class="tab-pane fade" id="tab3Id" role="tabpanel">
          <%@ include file="homeComponents/mcq.jsp" %>
        </div>
        <div class="tab-pane fade" id="tab4Id" role="tabpanel">
          <%@ include file="homeComponents/user.jsp" %>
        </div>
        <div class="tab-pane fade" id="tab5Id" role="tabpanel">
          <%@ include file="homeComponents/dashboard.jsp" %>
        </div>

        <div class="tab-pane fade" id="tab6Id" role="tabpanel">
          <%@ include file="homeComponents/test.jsp" %>
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
