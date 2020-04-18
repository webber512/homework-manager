<%@ include file="/WEB-INF/layouts/navbar.jsp"%>
<div id="demo-main-div" class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<%@ include file="/WEB-INF/layouts/message.jsp"%>
			${message}
			<div class="row align-items-center">
				<div class="col-lg-10 col-md-8 col-sm-6">
					<h1>Buildings</h1>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6">
					<div class="input-group align-right">
						<input type="text" class="form-control" id="searchBox"
							onkeyup="search()" placeholder="Search for a building"></input>&nbsp;
						<button type="button" class="btn btn-danger"
							onclick="clearInput()">Clear</button>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-striped" id="buildings">
					<thead>
						<tr>
							<th>Actions</th>
							<th>ID</th>
							<th>Name</th>
							<th class="d-none d-sm-block">Address</th>
							<th>Style</th>
							<th># of Floors</th>
							<th># of Rooms</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty buildingList }">
							<tr>
								<td colspan="7">No data found</td>
							</tr>
						</c:if>
						<c:if test="${not empty buildingList }">
							<c:forEach var="building" items="${buildingList}">
								<tr>
									<td><a href="/building/edit/${building.id}"><i
											class="fas fa-pencil-alt"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="/building/delete/${building.id}"><i
											class="fas fa-trash-alt"></i></a></td>
									<td><a href="/building/edit/${building.id}"><c:out
												value="${building.id}" /></a></td>
									<td><a href="/building/edit/${building.id}"><c:out
												value="${building.name}" /></a></td>
									<td class="d-none d-sm-block"><c:out
											value="${building.address}" /></td>
									<td><c:out value="${building.style}" /></td>
									<td><c:out value="${building.floors}" /></td>
									<td><c:out value="${building.rooms}" /></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>

<script>
	function search() {
		let input = document.getElementById("searchBox");
		let query = input.value.toUpperCase();
		table = document.getElementById("buildings");
		tr = document.getElementsByTagName("tr");

		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				let txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(query) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	function clearInput() {
		document.getElementById("searchBox").value = "";
		search();
	}
</script>

<%@ include file="/WEB-INF/layouts/footer.jsp"%>