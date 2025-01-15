<div class="text-center py-5 bg-dark bg-opacity-50 text-white">
    <h1 class="display-5 fw-bold">Engaging MCQs for You!</h1>
    <p class="lead">Challenge your knowledge and learn something new.</p>
  </div>

  <c:if test="${user.getId()!=null}">
    <!-- Button Section -->
    <div class="text-center py-4">
      <a class="btn btn-primary btn-lg mx-2" href="/mcq/create">Add MCQ</a>
      <a class="btn btn-success btn-lg mx-2" href="/mcq/quiz">Start Quiz</a>
      <a class="btn btn-warning btn-lg mx-2" href="/mcq/results">View Results</a>
      <a class="btn btn-danger btn-lg mx-2" href="/mcq/manage">Manage</a>
    </div>
  </c:if>

  <!-- MCQ List Section -->
  <div class="container py-4">
    <div class="row g-4">
      <c:forEach var="mcq" items="${MCQs}">
        <div class="col-md-6 col-lg-4">
          <div class="card shadow-sm h-100">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title fw-bold mb-3">${ mcq.question }</h5>
              <div class="mb-3">
                <c:forEach var="option" items="${mcq.options}">

                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="option${ mcq.id }"
                      id="option{{ mcq.id }}_{{ option }}" />
                    <label class="form-check-label" for="option{{ mcq.id }}_{{ option }}">
                      ${ option.text }
                    </label>
                  </div>


                </c:forEach>
              </div>
              <div class="mt-auto text-muted small">
                <span class="badge bg-primary">${mcq.topic}</span>
                <span class="badge bg-primary">${mcq.domain}</span>
                <span class="badge bg-secondary float-end">created by: ${mcq.credit.name}</span>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>

    </div>
  </div>

  <c:if test="${user.getId()==null}">

    <div class="container-fluid bg-light py-5">
      <div class="text-center">
        <h2 class="display-6 fw-bold">Login to Continue</h2>
        <p class="lead">Please login to access more features and track your progress.</p>
        <button class="btn btn-primary btn-lg mt-3" data-bs-toggle="modal"
          data-bs-target="#loggingModal">Login</button>
      </div>
    </div>
  </c:if>