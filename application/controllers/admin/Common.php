<?php

defined('BASEPATH') OR exit('No direct script access allowed');



class Common extends MY_Controller {



    function __construct() {

    parent::__construct();

    $this->login_required();

    $this->load->model('admin/Common_model');

    }



    function backup()

	{	

		$query = $this->Common_model->dbsave();

	}



	function deactive($id,$table){

		$result = $this->Common_model->deactive($table,$id);

		if($result){

			$this->session->set_flashdata('success_message','"Status Changed Successfully","Success"');

			echo '<script>window.history.go(-1)</script>';

		}else{

			$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');

			echo '<script>window.history.go(-1)</script>';

		}

	}



	function change_status($id,$table){

		$result = $this->Common_model->change_status($table,$id);

		if($result){

			$this->session->set_flashdata('success_message','"Approved Successfully","Success"');

			echo '<script>window.history.go(-1)</script>';

		}else{

			$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');

			echo '<script>window.history.go(-1)</script>';

		}

	}





	function delete_data($id,$table){

		$result = $this->Common_model->delete($table,$id);

				if($result){

					$this->session->set_flashdata('success_message', '"Data Deleted Successfully","Success"');

					echo '<script>window.history.go(-1)</script>';

				}else{

					$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');

					echo '<script>window.history.go(-1)</script>';

				}

	}



	function cancel($id,$table){

		$result = $this->Common_model->cancel($table,$id);

		if($result){

			$this->session->set_flashdata('success_message','"Status Changed Successfully","Success"');

			echo '<script>window.history.go(-1)</script>';

		}else{

			$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');

			echo '<script>window.history.go(-1)</script>';

		}

	}  

    function terms_conditions(){

        $id = 1;

		$this->data['details'] = $this->Common_model->get_single_data('tbl_terms_conditions',$id);

        if($this->input->get_post('submit')){

            $data1=array(

				'data'=>$this->input->post('data'),

				'privacy_policies'=>$this->input->post('privacy_policies')

				);

				$result = $this->Common_model->update('tbl_terms_conditions',$data1,$id);

				if($result){

					$this->session->set_flashdata('success_message', '"Updated Successfully","Success"');

					

					redirect(base_url().'admin/common/tbl_terms_conditions');

				}else{

					$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');

					

					redirect(base_url().'admin/common/tbl_terms_conditions');

				}

        }

		$this->data['page_title']='Terms And Conditions';

		$this->data['page']='terms_conditions';

		$this->admin_view('terms_conditions');

    }

	

	


	function change_all_status(){

		$table = $this->input->get_post('table');

		$result = $this->Common_model->change_all_status($table);

		if($result){

			$this->session->set_flashdata('success_message','"Status Changed Successfully","Success"');

			echo '<script>window.history.go(-1)</script>';

		}else{

			$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');

			echo '<script>window.history.go(-1)</script>';

		}

	}



}