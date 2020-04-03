<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome to Free E-Book</title>
<link rel="stylesheet" href="/css/bootstrap/bootstrap.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="carouselExampleSlidesOnly" class="carousel slide bg-dark pb-3"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block mx-auto" style="max-height: 35rem;"
					src="
					<c:if test="${type=='textbooks'||type=='BS'||type=='CS'||type=='EN'||type=='LAW'||type=='MATH'}">/type_textbook.jpg</c:if>
					<c:if test="${type=='childrenAudiobooks'||type=='AA'||type=='CC'||type=='FT'||type=='FS'}">/type_childrenbook.jpg</c:if>
					<c:if test="${type=='classics'||type=='DC'||type=='FC'||type=='HC'||type=='RC'}">/type_classic.jpg</c:if>
					<c:if test="${type=='others'||type=='other'}">/type_other.jpg</c:if>
					<c:if test="${type==null}">/type_alltype.jpg</c:if>
					">
			</div>
		</div>
	</div>

	<div class="container">
		

			<!-- /END THE FEATURETTES -->
			<%
				Integer i = 1;
			%>
			<c:forEach items="${bookList}" var="book">
				<%
					if (i % 4 == 0 || i == 1) {
							out.println("<div class='row'>");
						}
				%>
				<div class="col-sm-4 mt-3 pt-3 pb-3 bg-light">
					<div>
						<div style="float: right">

							<form method="post" action="/savedbook/create">
								<c:if test="${session!=null}">
									<input type="hidden" name="username"
										value="${session.username}">
									<input type="hidden" name="bookId" value="${book.bookId}">
									<%Integer k=0; %>
									<c:forEach items="${sbList}" var="savedbook">
									
										<c:if test="${savedbook.username==session.username}">
											<c:if test="${savedbook.bookId==book.bookId}">
												<button type="submit" class="btn btn-outline-info"
													title="bookmark">
													<i class="fas fa-bookmark"></i>
												</button>
												<%k++;%>
											</c:if>
										</c:if>
									</c:forEach>
										<%if(k==0){%>
										<button type="submit" class="btn btn-outline-info"
											title="bookmark">
											<i class="far fa-bookmark"></i>
										</button>
										<%} %>
								</c:if>

								<c:if test="${session==null}">
									<a class="btn btn-outline-info text-info"
										onclick="alert('Please Login')" title="bookmark"> <i
										class="far fa-bookmark"></i>
									</a>
								</c:if>
							</form>
						</div>
						<div style="margin-left: 25%;">
							<img class="rounded" src="/${book.bookId}.jpg" width="150">
						</div>
					</div>
					<h5 class="mt-3 text-center">
						<a href="/book/${book.bookId}">${book.bookName}</a>
					</h5>
					<p class="text-center">${book.author}<a> | </a>${book.bookType}</p>
					<p class="text-center">[uploaded: ${book.postDate}]</p>
					<hr class="hr-4">
					<button type="button" class="btn btn-outline-secondary"
						style="margin-left: 30%" data-toggle="collapse"
						data-target="#demo${book.bookId}">View details</button>
					<div id="demo${book.bookId}" class="collapse">
						<p>${book.content}</p>
					</div>
					<br>
					<div class="mt-3" style="margin-left: 27%">
						<c:if test="${session.username=='admin'}">
							<a href="/book/editform/${book.bookId}"
								class="btn btn-outline-info">edit</a>
							<a
								onclick="return confirm('Are you sure you want to delete ${book.bookName}')"
								href="/book/delete/${book.bookId}"
								class="btn btn-outline-danger">delete</a>
						</c:if>
					</div>

				</div>
				<%
					i += 4;
				%>
			</c:forEach>
		</div>
	</div>
	</div>
	<hr class="hr-4 ">
	<jsp:include page="footer.jsp" />
</body>
</html>