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
    <div class="my-5">
      <div class="card shadow">
        <div class="card-body">
          <h5 class="card-title text-center">Your Tests</h5>
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
  </div>