<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Systemgo_modelo extends CI_Model {
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	public function buscaLogin($datosRecibidos)
	{
		$datos=array(
			'dni'=>$datosRecibidos['usuario'],
			'clave'=>$datosRecibidos['clave'],
			);
			return $this->db->get_where('login',$datos);
		
		//otra forma 
		/*$dni=$datosRecibidos['usuario'];
		$clave=$datosRecibidos['clave'];
		
		$sql="select * from login where dni='$dni' and clave='$clave'"
		$consulta=$this->db->query($sql)*/
			
			
		//$sql="select * from login where usuario='$usuario' and clave='$clave'";
		//$consulta=mysql_query($sql);	
	}
	
	public function listarUsuarios()
	{
		return $this->db->query("select * from usuario");
	}


}