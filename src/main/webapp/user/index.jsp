<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<link href="/usercrud/webjars/bootstrap/4.5.3/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="#">
<script src="/usercrud/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/usercrud/webjars/bootstrap/4.5.3/js/bootstrap.min.js"></script>

<title>user management</title>
</head>
<body>
	<div style="padding-top: 3%;" class="container">
	
		<h1>User Management</h1>
		
		<div style="padding-top: 3%;" class="container">
			<p> <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#registerModal">Register</button> <p/>
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
								<button data-target="#editModal" 
									onclick="editUser(${u.id}, '${u.name}', '${u.email}', '${u.phone}')" 
									type="submit" class="btn btn-secondary"
									data-toggle="modal" >Edit</button>
									
								<button data-target="#deleteModal"
									onclick="deleteUser(${u.id}, '${u.name}', '${u.email}', '${u.phone}')" 
									type="submit" class="btn btn-dark" 
									data-toggle="modal" >Delete</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="modal fade" id="editModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Edit</h5>
					</div>

					<div class="modal-body">
						<form method="POST" action="/usercrud/user">
							<div class="form-group row" style="align-items: center; justify-content: center;">
	
								
								<div class="col-sm-10">
									<input style="border-bottom: solid 0.1px; padding: 2%;" type="text" name="name" class="form-control-plaintext" />
								</div>
								<div class="col-sm-10">
									<input style="border-bottom: solid 0.1px; padding: 2%;" type="email" name="email" class="form-control-plaintext" />
								</div>
								<div class="col-sm-10">
									<input style="border-bottom: solid 0.1px; padding: 2%;" type="text" name="phone" class="form-control-plaintext" />
								</div>
								<input type="hidden" name="id" readonly="readonly" />
								<input type="hidden" name="action" value="edit" readonly="readonly" />
							</div>

							<div class="modal-footer">
								<button style="margin: 3%" type="submit" class="btn btn-dark">Edit</button>
								<button style="margin: 3%" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="deleteModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Delete</h5>
					</div>

					<div class="modal-body">
						<form method="POST" action="/usercrud/user">
							<div class="form-group row" style="align-items: center; justify-content: center;">
	
								
								<div class="col-sm-10">
									<input style="border-bottom: solid 0.1px; padding: 2%;" type="text" name="name" class="form-control-plaintext" readonly="readonly" />
								</div>
								<div class="col-sm-10">
									<input style="border-bottom: solid 0.1px; padding: 2%;" type="email" name="email" class="form-control-plaintext" readonly="readonly" />
								</div>
								<div class="col-sm-10">
									<input style="border-bottom: solid 0.1px; padding: 2%;" type="text" name="phone" class="form-control-plaintext" readonly="readonly" />
								</div>
								<input type="hidden" name="id" readonly="readonly" />
								<input type="hidden" name="action" value="delete" readonly="readonly" />
							</div>

							<div class="modal-footer">
								<button style="margin: 3%" type="submit" class="btn btn-dark">Delete</button>
								<button style="margin: 3%" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="registerModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<div class="modal-header">
						<h5 class="modal-title">Register</h5>
					</div>

					<div class="modal-body">
						<form method="POST" action="/usercrud/user" autocomplete="off">
							<div class="form-group row"
								style="align-items: center; justify-content: center;">

								<input type="hidden" name="action" value="create">

								<div class="col-sm-10">
									<input placeholder="Name" style="border-bottom: solid 0.1px; padding: 2%;" type="text" name="name" class="form-control-plaintext" autocomplete="off">
								</div>
								<div class="col-sm-10">
									<input placeholder="email@email.com" style="border-bottom: solid 0.1px; padding: 2%;" type="email" name="email" class="form-control-plaintext" autocomplete="off">
								</div>
								<div class="col-sm-10">
									<input placeholder="55 61 9999 9999" style="border-bottom: solid 0.1px; padding: 2%;" type="text" name="phone" class="form-control-plaintext" autocomplete="off">
								</div>
							</div>

							<div class="modal-footer">
								<button style="margin: 3%" type="submit" class="btn btn-dark">Save</button>
								<button style="margin: 3%" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<script>
	function deleteUser(id, name, email, phone) {
		var idEl = document.querySelector("#deleteModal input[name='id']");
		var nameEl = document.querySelector("#deleteModal input[name='name']");
		var emailEl = document.querySelector("#deleteModal input[name='email']");
		var phoneEl = document.querySelector("#deleteModal input[name='phone']");
		
		idEl.value = id;
		nameEl.value = name;
		emailEl.value = email;
		phoneEl.value = phone;
	}
	
	function editUser(id, name, email, phone) {
		var idEl = document.querySelector("#editModal input[name='id']");
		var nameEl = document.querySelector("#editModal input[name='name']");
		var emailEl = document.querySelector("#editModal input[name='email']");
		var phoneEl = document.querySelector("#editModal input[name='phone']");
		
		idEl.value = id;
		nameEl.value = name;
		emailEl.value = email;
		phoneEl.value = phone;
	}
</script>
</body>
</html>