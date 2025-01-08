<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
        <title>Title</title>
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
                                <span class=" nav-link active">MCQ Parameters</span>
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

            <form class="container py-5" method="post" action="/mcq/quiz">
                <div class="card-header bg-primary text-white text-center p-2 rounded rounded-5 m-5">
                    <h2>What do you want, ${user.name} ?</h2>
                </div>
                <div class="card-body">
                    <div>
                        <div class="mb-3">
                            <label for="numQuestions" class="form-label">Number of Questions:</label>
                            <input type="number" id="numQuestions" name="numQuestions" class="form-control" required>

                            <div class="row">
                                <div class="col-4">
                                    <div  class="form-label mt-3">Domain: ${domains.size()}</div>
                                    <div class="list-group" id="domainList">
                                        <c:forEach var="domain" items="${domains}">
                                            <div>
                                                <input type="checkbox" name="selectedDomains"
                                                    class="btn-check form-check-input" autocomplete="off" id="${domain}"
                                                    value="${domain}" onchange="updateTopic()">
                                                <label class="btn btn-outline-primary list-group-item my-1"
                                                    for="${domain}">${domain}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-label mt-3">Topic: <span
                                            id="topicCounter">0</span></div>
                                    <div class="list-group" id="topicList">
                                        <div class="btn btn-outline-primary list-group-item my-1">Select a domain
                                            First</div>
                                    </div>
                                    <script>
                                        function updateTopic() {
                                            let selectedDomains = [];
                                            document.querySelectorAll("input[name='selectedDomains']:checked").forEach(function (input) {
                                                selectedDomains.push(input.value);
                                            });

                                            if (selectedDomains.length > 0) {
                                                var datalist = document.getElementById('topicList');

                                                datalist.innerHTML = '';  // Clear existing topics

                                                // Send the domains as a comma-separated string
                                                fetch('/mcq/topics?domain=' + encodeURIComponent(selectedDomains.join(',')))
                                                    .then(response => response.json())
                                                    .then(topics => {
                                                        document.getElementById('topicCounter').innerText = topics.length
                                                        // Add the fetched topics to the datalist
                                                        topics.forEach(function (topic) {
                                                            var div = document.createElement('div');

                                                            div.innerHTML = `
                                                                <input type="checkbox" name="selectedTopics" class="btn-check form-check-input"
                                                                id="`+ topic + `" autocomplete="off" value=`+topic+`>
                                                                <label class="btn btn-outline-primary list-group-item my-1"
                                                                for="`+ topic + `">` + topic + `</label>`;
                                                            datalist.appendChild(div);
                                                        });
                                                    })
                                                    .catch(error => console.error('Error fetching topics:', error));
                                            } else {
                                                var datalist = document.getElementById('topicList');

                                                datalist.innerHTML = `<label class="btn btn-outline-primary list-group-item my-1">Select a domain
                                            First</label>`;
                                            document.getElementById('topicCounter').innerText = 0
                                            }
                                        }

                                    </script>
                                </div>
                                <div class="col-4">
                                    <div  class="form-label mt-3">Credits: ${credits.size()}</div>
                                    <div class="list-group" id="credit">
                                        <c:forEach var="credit" items="${credits}">

                                            <div >
                                                <input type="checkbox" name="selectedCredits"
                                                    class="btn-check form-check-input" id="${credit.id}" value="${credit.id}"
                                                    autocomplete="off">
                                                <label class="btn btn-outline-primary list-group-item my-1"
                                                    for="${credit.id}">${credit.name} (${credit.mcqs.size()})</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button (click)="startQuiz()" class="btn btn-primary w-100">Start Quiz</button>
                    </div>
                </div>
            </form>

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