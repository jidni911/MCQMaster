<div style="background-image: url(/userbg.png);
 background-repeat: no-repeat;
background-size: cover;
background-position: top center;
">

              <div class="table-responsive text-center container">
                <table class="table table-striped table-hover table-border table-primary align-middle">
                  <thead class="table-light">

                    <div class="text-danger text-center h1">Users</div>
                    <tr>
                      <c:if test="${user.getRole() == 'admin'}">
                        <th>ID</th>
                      </c:if>
                      <th>Name</th>
                      <th>email</th>
                      <c:if test="${user.getRole() == 'admin'}">
                        <th>Password</th>
                      </c:if>
                      <th>DoB</th>
                      <th>Role</th>
                      <th>Image</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody class="table-group-divider">
                    <c:forEach var="user" items="${users}">
                      <tr class="moye">
                        <c:if test="${user.getRole() == 'admin'}">
                          <td>${user.getId()}}</td>
                        </c:if>
                        <td>${ user.name }</td>
                        <td>${ user.email }</td>
                        <c:if test="${user.getRole() == 'admin'}">
                          <td>${user.getPassword()}</td>
                        </c:if>
                        <td>${ user.dob }</td>
                        <td>${ user.role }</td>
                        <td><c:if test="${not empty user.profilePicture.data}">
                          <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(user.profilePicture.data)}" alt="Image" height="50"/>
                      </c:if>
                      <c:if test="${empty user.profilePicture.data}">
                          <p>No image data available.</p>
                      </c:if></td>
                        <td>
                          <a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button"
                            (click)="viewUser(user)">View</a>
                          <a (click)="viewUser(user)" class="btn btn-outline-warning" data-bs-toggle="modal"
                            href="#exampleModalToggle2" role="button" *ngIf="isAdmin()">Edit</a>
                          <a (click)="deleteUser(user.id)" class="btn btn-danger" *ngIf="isAdmin()">Delete</a>
                        </td>
                      </tr>
                    </c:forEach>

                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="7" class="text-center">
                        <c:if test="user.role==admin">
                          <button *ngIf="isAdmin()" type="button" class="btn btn-outline-primary btn-lg"
                            data-bs-toggle="modal" data-bs-target="#addUserModal">
                            Add User
                          </button>
                        </c:if>

                      </td>
                    </tr>
                  </tfoot>
                </table>
              </div>


              <app-user-info [selectingUser]="selecterUser" (notifyParent)="ngOnInit()"></app-user-info>
              <app-user-create (notifyParent)="ngOnInit()"></app-user-create>
            </div>