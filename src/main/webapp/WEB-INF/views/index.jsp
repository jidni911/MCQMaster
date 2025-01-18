<%@ page import="java.util.Base64" %> <%@ page contentType="text/html" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>MCQ Master</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="stylesheet" href="/style/style.css" />
    <link rel="icon" href="icon.png" type="image/png" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
  </head>

  <body data-bs-theme="light">
    <header class="sticky-top">
      <!-- Nav tabs -->
      <%@ include file="homeComponents/nav.jsp" %>
    </header>
    <main>
      <!-- Tab panes -->
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="tab1Id" role="tabpanel">
          <%@ include file="homeComponents/intro.jsp" %>
        </div>
        <div class="tab-pane fade show active" id="tab2Id" role="tabpanel">
          <%@ include file="homeComponents/home.jsp" %>
        </div>
        <div class="tab-pane fade" id="tab3Id" role="tabpanel">
          <%@ include file="homeComponents/mcq.jsp" %>
        </div>
        <div class="tab-pane fade" id="tab4Id" role="tabpanel">
          <%@ include file="homeComponents/user.jsp" %>
        </div>
        <div class="tab-pane fade" id="tab5Id" role="tabpanel">
          <%@ include file="homeComponents/dashboard.jsp" %>
        </div>

        <div class="tab-pane fade" id="tab6Id" role="tabpanel">
          <%@ include file="homeComponents/test.jsp" %>
        </div>
      </div>
    </main>
    <footer>
      <!-- place footer here -->
    </footer>

    <!-- Bootstrap JavaScript Libraries -->
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
      crossorigin="anonymous"
    ></script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
      integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
