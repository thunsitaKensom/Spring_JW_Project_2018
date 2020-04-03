<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add-Book form</title>
<link rel="stylesheet" href="/css/bootstrap/bootstrap.css">
<script>
	
				
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron mb-0">
		<div class="container">
			<c:if test="${session.username=='admin'}">

				<div class="bg-light px-3 py-3 font-weight-bold">
					<div class="display-4">ADD BOOK</div>
					<hr>
					<form action="/book/create" method="post">
						BookName: <input type="text" class="form-control" name="bookName" required><br>
						<br> Author: <input type="text" class="form-control" name="author" required><br>
						<br> Content: <input type="text" name="content" class="form-control" required><br>
						<br> Type: <select name="subType" required class="form-control">
							<option disabled selected value="">Choose Category</option>
							<optgroup label="Textbooks">
								<option value="BS">Business</option>
								<option value="CS">Computer Science</option>
								<option value="EN">Engineering</option>
								<option value="LAW">Law</option>
								<option value="MATH">Mathematics</option>
							</optgroup>
							<optgroup label="Children Audiobooks">
								<option value="AA">Animal Adventures</option>
								<option value="CC">Children Classics</option>
								<option value="FT">Fairy Tales</option>
								<option value="FS">Folklore Stories</option>
							</optgroup>
							<optgroup label="Classics">
								<option value="DC">Drama Classics</option>
								<option value="FC">Fiction Classics</option>
								<option value="HC">Horror Classics</option>
								<option value="RC">Romance Classics</option>
							</optgroup>
							<optgroup label="Others">
								<option value="other">Other</option>
							</optgroup>
						</select><br> <br> <input class="btn btn-secondary" type="submit"
							value="ADD"><br>
					</form>


					
				</div>
			</c:if>
		</div>

	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>