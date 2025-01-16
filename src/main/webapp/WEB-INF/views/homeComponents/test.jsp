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
              <input
                type="text"
                class="form-control"
                id="testCode"
                name="testCode"
                placeholder="Enter the test code here"
                required
              />
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">
                Attempt Test
              </button>
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
          <p class="text-center">
            Want to create a test for others to attempt? Click the button below
            to get started!
          </p>
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
        <div class="table-responsive">
          <table
            class="table table-striped table-hover table-borderless  align-middle"
          >
            <thead class="table-light">
              <caption>
                All Tests
              </caption>
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Date</th>
                <th>Maker</th>
                <th>total questions</th>
                <th>total submits</th>
                <th colspan="2">Actions</th>
              </tr>
            </thead>
            <tbody class="table-group-divider">
              <c:forEach var="test" items="${tests}">
                <tr >
                  <td>${test.id}</td>
                  <td>${test.name}</td>
                  <td>${test.time}</td>
                  <td>${test.maker.name}</td>
                  <td>${test.mcqs.size()}</td>
                  <td>${test.results.size()}</td>
                  <td>
                    <a
                      name=""
                      id=""
                      class="btn btn-primary"
                      href="/test/viewQuestions/${test.id}"
                      role="button"
                      >View Questions
                    </a>
                  </td>
                  <td>
                    <a
                      name=""
                      id=""
                      class="btn btn-primary"
                      href="/test/viewQuestions/${test.id}#submits"
                      role="button"
                      >View Submits</a
                    >
                  </td>
                </tr>
              </c:forEach>
            </tbody>
            <tfoot></tfoot>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
