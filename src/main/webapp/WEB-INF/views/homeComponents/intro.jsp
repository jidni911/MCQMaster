
<p id="asdfgh"></p>
<br />

<c:if test="${user != null && rememberMe=='rememberMe' }">
    <script>
      localStorage.setItem("id","${user.id}")
      localStorage.setItem("email","${user.email}")
      localStorage.setItem("name","${user.name}")
      localStorage.setItem("password","${user.password}")
      window.location.href = "/"
    </script>
</c:if>
<c:if test="${user != null && rememberMe=='no' }">
    <script>
      sessionStorage.setItem("id","${user.id}")
      sessionStorage.setItem("email","${user.email}")
      sessionStorage.setItem("name","${user.name}")
      sessionStorage.setItem("password","${user.password}")
      window.location.href = "/"
    </script>
</c:if>
<script>
  if(localStorage.getItem("id")){
    document.getElementById("asdfgh").innerText += localStorage.getItem("email")
  } else if(sessionStorage.getItem("id")){
    document.getElementById("asdfgh").innerText += sessionStorage.getItem("email")
  }
</script>