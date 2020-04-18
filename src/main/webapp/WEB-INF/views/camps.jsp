<div id="container-fluid">
	<%@ include file="/WEB-INF/layouts/navbar.jsp"%>
	<br />
	<div class="row container-fluid">
		<div class="col-sm-12">
			<h1>View All Camps</h1>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true">Calendar View</a> <a
						class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
						href="#nav-profile" role="tab" aria-controls="nav-profile"
						aria-selected="false">List View</a>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>