<%@ page contentType="text/html" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Create Test</title>
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
                <span class="nav-link active">Test Creation</span>
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
    <main class="container mt-4">
        <h1>Create Test</h1>
        <form action="/test/create" method="post">
            <!-- Name Field -->
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter test name" required>
            </div>
    
            <!-- Time Field -->
            <div class="mb-3">
                <label for="time" class="form-label">Time</label>
                <input type="datetime-local" class="form-control" id="time" name="time" readonly value="${time}">
            </div>
    
            <!-- Maker (User) Readonly -->
            <div class="mb-3">
                <label for="maker" class="form-label">Maker</label>
                <input type="hidden" class="form-control" id="maker" name="maker" value="" readonly>
                <input type="text" class="form-control" id="maker2" name="" value="" readonly>
                <script>
                  if(localStorage.getItem("id")){
                    document.getElementById("maker").value= localStorage.getItem("id");
                    document.getElementById("maker2").value= localStorage.getItem("name");
                  } else if(sessionStorage.getItem("id")){
                    document.getElementById("maker").value= sessionStorage.getItem("id");
                    document.getElementById("maker2").value= sessionStorage.getItem("name");
                  }
                </script>
            </div>
    
            <!-- Search Fields -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="search-domain" class="form-label">Search by Domain</label>
                    <input type="text" class="form-control" id="search-domain" placeholder="Enter domain" oninput="searchMCQs()">
                </div>
                <div class="col-md-4">
                    <label for="search-topic" class="form-label">Search by Topic</label>
                    <input type="text" class="form-control" id="search-topic" placeholder="Enter topic" oninput="searchMCQs()">
                </div>
                <div class="col-md-4">
                    <label for="search-credit" class="form-label">Search by Credit</label>
                    <input type="text" class="form-control" id="search-credit" placeholder="Enter credit" oninput="searchMCQs()">
                </div>
            </div>
    
            <!-- MCQ Selection Boxes -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="unselected-mcqs" class="form-label">Unselected MCQs (<span id="umcqCount">0</span>)</label>
                    <select class="form-select" id="unselected-mcqs" size="10" multiple>
                        <!-- Options populated dynamically -->
                    </select>
                </div>
    
                <div class="col-md-6">
                    <label for="selected-mcqs" class="form-label">Selected MCQs (<span id="smcqCount">0</span>)</label>
                    <select class="form-select" id="selected-mcqs" name="mcqs" size="10" multiple>
                        <!-- Options populated dynamically -->
                    </select>
                </div>
            </div>
    
            <!-- Buttons to Move MCQs -->
            <div class="text-center mb-3">
                <button type="button" class="btn btn-primary me-2" onclick="moveToSelected()">&rarr;</button>
                <button type="button" class="btn btn-secondary" onclick="moveToUnselected()">&larr;</button>
            </div>
    
            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Create Test</button>
        </form>
    </main>
    
    <script>
        async function searchMCQs() {
            const domain = document.getElementById('search-domain').value;
            const topic = document.getElementById('search-topic').value;
            const credit = document.getElementById('search-credit').value;
    
            const response = await fetch(`/mcq/search?domain=`+domain+`&topic=`+topic+`&credit=`+credit);
            const mcqs = await response.json();
    
            const unselectedMCQs = document.getElementById('unselected-mcqs');
            unselectedMCQs.innerHTML = '';
    
            mcqs.forEach(mcq => {
                const option = document.createElement('option');
                option.value = mcq.id;
                option.textContent = "("+mcq.domain+"," + mcq.topic+","+mcq.credit.name+")"+ mcq.question;
                unselectedMCQs.appendChild(option);
            });
            document.getElementById("umcqCount").innerHTML = unselectedMCQs.children.length;
        }
    
        function moveToSelected() {
            const unselectedMCQs = document.getElementById('unselected-mcqs');
            const selectedMCQs = document.getElementById('selected-mcqs');
    
            Array.from(unselectedMCQs.selectedOptions).forEach(option => {
                unselectedMCQs.removeChild(option);
                selectedMCQs.appendChild(option);
            });
            document.getElementById("smcqCount").innerHTML = selectedMCQs.children.length;
            document.getElementById("umcqCount").innerHTML = unselectedMCQs.children.length;
        }
    
        function moveToUnselected() {
            const selectedMCQs = document.getElementById('selected-mcqs');
            const unselectedMCQs = document.getElementById('unselected-mcqs');
    
            Array.from(selectedMCQs.selectedOptions).forEach(option => {
                selectedMCQs.removeChild(option);
                unselectedMCQs.appendChild(option);
            });
            document.getElementById("smcqCount").innerHTML = selectedMCQs.children.length;
            document.getElementById("umcqCount").innerHTML = unselectedMCQs.children.length;
        }
    </script>
    
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
