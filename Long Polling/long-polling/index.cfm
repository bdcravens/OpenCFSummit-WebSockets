<html>

	<head>
		<script src="jquery-1.7.1.min.js"></script>

		<script>
			$(document).ready(function(){

				//var lastPost = <cfoutput>"#now()#"</cfoutput>;

			   $('#btnSubmit').click(function() {
			   		
			   		
		   			$.ajax({
		   				type: 'POST',
	   					<cfoutput>url: 'http://#cgi.server_name#:8080/cf9/long-polling-server/send.cfm',</cfoutput>
	   					data: {
	   						handle: $('#handle').val(), message: $('#message').val()
	   					},
	   					success: function() {
	   						alert('Message sent!');
	   						//$('#handle').val('');
			   				$('#message').val('');
	   					}
		   			});

			   	});

			   	getMessages = function () {
			   		$.ajax({
		   				type: 'GET',
	   					<cfoutput>url: 'http://#cgi.server_name#:8080/cf9/long-polling-server/get.cfm',</cfoutput>
	   					success: function(data) {
	   						$.each(data,function(index,value){
	   							//alert(value.HANDLE); alert(value.MESSAGE);
	   							$('#chatWindow').prepend('<strong>'+value.HANDLE+' said </strong>' +value.MESSAGE+'<br>');
	   						});
	   						//lastPost = data.DT;
	   						//alert('finished!');
	   						getMessages();
	   					},
	   					error: function(jqXHR, textStatus, errorThrown) {
	   						alert('some error.. prob timeout!');
	   						getMessages();
	   					}
		   			});
		   			
			   	}


			   	//setTimeout('getMessages()',3000);
			   	getMessages();

			 });


		</script>
	</head>


	<body>

		<form>
			Handle: <br><input type="text" name="handle" id="handle"><br>
			Message: <br><textarea cols="80" rows="3" name="message" id="message"></textarea>
			<br><input type="button" value="Send Message" id="btnSubmit">

		</form>


		<hr>

		<div id="chatWindow"></div>

	</body>


</html>