
<div id="container-fluid">
	<%@ include file="/WEB-INF/layouts/navbar.jsp"%>
	<div class="row container-fluid">
		<div class="col-sm-2">
			<br />
			<h3>All Classes</h3>
			<nav class="navbar bg-light">
				<ul class="navbar-nav">
					<c:forEach var="classs" items="${classList}">
						<li class="nav-item"><a class="nav-link"
							href="/classes?action=view&id=${classs.id}">${classs.name}</a></li>
					</c:forEach>

				</ul>
			</nav>
			<br>
		</div>
		<div class="col-sm-10">
			<br />
			<h3>Manage ${className}</h3>
			<c:choose>
				<c:when test="${action == 'new'}">
					<%@ include file="/WEB-INF/views/newclass.jsp"%>
				</c:when>
				<c:otherwise>

					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab"
								data-toggle="tab" href="#nav-current" role="tab"
								aria-controls="nav-home" aria-selected="true">View
								Assignments</a> <a class="nav-item nav-link" id="nav-profile-tab"
								data-toggle="tab" href="#nav-newclass" role="tab"
								aria-controls="nav-profile" aria-selected="false">Edit Class</a>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-current"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<div class="row">
								<div class="col-sm-12">
									<%@ include file="/WEB-INF/views/allassignments.jsp"%>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="nav-newclass" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<div class="row">
								<div class="col-sm-12">
									<%@ include file="/WEB-INF/views/newclass.jsp"%></div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/layouts/footer.jsp"%>


<script>
window.addEventListener("DOMContentLoaded", (event) => {
			let submitBtn = document.getElementById("submitForm")
			submitBtn.addEventListener("click", (event) => {
				event.preventDefault();
				let form = document.getElementById("newClassForm"); 
				form.submit();
			});
		});
	</script>