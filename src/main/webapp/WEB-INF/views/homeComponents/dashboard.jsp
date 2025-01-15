<div class="">
    <c:if test="${user.role.toLowerCase().equals('user')}">
      <div class="d-flex">
        <!-- Fixed Sidebar Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light  flex-column shadow" id="sidebar">
          <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="sidebarMenu">
              <ul class="navbar-nav flex-column">
                <li class="nav-item">
                  <a class="nav-link" href="#overview"><i class="bi bi-speedometer2"></i> Overview</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#mcqStats"><i class="bi bi-list-task"></i> MCQ Statistics</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#testStats"><i class="bi bi-journal-check"></i> Test
                    Statistics</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#actions"><i class="bi bi-tools"></i> Actions</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#graphSection"><i class="bi bi-graph-up"></i> Analytics</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>

        <!-- Main Content Area -->
        <div class="container-fluid ms-3" id="mainContent">
          <!-- Overview Section -->
          <section id="overview" class="mb-5">
            <h4 class="text-primary">User Dashboard Overview</h4>
            <div class="row">
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Total MCQs</h5>
                    <h3 class="text-success">${userTotalMcqs}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Total Tests Taken</h5>
                    <h3 class="text-primary">${userTestsTaken}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Reported MCQs</h5>
                    <h3 class="text-danger">${userReportedMcqs}</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- MCQ Statistics Section -->
          <section id="mcqStats" class="mb-5">
            <h4 class="text-info">MCQ Statistics</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">MCQs Created</h5>
                    <h3 class="text-warning">${userTotalMcqs}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">MCQs Attempted</h5>
                    <h3 class="text-primary">${userMcqsAttempted}</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Test Statistics Section -->
          <section id="testStats" class="mb-5">
            <h4 class="text-secondary">Test Statistics</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Tests Taken</h5>
                    <h3 class="text-info">${userTestsTaken}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Average Score</h5>
                    <h3 class="text-success">${userAverageScore}%</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Actions Section -->
          <section id="actions" class="mb-5">
            <h4 class="text-danger">Actions</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Manage MCQs</h5>
                    <div class="d-grid">
                      <a href="/mcq/manage" class="btn btn-warning">Update/Delete MCQs</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">View Reports</h5>
                    <div class="d-grid">
                      <a href="/reports" class="btn btn-danger">Reported MCQs</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Analytics Section -->
          <section id="graphSection" class="mb-5">
            <h4 class="text-success">User Analytics</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Test Scores</h5>
                    <canvas id="testScoresChart"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">MCQ Performance</h5>
                    <canvas id="mcqPerformanceChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script>
        // Test Scores Chart
        const ctx1 = document.getElementById('testScoresChart').getContext('2d');
        new Chart(ctx1, {
          type: 'line',
          data: {
            labels: ['Test 1', 'Test 2', 'Test 3', 'Test 4', 'Test 5'],
            datasets: [{
              label: 'Score (%)',
              data: [80, 70, 85, 75, 90],
              borderColor: 'blue',
              backgroundColor: 'rgba(0, 123, 255, 0.2)'
            }]
          }
        });

        // MCQ Performance Chart
        const ctx2 = document.getElementById('mcqPerformanceChart').getContext('2d');
        new Chart(ctx2, {
          type: 'bar',
          data: {
            labels: ['Correct', 'Incorrect', 'Skipped'],
            datasets: [{
              label: 'Performance',
              data: [50, 30, 20],
              backgroundColor: ['green', 'red', 'gray']
            }]
          }
        });
      </script>

    </c:if>
    <c:if test="${user.role.toLowerCase().equals('admin')}">
      <div class="d-flex">
        <!-- Fixed Sidebar Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light flex-column shadow" id="sidebar">
          <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="sidebarMenu">
              <ul class="navbar-nav flex-column">
                <li class="nav-item">
                  <a class="nav-link" href="#overview"><i class="bi bi-speedometer2"></i> Overview</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#userStats"><i class="bi bi-people"></i> User Statistics</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#mcqStats"><i class="bi bi-list-task"></i> MCQ Statistics</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#actions"><i class="bi bi-tools"></i> Actions</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#graphSection"><i class="bi bi-graph-up"></i> Analytics</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>

        <!-- Main Content Area -->
        <div class="container-fluid ms-3" id="mainContent">
          <!-- Overview Section -->
          <section id="overview" class="mb-5">
            <h4 class="text-primary">Admin Dashboard Overview</h4>
            <div class="row">
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Total Users</h5>
                    <h3 class="text-success">${totalUsers}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Active Users</h5>
                    <h3 class="text-primary">${activeUsers}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Reported MCQs</h5>
                    <h3 class="text-danger">${totalReportedMcqs}</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- User Statistics Section -->
          <section id="userStats" class="mb-5">
            <h4 class="text-info">User Statistics</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Total Banned Users</h5>
                    <h3 class="text-danger">${bannedUsers}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Suspended Users</h5>
                    <h3 class="text-warning">${suspendedUsers}</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- MCQ Statistics Section -->
          <section id="mcqStats" class="mb-5">
            <h4 class="text-secondary">MCQ Statistics</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Total MCQs Created</h5>
                    <h3 class="text-info">${totalMcqs}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Deleted MCQs</h5>
                    <h3 class="text-danger">${deletedMcqs}</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Actions Section -->
          <section id="actions" class="mb-5">
            <h4 class="text-danger">Admin Actions</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Manage Users</h5>
                    <div class="d-grid">
                      <a href="/admin/manageUsers" class="btn btn-warning">Suspend/Ban Users</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Manage MCQs</h5>
                    <div class="d-grid">
                      <a href="/admin/manageMcqs" class="btn btn-danger">Delete/Resolve MCQs</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Analytics Section -->
          <section id="graphSection" class="mb-5">
            <h4 class="text-success">Admin Analytics</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">User Activity</h5>
                    <canvas id="userActivityChart"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">MCQ Reports</h5>
                    <canvas id="mcqReportsChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script>
        // User Activity Chart
        const ctx1 = document.getElementById('userActivityChart').getContext('2d');
        new Chart(ctx1, {
          type: 'bar',
          data: {
            labels: ['Active', 'Banned', 'Suspended'],
            datasets: [{
              label: 'Users',
              data: [450, 10, 15],
              backgroundColor: ['green', 'red', 'orange']
            }]
          }
        });

        // MCQ Reports Chart
        const ctx2 = document.getElementById('mcqReportsChart').getContext('2d');
        new Chart(ctx2, {
          type: 'doughnut',
          data: {
            labels: ['Resolved', 'Pending'],
            datasets: [{
              label: 'Reports',
              data: [20, 10],
              backgroundColor: ['blue', 'gray']
            }]
          }
        });
      </script>

    </c:if>
    <c:if test="${user.role.toLowerCase().equals('dev')}">
      <div class="d-flex">
        <!-- Fixed Sidebar Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light  flex-column shadow" id="sidebar">
          <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">Developer Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="sidebarMenu">
              <ul class="navbar-nav flex-column">
                <li class="nav-item">
                  <a class="nav-link" href="#overview"><i class="bi bi-speedometer2"></i> Overview</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#websiteStats"><i class="bi bi-bar-chart-line"></i> Website
                    Stats</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#trafficStats"><i class="bi bi-traffic-cone"></i> Traffic</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#roleManagement"><i class="bi bi-person-check"></i> Role
                    Management</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#graphSection"><i class="bi bi-graph-up"></i> Analytics</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>

        <!-- Main Content Area -->
        <div class="container-fluid ms-3" id="mainContent">
          <!-- Overview Section -->
          <section id="overview" class="mb-5">
            <h4 class="text-primary">Developer Dashboard Overview</h4>
            <div class="row">
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Website Uptime</h5>
                    <h3 class="text-success">${websiteUptime}%</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Response Time</h5>
                    <h3 class="text-warning">${responseTime} ms</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Active Roles</h5>
                    <h3 class="text-primary">${activeRoles}</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Website Stats Section -->
          <section id="websiteStats" class="mb-5">
            <h4 class="text-info">Website Performance</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Requests Handled</h5>
                    <h3 class="text-success">${totalRequests}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Errors Encountered</h5>
                    <h3 class="text-danger">${totalErrors}</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Traffic Stats Section -->
          <section id="trafficStats" class="mb-5">
            <h4 class="text-secondary">Website Traffic</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Monthly Visitors</h5>
                    <h3 class="text-info">${monthlyVisitors}</h3>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Bounce Rate</h5>
                    <h3 class="text-warning">${bounceRate}%</h3>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Role Management Section -->
          <section id="roleManagement" class="mb-5">
            <h4 class="text-danger">Role Management</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Manage User Roles</h5>
                    <div class="d-grid">
                      <a href="/dev/manageRoles" class="btn btn-warning">Assign/Modify Roles</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Monitor Site Performance</h5>
                    <div class="d-grid">
                      <a href="/dev/monitorPerformance" class="btn btn-danger">View Logs</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Analytics Section -->
          <section id="graphSection" class="mb-5">
            <h4 class="text-success">Developer Analytics</h4>
            <div class="row">
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Performance Trends</h5>
                    <canvas id="performanceTrendsChart"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card shadow">
                  <div class="card-body">
                    <h5 class="card-title">Traffic Trends</h5>
                    <canvas id="trafficTrendsChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script>
        // Performance Trends Chart
        const ctx1 = document.getElementById('performanceTrendsChart').getContext('2d');
        new Chart(ctx1, {
          type: 'line',
          data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
              label: 'Uptime',
              data: [99.5, 99.8, 99.6, 99.4, 99.7, 99.9],
              borderColor: 'green',
              fill: false
            }]
          }
        });

        // Traffic Trends Chart
        const ctx2 = document.getElementById('trafficTrendsChart').getContext('2d');
        new Chart(ctx2, {
          type: 'bar',
          data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
              label: 'Visitors',
              data: [12000, 13000, 14000, 15000, 16000, 25000],
              backgroundColor: 'blue'
            }]
          }
        });
      </script>

    </c:if>
  </div>