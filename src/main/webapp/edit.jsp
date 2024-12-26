<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="Css/style.css">
<title>Update</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
	</div>
	<%
	int noteId = Integer.parseInt(request.getParameter("note_id").trim());
	
	Session session2 = FactoryProvider.getFactory().openSession();
	Transaction tx = session2.beginTransaction();
	Note note = (Note)session2.get(Note.class,noteId);
	%>
		<form action="UpdateServelet" method="post">
			<input value="<%= note.getId() %>" name="noteId" type="hidden"/>
			<div class="mb-3">
				<label for="title" class="form-label">Title</label>
			  	<input type="text" name="title" class="form-control" 
			  	required="required" placeholder="Enter here" id="title"
			  	value="<%= note.getTitle() %>">
			</div>
			<div class="mb-3">
			    <label for="content" class="form-label">Note Content</label>
			    <textarea class="form-control" name="content" 
			    required="required" placeholder="Enter here" id="content">
			    <%= note.getContent() %></textarea>
			</div>
			<button type="submit" class="btn btn-success">Save</button>
		</form>
	
	<%
	tx.commit();
	session2.close();
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>