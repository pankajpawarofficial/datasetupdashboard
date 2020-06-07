$(document).ready(function(){
	var releaseName=$("#quarter").val();
	var arrayOfObjects;

	$.ajax({
		type: "POST",
		contentType : "application/json",
		dataType : 'json',
		url: "chartData",
		data: JSON.stringify(releaseName),
		success: function(response){
			arrayOfObjects=response;	
			generateCharts();
		},
		error: function(e){
			alert('Error: ' + e);
		}
	});

	function generateCharts(){
		var chart1 = c3.generate({
			bindto:'#SITChart',
			data: {
				columns: [
					['Done', arrayOfObjects[0]],
					['Work in Progress', arrayOfObjects[1]],
					],
					type : 'donut',
					colors: {
						data1: 'rgb(0, 149, 217)',
						data2: 'rgb(255, 175, 0)'
					}        
			},
			donut: {
				title: "SIT Status",
				label: {
					format: function (value) { return value; }
				}
			}
		});

		var chart2 = c3.generate({
			bindto: '#QAChart',
			data: {
				columns: [
					['Done', arrayOfObjects[2]],
					['Work in Progress', arrayOfObjects[3]]
					],
					type : 'donut',
					colors: {
						data1: 'rgb(0, 149, 217)',
						data2: 'rgb(255, 175, 0)'
					}
			},
			donut: {
				title: "QA Status",
				label: {
					format: function (value) { return value; }
				}
			}
		});

		var chart3 = c3.generate({
			bindto: '#BUChart',
			data: {
				columns: [
					['Done', arrayOfObjects[4]],
					['Work in Progress', arrayOfObjects[5]]
					],
					type : 'donut',
					colors: {
						data1: 'rgb(0, 149, 217)',
						data2: 'rgb(255, 175, 0)'
					}
			},
			donut: {
				title: "BAT/UAT Status",
				label: {
					format: function (value) { return value; }
				}
			}
		});
	}

})