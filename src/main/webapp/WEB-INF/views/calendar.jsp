<%@ include file="/WEB-INF/layouts/include.jsp"%>
<br />
<div id='calendar'></div>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			events : {
				url : '/api/assignments/all',
				method : 'GET',
				textColor : 'white' // a non-ajax option
			},
			plugins : [ 'dayGrid', 'bootstrap' ],
			themeSystem : 'bootstrap',
			height : 'parent'
		});

		calendar.render();
	});
</script>

<style>
.fc-today {
	background-color: #e5e5e5;
}
</style>