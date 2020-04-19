<%@ include file="/WEB-INF/layouts/include.jsp"%>
<br />
<div class="table-responsive">
	<table class="table" id="currentAssignmentTable">
		<thead>
			<tr>
				<th>Name</th>
				<th>Class</th>
				<th>Type</th>
				<th>Due Date</th>
				<th>Description</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="assignment" items="${openAssignmentList}">
				<tr>
					<td><span
						style="width: 15px; height: 15px; margin: auto; display: inline-block; border: 1px solid gray; vertical-align: middle; border-radius: 2px; background:${assignment.classColor}"></span>&nbsp;&nbsp;${assignment.name}</td>
					<td>${assignment.className}</td>
					<td>${assignment.type}</td>
					<td>${assignment.dueDate}</td>
					<td>${assignment.description}</td>
					<td><a href="/assignment/done/${assignment.id}"><i
							class="far fa-square"></i>&nbsp;Complete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
	$(document).ready(function() {
		$('#currentAssignmentTable').DataTable({
			"order" : [ [ 3, "asc" ] ]
		});
	});
</script>