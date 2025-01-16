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
          <a class="nav-link navbar-brand" href="#tab1Id" data-bs-toggle="tab"
            >MCQ Master</a
          >
        </li>
        <li class="nav-item">
          <a href="#tab2Id" class="nav-link active" data-bs-toggle="tab"
            >Home</a
          >
        </li>
        <li class="nav-item">
          <a href="#tab3Id" class="nav-link" data-bs-toggle="tab">MCQ</a>
        </li>
        <li class="nav-item">
          <a href="#tab4Id" class="nav-link" data-bs-toggle="tab">Users</a>
        </li>
        <li class="nav-item">
          <a href="#tab5Id" class="nav-link" data-bs-toggle="tab">Dashboard</a>
        </li>
        <li class="nav-item">
          <a
            href="#tab6Id"
            class="nav-link"
            data-bs-toggle="tab"
            id="navBartest"
            >Test</a
          >
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
        <button
          class="btn btn-outline-warning my-2 my-sm-0 ms-3"
          type="button"
          id="navLoginButton"
          onclick="navLoginButtonClick()"
        >
          Log in
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
    themeButton.innerHTML = themeButton.innerHTML == "Light" ? "dark" : "Light";
    localStorage.setItem("theme", themeButton.innerHTML);
  }
  document.addEventListener("DOMContentLoaded", () => {
    if (localStorage.getItem("id")) {
    document.getElementById("navLoginButton").innerText =
      localStorage.getItem("name");
  } else if (sessionStorage.getItem("id")) {
    document.getElementById("navLoginButton").innerText =
      sessionStorage.getItem("name") + "*";
  }
  });
  function navLoginButtonClick() {
    if (localStorage.getItem("id")) {
      localStorage.clear();
      sessionStorage.clear();
      window.location = "/";
    } else if (sessionStorage.getItem("id")) {
      localStorage.clear();
      window.location = "/";
      sessionStorage.clear();
    } else {
      window.location = "/user/login";
    }
  }
</script>
