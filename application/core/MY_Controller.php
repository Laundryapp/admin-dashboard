<?php
header("access-control-allow-origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");
defined('BASEPATH') OR exit('No direct script access allowed');
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set('Europe/London');

class MY_Controller extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->database();
		$this->load->helper('form');
		$this->load->library('session');
		$this->load->library('form_validation');
		$this->load->model('admin/Common_model');
		$this->load->model('Frontend_model');
		$this->load->helper('cookie');
		$this->load->library('user_agent');
	
	}	

	function admin_view($view_file){		
		$this->load->view('admin/includes/header',$this->data);
		$this->load->view('admin/'.$view_file,$this->data);
	}
	public function login_required(){
		if (!$this->session->userdata('validated')) {
			redirect('admin', 'refresh'); 
		}else{
			return true;
		}
	}

	public function user_login(){
	  if (!$this->session->userdata('user_id')) {
	  redirect('login', 'refresh'); 
	  } else{
	  	return true;
	  }
	}

	public function check_user_active(){
		if($this->session->userdata('user_id')){
		$s = $this->db->where('id',$this->session->userdata('user_id'))->get('users')->row()->status;
		if($s == 0){
		redirect('login/inactive_user', 'refresh'); 
		  } else if($s == 2){
		redirect('login/reg_user', 'refresh'); 
		  } else if($s == 1){
		  	return true;
		  }
		}else{
			return false;
		}
	}
		
	function front_view($page){
		$this->data['user_details'] = $this->Frontend_model->get_single_data('users',$this->session->userdata('user_id'));
		$this->data['new_orders_count'] = count($this->Frontend_model->new_orders($this->session->userdata('user_id'),'',''));
		$this->load->view('pages/includes/header',$this->data);
		$this->load->view('pages/'.$page,$this->data);
		$this->load->view('pages/includes/footer');
	}

	
	

}
