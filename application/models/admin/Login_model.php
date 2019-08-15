<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	class Login_model extends CI_Model {
		function login_check(){
			$username = $this->input->post('u_email');
			$password = md5($this->input->post('u_password'));
			$this->db->where('email', $username);
		    $this->db->where('password', $password);
		    $query = $this->db->get('tbl_admin_users_master');
		    if($query->num_rows() == 1)
	        {   
	            $row = $query->row();
				$data = array(
					'userid'   => $row->id,
					'username' => ucfirst($row->name),
					'email'   => ucfirst($row->email),
					'validated' => true
				);
				$this->session->set_userdata($data);
				return $query->row();
			}else{
			  return false;
			}
		}



		function forgot_password(){



			$data=$this->db->get('admin')->row();

			$password = rand(100000,99999999);

			$this->db->set('password',md5($password));

			$this->db->where('id',$data->id);

			if($this->db->update('admin')){



		require_once './mandrill-api-php/src/Mandrill.php'; //Not required with Composer

	   $mandrill = new Mandrill('L3k0-wHVFNC4Fq2WGJcmkw');

	   try {

        $msg = 'New Password:'.$password;

	   $mandrill = new Mandrill('L3k0-wHVFNC4Fq2WGJcmkw'); 

	   $message = array(

	   'html' => $msg,

           'text' => '',

		'subject' => 'Forgot Password',

	   'from_email' =>'info@thecolourmoon.com',

	   'from_name' => 'School Fee',

	   'to' => array(

	   array(

	   'email' => $data->email,  

	   'name' => '',

	   'type' => 'to'

	   )   

	   ),

	   'headers' => array('Reply-To' => ''),

	   'important' => false,

	   'track_opens' => null,

	   'track_clicks' => null,

	   'auto_text' => null, 

	   'auto_html' => null,

	   'inline_css' => null,

	   'url_strip_qs' => null,

	   'preserve_recipients' => null,

	   'view_content_link' => null,

	   'bcc_address' => '',

	   'tracking_domain' => null,

	   'signing_domain' => null,

	   'return_path_domain' => null,

	   'merge' => true,

	   'merge_language' => 'mailchimp',

	   

	   );

	   $async = false;

	   $ip_pool = 'Main Pool';

	   $send_at = '';

	   $result = $mandrill->messages->send($message, $async, $ip_pool, $send_at);

		 if($result)

	   {

	   $m = true;

	   }  

	   } 

	   catch(Mandrill_Error $e) {

		$m = false;  

	   }

	   return $m;

		}

		else{

			return false;

		}

		}

}