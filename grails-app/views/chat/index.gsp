<html>
  <head>
    <title>Chat - jlmonteagudo</title>
    <meta name="layout" content="main" />
	<atmosphere:resources/> 
	<script type="text/javascript">
		$(function(){
 
			function callback(response) {
				if (response.status == 200) {
					var data = response.responseBody;
					if (data.length > 0) {
						var mensajeData = $.parseJSON(data);
						var chatValue = $('#chat').html();
 
						chatValue += "<span class='chatUser'>" + mensajeData.usuario + " dice:</span> " + mensajeData.mensaje + "<br/>";
						$('#chat').html(chatValue);
						$("#chat").attr({ scrollTop: $("#chat").attr("scrollHeight") });
					}
				}
            }
						
			$.atmosphere.subscribe('${resource(dir: '/atmosphere/chat')}',			
				callback,
				$.atmosphere.request = {transport: 'streaming'});
 
			$('#buttonPost').click(function() {
				var data = '{"usuario":"' + $('#usuario').val() + '", "mensaje":"' + $('#mensaje').val() + '"}';
				$.get('${createLink(action: "broadcast")}?data=' + data);
				$("#mensaje").val('');
				$("#mensaje").focus();
			});
 
		});
	</script>
  </head>
 
  <body>
 
  	<div id="pageBody">
 
		<div class="contenedor">
 
		  	<h3>Sala de Chat - Grails y Ajax Push</h3>
 
			<div id="chat">
			</div>
 
			<div id="chatForm">
 
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td><label>Usuario:</label></td>
						<td><input type="text" id="usuario" name="usuario" value="" size="10"/></td>
					</tr>
					<tr>
						<td><label>Mensaje:</label></td>
						<td>
							<input type="text" id="mensaje" name="mensaje" value="" size="40"/>
							<input type="submit" id="buttonPost" name="buttonPost" value="Enviar"/>
						</td>
					</tr>
				</table>
			</div>
 
		</div>
 
		<div id="chatWarning">
			(*) Para probar el funcionamiento de la aplicación se recomienda abrir distintos navegadores y enviar mensajes desde cada uno de ellos.
		</div>
 
	</div>
 
  </body>
 
</html>