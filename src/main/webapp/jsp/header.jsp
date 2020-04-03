<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
<link rel="icon" href="/favicon.ico">
<link rel="shortcut icon" href="/favicon.ico">
<link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-dark bg-dark navbar-fixed-top"
		style="position: fixed; width: 100%; z-index: 10;">
		<a class="navbar-brand" href="/books"><i
			class="fab fa-lg fa-fort-awesome"></i> Free E-Book</a>
		<ul class="nav justify-content-center">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle btn btn-outline-light" href="#"
				id="navbarDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Category </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<!-- Split dropright button -->
					<div class="btn-group dropright">
						<a class="dropdown-item" href="/books/textbooks">textbooks</a>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="sr-only">Toggle Dropright</span>
						</button>
						<div class="dropdown-submenu">
							<a class="dropdown-item"  href="/books/BS">Business</a> <a
								class="dropdown-item" href="/books/CS">Computer Science</a> <a
								class="dropdown-item" href="/books/EN">Engineering</a> <a
								class="dropdown-item" href="/books/LAW">Law</a> <a
								class="dropdown-item" href="/books/MATH">Mathematics</a>
						</div>
					</div>
					<hr>
					<div class="btn-group dropright">
						<a class="dropdown-item" href="/books/childrenAudiobooks">Children<br>Audiobooks</a>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="sr-only">Toggle Dropright</span>
						</button>
						<div class="dropdown-submenu">
							<a class="dropdown-item"  href="/books/AA">Animal Adventures</a> <a
								class="dropdown-item" href="/books/CC">Children Classics</a> <a
								class="dropdown-item" href="/books/FF">Fairy Tales</a> <a
								class="dropdown-item" href="/books/FS">Folklore Stories</a> 
						</div>
					</div>
					<hr>
					<div class="btn-group dropright">
						<a class="dropdown-item" href="/books/classics">Classics</a>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="sr-only">Toggle Dropright</span>
						</button>
						<div class="dropdown-submenu">
							<a class="dropdown-item"  href="/books/DC">Drama Classics</a> <a
								class="dropdown-item" href="/books/FC">Fiction Classics</a> <a
								class="dropdown-item" href="/books/HC">Horror Classics</a> <a
								class="dropdown-item" href="/books/RC">Romance Classics</a> 
						</div>
					</div>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/books/others">Others</a>
				</div></li>
		</ul>
		<ul class="nav ml-auto">
			<c:if test="${session==null}">
				<li class="nav-item"><a
					class="nav-link btn btn-info text-light" data-toggle="modal"
					data-target="#signup"><i class="fas fa-user-plus"></i> Sign-up</a></li>
				<li class="nav-item mx-3"><a
					class="nav-link btn btn-success text-light" data-toggle="modal"
					data-target="#login"><i class="fas fa-sign-in-alt"></i> Login</a></li>
			</c:if>
			<c:if test="${session!=null}">
				<div class="nav-link text-warning">
					<a href="/user/profile/${session.username}" class="text-white"><i
						class="fas fa-user"></i> | ${session.username}</a>
				</div>

				<li class="nav-item mx-3"><a class="nav-link btn btn-danger"
					href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
			</c:if>
		</ul>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" style="float: right"
			id="navbarSupportedContent">
			<ul class="navbar-nav">
				<c:if test="${session.username=='admin'}">
					<li class="nav-item"><a class="nav-link" href="/create">ADD</a></li>
				</c:if>

			</ul>
			<form class="form-inline my-2 my-lg-0" action="/search">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="key">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

	</nav>
	<!--  Login Modal -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-uppercase text-center"
						id="exampleModalLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/user/login" method="post">
					<div class="modal-body">


						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Username</label>
							<input type="text" class="form-control" required name="username">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Password</label>
							<input type="password" required class="form-control"
								name="password">
						</div>


					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--  Sign-up Modal -->
	<div class="modal fade" id="signup" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center text-uppercase"
						id="exampleModalLabel">Sign-up</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/user/create" method="post">
					<div class="modal-body">


						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Username</label>
							<input type="text" class="form-control" name="username" required>
							<span class="text-danger"><c:out value="${wrong}"
									default="" /></span>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Password</label>
							<input type="password" class="form-control" name="password"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
								title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
								required> <small id="passwordHelpInline"
								class="text-muted"> Must contain at least one number and
								one uppercase and lowercase letter, and at least 8 or more
								characters </small>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">First
								name</label> <input required type="text" class="form-control"
								name="firstName">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Last
								name</label> <input required type="text" class="form-control"
								name="LastName">
						</div>

					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-info">
							<i class="fas fa-user-plus"></i> Sign-up
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:if test="${wrong!=null}">
		<script>
			$(window).on('load', function() {
				$('#signup').modal('show');
			});
		</script>
	</c:if>
</body>
</html>