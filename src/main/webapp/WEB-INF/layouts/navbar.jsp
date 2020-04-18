<html lang="en">
<%@ include file="/WEB-INF/layouts/head.jsp"%>
<body>

	<div class="container-responsive">
		<nav class="bg-primary navbar navbar-expand-lg navbar-dark">
			<a class="navbar-brand" href="/">Homework Manager</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="/">Home
							<span class="sr-only">(current)</span>
					</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Classes </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/classes">View All Classes</a> <a
								class="dropdown-item" href="/class/new">New Class</a>
						</div></li>

					<li class="nav-item"><a class="nav-link" href="/">Assignments</a></li>

				</ul>
				<div class="my-2 my-lg-0">
					<a class="nav-link text-white" href="#">Login</a>
				</div>
				<div class="my-2 my-lg-0">
					<a class="nav-link text-white" href="#">Register</a>
				</div>
			</div>
		</nav>
	</div>