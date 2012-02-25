<html>

	<head>

		<script>
		// Set URL of your WebSocketMain.swf here:
	    WEB_SOCKET_SWF_LOCATION = "./WebSocketMain.swf";
	    // Set this to dump debug message from Flash to console.log:
	    WEB_SOCKET_DEBUG = false;

		</script>

		<script src="jquery-1.7.1.min.js"></script>
		<script src="swfobject.js"></script>
		<script src="web_socket.js"></script>
		


		<script>
			// add window.JSON.stringify to jQuery
			jQuery.extend({stringify:function(a){var c=typeof a;if(c!="object"||a===null)return c=="string"&&(a='"'+a+'"'),String(a);else{var d,b,f=[],e=a&&a.constructor==Array;for(d in a)b=a[d],c=typeof b,a.hasOwnProperty(d)&&(c=="string"?b='"'+b+'"':c=="object"&&b!==null&&(b=jQuery.stringify(b)),f.push((e?"":'"'+d+'":')+String(b)));return(e?"[":"{")+String(f)+(e?"]":"}")}}});


			$(document).ready(function(){


				var ws;
			    ws = new WebSocket("ws://<cfoutput>#cgi.server_name#</cfoutput>:1225");
			   
		    	ws.send("test");
			    
			     // Set event handlers.
			      ws.onopen = function() {
			        //output("onopen");
			        alert('opened WS');
			        //ws.send("hello world!");
			        //ws.send('test');
			        //console.log("opened connection");
			      };
			      ws.onmessage = function(e) {
			        // e.data contains received string.
			        
			        
			        /*obj=$.parseJSON(e.data);
			        var tbl = prettyPrint( obj );
					document.body.insertBefore( tbl, document.body.firstChild );
					*/
					results = $.parseJSON(e.data);
					$('#chatWindow').prepend('<div><em>' + results.handle + ' said</em> '+results.message+'</div>');


			      };
			      ws.onclose = function() {
			        //output("onclose");
			      };
			      ws.onerror = function() {
			        //output("onerror");
			        alert('error occurred!');
			      };


				//var lastPost = <cfoutput>"#now()#"</cfoutput>;

			   $('#btnSubmit').click(function() {
			   		msgData = {handle:$('#handle').val(),message:$('#message').val()};
		   			ws.send($.stringify(msgData));
		   			//$('#message').val('');

			   	});

			   	

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