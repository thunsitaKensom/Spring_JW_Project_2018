<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="refresh" content="3;url=/book/editform/${path}" />
<title>Upload Status</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron jumbotron-fluid">
		<div class="container" style="margin-top: 10%">
			<h1 class="display-4" style="color: ${color}">${UploadStatus}</h1>
			<p class="lead">Redirecting to Edit movie:mid ${path} page in 3 seconds... </p>
			<div class="center"> or click <a href="/book/editform/${path}" class="btn btn-lg btn-warning">Redirect</a></div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>