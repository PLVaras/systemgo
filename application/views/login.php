<?php

?>

<html>
	<head>
		<title>Bienvenido a SystemGo</title>
	</head>
	
	<body>
		<?=form_open("index.php/Systemgo/validar");?>
			<label>Usuario</label>
			<input type="text" name="usuario"/><br />
			<label>Clave</label>
			<input type="text" name="clave"/><br />
			<input type="submit" name="btnlogin" value="Ingresar"/>
		</form>
		
	</body>

</html>