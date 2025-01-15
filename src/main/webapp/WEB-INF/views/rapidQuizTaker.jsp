<%@ page contentType="text/html" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!doctype html>
        <html lang="en">

        <head>
            <title>Quiz Rapid Fire</title>
            <!-- Required meta tags -->
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <link rel="icon" href="/icon.png" type="image/png">

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
                                    <span class=" nav-link active">MCQ Exam</span>
                                </li>

                            </ul>
                            <div class="d-flex my-2 my-lg-0">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                                    onclick="changeTheme()" id="themeButton">
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
            <main class="container py-5">
                <div class="  card-sm mt-4 ">
                    <div class=" bg-success text-white p-2 mb-3 rounded">
                        <h2>Quiz of ${test.getMcqs().size()} question (by ${test.maker.name})</h2>
                    </div>
                    <% int i=1; %>
                        <style>
                            .question-container {
                                display: flex;
                                overflow: hidden;
                                position: relative;
                                width: 100%;
                                height: auto;
                            }

                            .question-container::before,
                            .question-container::after {
                                content: "";
                                position: absolute;
                                width: 50px;
                                /* Adjust based on the fade width */
                                height: 100%;
                                top: 0;
                                z-index: 1;
                                pointer-events: none;
                                background: linear-gradient(to right, white, rgba(255, 255, 255, 0));
                            }

                            .question-container::after {
                                right: 0;
                                left: auto;
                                background: linear-gradient(to left, white, rgba(255, 255, 255, 0));
                            }



                            .question-card {
                                flex: 0 0 70%;
                                /* transform: translateX(100%); */
                                transition: transform 0.5s ease-in-out;

                                width: 100%;
                                /* Positions all children absolutely relative to the container */
                                top: 0;
                                /* left: 100%; */
                            }
                        </style>

                        <form method="post" action="/mcq/submitQuiz">
                            <input type="hidden" name="testID" value="${test.id}">
                            <div class="question-container">
                                <c:forEach var="mcq" items="${test.getMcqs()}" varStatus="status">
                                    <div class="question-card px-3" id="question-${status.index}">
                                        <div class="mb-3 card shadow">
                                            <p class="card-header d-flex">
                                                <strong class="col-8">
                                                    <%=i++%>. ${mcq.question}
                                                </strong>
                                                <span class="col-1 text-end">Topic: ${mcq.topic}</span>
                                                <span class="col-1 text-end">Domain: ${mcq.domain}</span>
                                                <span class="col-1 text-end">Credit: ${mcq.credit.name}</span>
                                                <span class="col-1 text-end">
                                                    <button class="btn btn-outline-warning">Report</button>
                                                </span>
                                            </p>
                                            <div class="list-group list-group-flush card-body px-1">
                                                <c:forEach var="option" items="${mcq.options}">
                                                    <div
                                                        class="form-check list-group-item p-0 list-group-item-action d-flex">
                                                        <input type="radio" name="${mcq.id}"
                                                            class="form-check-input btn-check" onclick="nextBtn.click()"
                                                            id="${option.text}${option.id}" value="${option.serial}">
                                                        <label class="btn btn-outline-info w-100 text-start"
                                                            for="${option.text}${option.id}">
                                                            ${option.serial}. ${option.text}
                                                        </label>
                                                    </div>
                                                </c:forEach>
                                                <input type="hidden" name="${mcq.id}" value="">
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-secondary" id="prevBtn" disabled>Previous</button>
                                <button type="button" class="btn btn-primary" id="nextBtn">Next</button>
                            </div>

                            <div class="d-flex justify-content-between mt-3">
                                <a href="/mcq/quiz" class="btn btn-primary">Cancel Test</a>
                                <button class="btn btn-success" type="submit">Submit Quiz</button>
                                <button type="reset" class="btn btn-warning">Reset</button>
                            </div>
                        </form>

                        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                const questionCards = document.querySelectorAll(".question-card");
                                const prevBtn = document.getElementById("prevBtn");
                                const nextBtn = document.getElementById("nextBtn");

                                let currentQuestionIndex = 0;

                                function updateQuestions() {
                                    let i = 0;
                                    questionCards.forEach((card, index) => {

                                        if (Math.abs(index - currentQuestionIndex) < 2) {

                                            setTimeout(() => {

                                                card.style = "transform: translateX(" + (-currentQuestionIndex * 100 + 20) + "%);"
                                            }, 100 * i++  )
                                        } else {
                                            card.style = "transform: translateX(" + (-currentQuestionIndex * 100 + 20) + "%);"
                                        }


                                    });

                                    prevBtn.disabled = currentQuestionIndex === 0;
                                    nextBtn.disabled = currentQuestionIndex === questionCards.length - 1;
                                }

                                prevBtn.addEventListener("click", () => {
                                    if (currentQuestionIndex > 0) {
                                        currentQuestionIndex--;
                                        updateQuestions();
                                    }
                                });

                                nextBtn.addEventListener("click", () => {
                                    if (currentQuestionIndex < questionCards.length - 1) {
                                        currentQuestionIndex++;
                                        updateQuestions();
                                    }
                                });

                                updateQuestions();
                            });
                        </script>

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