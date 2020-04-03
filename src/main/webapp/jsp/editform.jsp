<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Edit</title>
<script>
$(document).ready(
		function() {
			$(document).on(
					'change',
					'.btn-file :file',
					function() {
						var input = $(this), label = input.val().replace(
								/\\/g, '/').replace(/.*\//, '');
						input.trigger('fileselect', [ label ]);
					});

			$('.btn-file :file').on(
					'fileselect',
					function(event, label) {

						var input = $(this).parents('.input-group').find(
								':text'), log = label;

						if (input.length) {
							input.val(log);
						} else {
							if (log)
								alert(log);
						}

					});
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result).width(350)

					};

					reader.readAsDataURL(input.files[0]);
				}
			}
}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron mb-0">
		<div class="container">
			<c:if test="${session!=null}">
				<div class="display-4">Edit</div>
				<hr>
				<h5>Image Upload</h5>
				<img style="display: block" id="blah" class="rounded mx-auto"
					src="/${book.bookId}.jpg" width="20%" alt=" No Image">
					<img id="blah" src="#" alt="">

				<form action="/uploadImage" method="post"
					enctype="multipart/form-data" id="upload-image">
					<div class="input-group mt-3">
						<input type="file" onchange="readURL(this);" class="form-control" name="file">
						<input type="hidden" value="${book.bookId }" name="name">
						<div class="input-group-append">
							<span class="input-group-text" style="padding: 0px 0px"><a
								href="#" class="btn btn-outline-primary" id="upload"
								onclick="document.getElementById('upload-image').submit();">
									Upload </a></span>
						</div>
					</div>
				</form>
				<hr>
				<h5>PDF Upload</h5>
				<form action="/uploadBook" method="post"
					enctype="multipart/form-data" id="upload-book">
					<div class="input-group mt-3">
						<input type="file" id="imgInp" class="form-control" name="file">
						<input type="hidden" value="${book.bookId}" name="name">
						<div class="input-group-append">
							<span class="input-group-text" style="padding: 0px 0px"><a
								href="#" class="btn btn-outline-primary" id="upload"
								onclick="document.getElementById('upload-book').submit();">
									Upload </a></span>
						</div>
					</div>
				</form>


				<br>

				<form action="/book/edit" method="post">
					<input type="hidden" name="bookId" value="${book.bookId}">
					Book Name: <input type="text" name="bookName"
						value="${book.bookName}" required class="form-control"><br>
					Author: <input class="form-control" type="text" name="author"
						value="${book.author}" required> <br> Book Type: <select
						name=subType required class="form-control">

						<optgroup label="Textbooks">
							<option value="BS"
								<c:if test="${book.subType=='BS'}">selected</c:if>>Business</option>
							<option value="CS"
								<c:if test="${book.subType=='CS'}">selected</c:if>>Computer
								Science</option>
							<option value="EN"
								<c:if test="${book.subType=='EN'}">selected</c:if>>Engineering</option>
							<option value="LAW"
								<c:if test="${book.subType=='LAW'}">selected</c:if>>Law</option>
							<option value="MATH"
								<c:if test="${book.subType=='MATH'}">selected</c:if>>Mathematics</option>
						</optgroup>
						<optgroup label="Children Audiobooks">
							<option value="AA"
								<c:if test="${book.subType=='AA'}">selected</c:if>>Animal
								Adventures</option>
							<option value="CC"
								<c:if test="${book.subType=='CC'}">selected</c:if>>Children
								Classics</option>
							<option value="FT"
								<c:if test="${book.subType=='FT'}">selected</c:if>>Fairy
								Tales</option>
							<option value="FS"
								<c:if test="${book.subType=='FS'}">selected</c:if>>Folklore
								Stories</option>
						</optgroup>
						<optgroup label="Classics">
							<option value="DC"
								<c:if test="${book.subType=='DC'}">selected</c:if>>Drama
								Classics</option>
							<option value="FC"
								<c:if test="${book.subType=='FC'}">selected</c:if>>Fiction
								Classics</option>
							<option value="HC"
								<c:if test="${book.subType=='HC'}">selected</c:if>>Horror
								Classics</option>
							<option value="RC"
								<c:if test="${book.subType=='RC'}">selected</c:if>>Romance
								Classics</option>
						</optgroup>
						<optgroup label="Others">
							<option value="other"
								<c:if test="${book.subType=='other'}">selected</c:if>>Other</option>
						</optgroup>

					</select><br> Details:
					<textarea rows="3" name="content" required class="form-control">${book.content} </textarea>
					<br> <input type="submit" class="btn btn-secondary"
						value="edit">
				</form>
			</c:if>
		</div>

	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>