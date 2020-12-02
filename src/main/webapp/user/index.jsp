<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<link href="/usercrud/webjars/bootstrap/4.5.3/css/bootstrap.min.css"
	rel="stylesheet">

<script src="/usercrud/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/usercrud/webjars/bootstrap/4.5.3/js/bootstrap.min.js"></script>

<title>user management</title>
</head>
<body>
	<div style="padding-top: 3%;" class="container">
		<h1>User Management</h1>


		<button type="button" class="btn btn-dark" data-toggle="modal"
			data-target="#modalregister">Register</button>


		<c:if test="${!empty msg}">
			<p>${msg}</p>
		</c:if>

		<div style="padding-top: 3%;" class="container">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Phone</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${users}">
						<tr>
							<td>${u.id}</td>
							<td>${u.name}</td>
							<td>${u.email}</td>
							<td>${u.phone}</td>
							<td> 
								<button type="button" class="btn btn-secondary">Edit</button>
								<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#deletemodal" >Delete</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		
		<div class="modal fade" id="deletemodal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="deletemodal">Delete</h5>
					</div>

					<div class="modal-body">
					<p>Delete</p>
					</div>
					
					<div class="modal-footer">
						<button style="margin: 3%" type="submit" class="btn btn-dark">Save</button>
						<button style="margin: 3%" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<div class="modal fade" id="modalregister" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Register</h5>
					</div>

					<div class="modal-body">

						<form method="POST" action="/usercrud/user?action=create"
							autocomplete="off">
							<div class="form-group row"
								style="align-items: center; justify-content: center;">

								<input type="hidden" name="action" value="create">

								<div class="col-sm-10">
									<input placeholder="Name"
										style="border-bottom: solid 0.1px; padding: 2%;" type="text"
										name="name" class="form-control-plaintext" autocomplete="off">
								</div>
								<div class="col-sm-10">
									<input placeholder="email@email.com"
										style="border-bottom: solid 0.1px; padding: 2%;" type="email"
										name="email" class="form-control-plaintext" autocomplete="off">
								</div>
								<div class="col-sm-10">
									<input placeholder="55 61 9999 9999"
										style="border-bottom: solid 0.1px; padding: 2%;" type="text"
										name="phone" class="form-control-plaintext" autocomplete="off">
								</div>
							</div>

							<div class="modal-footer">
								<button style="margin: 3%" type="submit" class="btn btn-dark">Save</button>
								<button style="margin: 3%" type="button"
									class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>