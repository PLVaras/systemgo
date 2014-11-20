<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Systemgo extends CI_Controller {



	public function index()
	{
		$this->load->view('login');
	}
	
	public function validar()
	{
		if($_POST)
		{
			//Creamos un vector para pasar uno o muchos datos hacia la BD
			$datos=array(
			'usuario'=>$this->input->post('usuario'),
			'clave'=>$this->input->post('clave'),
			);
			//Llamamos a una funcion en la BD que se encargue de verificar la existencia del usuario
			//
			$informacion=$this->systemgo_modelo->buscaLogin($datos);
			//Preguntamos si encontro o no datos
			if($informacion->result())
			{
				$this->load->view('bandeja');	
			}
			else
			{
				$this->load->view('error');
			}
			//segun la accion mando a una pagina o a la otra
		}
	}
}

