<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Book Detail</title>
<link rel="stylesheet" href="/css/bootstrap/bootstrap.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron mb-0">
		<div class="container">
				
					<div class="bg-light px-3 py-3 font-weight-bold">
						<div class="display-4">Download</div>
						<hr>
						<img style="display: block" class="rounded mx-auto mb-3"
							src="/${book.bookId}.jpg" width="25%">
							<div style="line-height:2">
						<div>Book Name: ${book.bookName}</div>
						<div>Category: ${book.bookType}</div>
						<div>Author: ${book.author}</div>
						
						<br>
						<div>Details: ${book.content}</div>
						</div>
						<br>
						<form action="/file/${book.bookId}.pdf" target="_blank">
							<button class="btn btn-success" type="submit" value="Download" ><i class="fas fa-download"></i>Download</button>
						</form>
					
				</div>
		</div>

	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>