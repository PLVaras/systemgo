<?php

?>

BIENVENIDO ALA BANDEJA

LISTA DE USUARIOS
<?php foreach ($usuarios->result() as $usuario):  ?>

<p> <?=$usuario->nombre; ?> </p>

<?php endforeach; ?>