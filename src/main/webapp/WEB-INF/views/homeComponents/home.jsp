
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
        <button onclick="navBartest.click()" class="btn btn-outline-light btn-lg px-4">Take a Test</button>
        <a href="/mcq/results" class="btn btn-success btn-lg px-4">View Results</a>
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
      <p class="mb-0">&copy; ${ date } MCQ Master. All Rights Reserved.</p>
    </footer>
  </div>

