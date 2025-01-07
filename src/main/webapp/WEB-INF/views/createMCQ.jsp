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
        <!-- place navbar here -->
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
                            </div>
                            <button type="button" class="btn btn-outline-success" onclick="addOption()">Add Option</button>
                        </div>
        
                        <!-- Credit -->
                        <div class="mb-3">
                            <label for="credit" class="form-label fw-bold">Credit</label>
                            <input type="text" class="form-control" id="credit" name="creditName" readonly value="${user.getName()}">
                        </div>
        
                        <!-- Topic -->
                        <div class="mb-3">
                            <label for="topic" class="form-label fw-bold">Topic</label>
                            <input type="text" class="form-control" id="topic" name="topic" required>
                        </div>
        
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
        <!-- place footer here -->
    </footer>

    <script>
        function addOption() {
        const container = document.getElementById('options-container');
        const optionCount = container.children.length + 1;
        const optionGroup = document.createElement('div');
        optionGroup.className = 'input-group mb-2';
        optionGroup.innerHTML = `
            <input type="checkbox" name="answers" value="${optionCount}" class="form-check-input me-2">
            <input type="text" class="form-control" name="options" placeholder="Option ${optionCount}" required>
        `;
        container.appendChild(optionGroup);
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