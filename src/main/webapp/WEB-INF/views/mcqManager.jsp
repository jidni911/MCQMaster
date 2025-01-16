<%@ page contentType="text/html" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <a class="nav-link navbar-brand" href="/">MCQ Master</a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link active">MCQ manager</a>
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
      <div class="m-5 text-center">
        <form
          method="GET"
          action="/search"
          class="d-flex justify-content-between"
        >
          <div>
            <input
              type="text"
              name="id"
              class="form-control"
              placeholder="Search ID"
            />
          </div>
          <div>
            <input
              type="text"
              name="question"
              class="form-control"
              placeholder="Search Question"
            />
          </div>
          <div>
            <input
              type="text"
              name="options"
              class="form-control"
              placeholder="Search Options"
            />
          </div>
          <div>
            <input
              type="text"
              name="user"
              class="form-control"
              placeholder="Search User"
            />
          </div>
          <div>
            <input
              type="text"
              name="topic"
              class="form-control"
              placeholder="Search Topic"
            />
          </div>
          <div>
            <input
              type="text"
              name="domain"
              class="form-control"
              placeholder="Search Domain"
            />
          </div>
          <div>
            <button type="submit" class="btn btn-primary btn-sm">Search</button>
          </div>
        </form>
      </div>

      <div class="m-5">
        <div class="table-responsive">
          <table
            class="table table-striped table-hover table-borderless align-middle"
          >
            <thead class="">
              <caption>
                MCQ_Manager
              </caption>
              <tr>
                <th>ID</th>
                <th>Question</th>
                <th>Options</th>
                <th>Answer</th>
                <th>Credit</th>
                <th>User</th>
                <th>Topic</th>
                <th>Domain</th>
                <th>Perform</th>
              </tr>
            </thead>
            <tbody class="table-group-divider">
              <c:forEach var="mcq" items="${mcqList}">
                <tr class="">
                  <td>${mcq.id}</td>
                  <td><c:out value="${mcq.question}"/></td>
                  <td>
                    <ol>
                      <c:forEach var="option" items="${mcq.options}">
                        <li><c:out value="${option.text}"/></li>
                      </c:forEach>
                    </ol>
                  </td>
                  <td>${mcq.answers}</td>
                  <td>${mcq.credit.id}</td>
                  <td>${mcq.credit.name}</td>
                  <td>${mcq.topic}</td>
                  <td>${mcq.domain}</td>
                  <td>
                    <a class="btn btn-primary" href="/mcq/edit/${mcq.id}"
                      >Edit</a
                    >
                    <a
                      type="button"
                      class="btn btn-outline-danger"
                      href="/mcq/delete/${mcq.id}"
                    >
                      delete
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
            <tfoot></tfoot>
          </table>
        </div>
      </div>
    </main>
    <footer>
      <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
        <div
          id="liveToast"
          class="toast hide"
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
        >
          <div class="toast-header alert alert-success">
            <img
              src="/icon.png"
              height="20"
              width="20"
              class="rounded me-2"
              alt="..."
            />
            <strong class="me-auto">MCQ Master</strong>
            <small>now</small>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="toast"
              aria-label="Close"
            ></button>
          </div>
          <div class="toast-body alert alert-success">
            MCQ Deleted Successfully
          </div>
        </div>
      </div>
      <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
        <div
          id="liveToast2"
          class="toast hide"
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
        >
          <div class="toast-header alert alert-success">
            <img
              src="/icon.png"
              height="20"
              width="20"
              class="rounded me-2"
              alt="..."
            />
            <strong class="me-auto">MCQ Master</strong>
            <small>now</small>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="toast"
              aria-label="Close"
            ></button>
          </div>
          <div class="toast-body alert alert-success">
            MCQ Updated Successfully
          </div>
        </div>
      </div>
      <script>
        document.addEventListener("DOMContentLoaded", () => {
          if ("${showDeleteSuccess}" == "yes") {
            var toastElList = [].slice.call(
              document.querySelectorAll(".toast")
            );
            var toastList = toastElList.map(function (toastEl) {
              return new bootstrap.Toast(toastEl, {
                animation: true,
                delay: 5000,
              });
            });
            toastList[0].show();
          }
          if ("${showUpdateSuccess}" == "yes") {
            var toastElList = [].slice.call(
              document.querySelectorAll(".toast")
            );
            var toastList = toastElList.map(function (toastEl) {
              return new bootstrap.Toast(toastEl, {
                animation: true,
                delay: 5000,
              });
            });
            toastList[1].show();
          }
        });
      </script>
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
