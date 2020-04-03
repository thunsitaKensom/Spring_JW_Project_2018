<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="jumbotron bg-secondary text-white"
		style="min-height: 35rem">
		<h5 class="display-4">Information</h5>
		<hr>
		<c:if test="${session.username!=nul}">
		<div class="container">
			<div class="media mt-5">
				<img src="/user_img.png" alt="Generic placeholder image" height="250"
					class="mb-5 rounded">
				<div class="bg-dark rounded ml-5 mt-4" style="height:12rem; width:36rem;">
					<div style="margin-left: 15%; margin-top: 3%; font-size: 1.5em">
						<p>Username: ${user.username}</p>
						<p>First Name: ${user.firstName}</p>
						<p>Last Name: ${user.lastName}</p>
					</div>
				</div>
			</div>
		</div>
		</c:if>
	</div>
	<c:if test="${session.username!=nul}">
	<div class="container bg-light">
		<h1>Saved Book List</h1>

		<hr>
		<h5 class="mt-3 text-center"></h5>
		<c:forEach items="${bookList}" var="book">
			<c:forEach items="${sbList}" var="savedbook">
				<c:if test="${savedbook.bookId==book.bookId}">
					<div class="container">
						<div class="media mt-3">
							<img class="rounded" src="/${book.bookId}.jpg" width="150">
							<div class="media-body" style="margin-left: 5%;">
							<form method="post" action="/savedbook/delete">
								<input type="hidden" name="bookId" value="${book.bookId}">
								<input type="hidden" name="username" value="${user.username}">
								<button type="submit" class="btn btn-outline-info"
									title="bookmark">
									<i class="fas fa-bookmark"></i>
								</button>
								</form>
								
								<h5 class="mt-3">
									<a href="/book/${savedbook.bookId}">${book.bookName}</a>
								</h5>
								<p>${book.author}<a> | </a>${book.bookType}</p>
								<p>[uploaded: ${book.postDate}]</p>
								<hr class="hr-4">

								<button type="button" class="btn btn-outline-secondary"
									style="margin-left: 20%" data-toggle="collapse"
									data-target="#demo${book.bookId}">View details</button>
								<div id="demo${book.bookId}" class="collapse">
									<p>${book.content}</p>
								</div>
								<br><br>
							</div>
						</div>
						<h5 class="mt-3 "></h5>
					</div>
					<hr>
					
				</c:if>
			</c:forEach>
		</c:forEach>
			
	</div>
	</c:if>

	<jsp:include page="footer.jsp" />
</body>
</html>