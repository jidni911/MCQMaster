<!doctype html>
<html lang="en">

<head>
  <title>Create MCQ </title>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
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
              <span class=" nav-link active">MCQ Creation</span>
            </li>

          </ul>
          <div class="d-flex my-2 my-lg-0">
            <!-- <input class="form-control me-sm-2" type="text" placeholder="Search" />
                  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                    Search
                  </button> -->
            <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="changeTheme()" id="themeButton">
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
          <h3 class="mb-0">Add New MCQ</h3>
        </div>
        <div class="card-body">
          <form action="/mcq/create" method="post">
            <!-- Question -->
            <div class="mb-3">
              <label for="question" class="form-label fw-bold">Question</label>
              <textarea class="form-control" id="question" name="question" rows="3" required></textarea>
            </div>

            <!-- Options -->
            <div class="mb-3">
              <label for="options" class="form-label fw-bold">Options</label>
              <div id="options-container">
                <div class="input-group mb-2">
                  <input type="checkbox" name="answers" value="1" class="form-check-input me-2">
                  <input type="text" class="form-control" name="options" placeholder="Option 1" required>
                </div>
                <div class="input-group mb-2">
                  <input type="checkbox" name="answers" value="2" class="form-check-input me-2">
                  <input type="text" class="form-control" name="options" placeholder="Option 2" required>
                </div>
                <div class="input-group mb-2">
                  <input type="checkbox" name="answers" value="3" class="form-check-input me-2">
                  <input type="text" class="form-control" name="options" placeholder="Option 3" required>
                </div>
                <div class="input-group mb-2">
                  <input type="checkbox" name="answers" value="4" class="form-check-input me-2">
                  <input type="text" class="form-control" name="options" placeholder="Option 4" required>
                </div>
              </div>
              <button type="button" class="btn btn-outline-success" onclick="addOption()">Add
                Option</button>
              <button type="button" class="btn btn-outline-danger" onclick="removeOption()">Remove Last
                Option</button>
            </div>

            <!-- Credit -->
            <div class="mb-3">
              <label for="credit" class="form-label fw-bold">Credit</label>
              <input type="text" class="form-control" id="credit" name="credit" readonly value="${user.id}">
            </div>

            <!-- Domain -->
            <div class="mb-3">
              <label for="domain" class="form-label fw-bold">Domain</label>
              <input type="text" class="form-control" id="domain" name="domain" list="domainSuggestions" required value="${domain}">
              <datalist id="domainSuggestions">
                <!-- Suggestions will be dynamically populated -->
              </datalist>
            </div>
            <script>
              document.addEventListener('DOMContentLoaded', () => {
                fetch('/mcq/domains')
                  .then(response => response.json())
                  .then(domains => {
                    const datalist = document.getElementById('domainSuggestions');
                    domains.forEach(domain => {
                      const option = document.createElement('option');
                      option.value = domain;
                      datalist.appendChild(option);
                    });
                  })
                  .catch(error => console.error('Error fetching domain suggestions:', error));
              });
            </script>



            <!-- Topic -->

            <div class="mb-3">
              <label for="topic" class="form-label fw-bold">Topic</label>
              <input type="text" class="form-control" id="topic" name="topic" list="topicSuggestions" required value="${topic}">
              <datalist id="topicSuggestions">
                <!-- Suggestions will be dynamically added here -->
              </datalist>
            </div>
            <script>
              // When domain is selected, load topics dynamically
              document.getElementById('domain').addEventListener('change', function () {
                var domain = this.value;
                var datalist = document.getElementById('topicSuggestions');
                datalist.innerHTML = '';  // Clear existing topics

                if (domain) {
                  // Fetch topics based on the selected domain
                  fetch('/mcq/topics?domain=' + encodeURIComponent(domain))
                    .then(response => response.json())
                    .then(topics => {
                      // Add the fetched topics to the datalist
                      topics.forEach(function (topic) {
                        var option = document.createElement('option');
                        option.value = topic;
                        datalist.appendChild(option);
                      });
                    })
                    .catch(error => console.error('Error fetching topics:', error));
                }
              });
            </script>

            <!-- Submit Button -->
            <div class="text-center">
              <button type="submit" class="btn btn-primary px-4">Add MCQ</button>
            </div>
          </form>
        </div>
      </div>
    </div>

  </main>
  <footer>


    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
      <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header alert alert-success">
          <img src="/icon.png" height="20" width="20" class="rounded me-2" alt="...">
          <strong class="me-auto">MCQ Master</strong>
          <small>now</small>
          <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body alert alert-success">
          MCQ Added Successfully
        </div>
      </div>
    </div>
    <script>
      document.addEventListener('DOMContentLoaded', () => {
        if( "${showSuccessMessege}"=="true"){

          var toastElList = [].slice.call(document.querySelectorAll('.toast'))
          var toastList = toastElList.map(function (toastEl) {
            return new bootstrap.Toast(toastEl, { animation: true, delay: 5000 })
          })
          toastList[0].show()
        }

      })

    </script>
  </footer>

  <script>
    function addOption() {
      const container = document.getElementById('options-container');
      const optionCount = container.children.length + 1;
      const optionGroup = document.createElement('div');
      optionGroup.className = 'input-group mb-2';
      optionGroup.innerHTML = `
            <input type="checkbox" name="answers" value="`+ optionCount + `" class="form-check-input me-2">
            <input type="text" class="form-control" name="options" placeholder="Option `+ optionCount + `" required>
        `;
      container.appendChild(optionGroup);
    }

    function removeOption() {
      const container = document.getElementById('options-container');

      // Check if there are any options to remove
      if (container.children.length > 0) {
        container.removeChild(container.lastElementChild);
      }
    }
  </script>
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
    integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
    crossorigin="anonymous"></script>
</body>

</html>