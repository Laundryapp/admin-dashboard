<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login_model extends CI_Model {
    
	function sign_up($otp){
        // 'dob' => date('Y-m-d',strtotime($this->input->post('dob'))),
        //     'gender' => $this->input->post('gender'),
        $data = array(
            'email' => $this->input->post('email'),
            'password' => md5($this->input->post('password')),
            'terms_conditions' => $this->input->post('terms_conditions'),
            'otp'=>$otp,
            'mobile_number' => $this->input->post('mobile_number')
             );

             if($this->db->insert('users',$data)){
                
                 $this->db->where('mobile_number',$this->input->post('mobile_number'));
                 $this->db->set('registered',1);
                 $this->db->update('refer');

                 return true;
             }else{
                 return false;
             }
    }

        function check_otp(){
        $this->db->where('mobile_number',$this->input->post('mobile_number'));
        $this->db->where('otp',$this->input->post('otp'));
        $user = $this->db->get('users');
        if($user->num_rows() == 1){
            $this->db->where('mobile_number',$this->input->post('mobile_number'));
            $this->db->set('status',1);
            $this->db->set('otp','');
            $this->db->set('otp_verification',1);
            $this->db->update('users');
            return $user->row();
        }else{
            return false;
        }

    }

    function resend_otp($data,$mobile_number){
    $this->db->set($data);
    $this->db->where('mobile_number',$mobile_number);
    if($this->db->update('users')){
        return 'success';
    }else{
        return 'failed';
    }
    }

        function check_login(){
        $mobile_number = $this->input->post('mobile_number');
        $pwd = md5($this->input->post('password'));
        $this->db->where('mobile_number',$mobile_number);
        $this->db->where('password',$pwd);
        $res = $this->db->get('users');
        if($res->num_rows() == 1){
            //$this->db->select("CONCAT('".base_url()."',profile) as 'image'");
            return $this->db->where('id',$res->row()->id)->get('users')->row();
        }else{
            return false;
        }
    }

    function partner_with_us($file,$id){
         function generate_token($length = 6) {
            // abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
         $characters = '0123456789';
         $charactersLength = strlen($characters);
         $randomString = 'AMH';
         for ($i = 0; $i < $length; $i++) {
           $randomString .= $characters[rand(0, $charactersLength - 1)];
         }
         return $randomString;
         }
         $transaction_id=generate_token();
         $query=$this->db->where('referid',$transaction_id)->get('users');
         if($query->num_rows()>0){
           $transaction_id = generate_token();
         }


        $referid = $transaction_id;
        
        $data = array(
        'profile'=>$file,
        'name'=>$this->input->get_post('name'),
        'user_type'=>$this->input->get_post('user_type'),
        'category'=>$this->input->get_post('category'),
        'user_type'=>$this->input->get_post('user_type'),
        'state'=>$this->input->get_post('state'),
        'district'=>$this->input->get_post('city'),
        'mandal'=>$this->input->get_post('mandal'),
        'village'=>$this->input->get_post('village'),
        'address'=>$this->input->get_post('address'),
        'referid'=>$referid,
        'street'=>$this->input->get_post('street'),
        'house_no'=>$this->input->get_post('house_no'),
        'pincode'=>$this->input->get_post('pincode'),
        'status'=>2
        );
        $this->db->where('id',$id);
        if($this->db->update('users',$data)){
                $data = array(
                    'user_id' =>$id,
                    'category_id' =>$this->input->post('category'),
                    'location_id' =>$this->input->post('mandal'),
                    'status' => 1,
                    'enquiry_type'=>'product'
                );
                $this->db->insert('userproducts',$data);

                $data = array(
                    'user_id' =>$id,
                    'category_id' =>$this->input->post('category'),
                    'location_id' =>$this->input->post('mandal'),
                    'status' => 1,
                    'enquiry_type'=>'location'
                );
                $this->db->insert('userproducts',$data);

             return true;
         }else{
             return false;
         }

    }

    function forget_password($pwd,$mobile,$otp){
        $this->db->where('mobile_number',$mobile);
        $this->db->where('forget_otp',$otp);
        $this->db->set('forget_otp','');
        $this->db->set('password',md5($pwd));
        $this->db->update('users');
        //echo $this->db->last_query();die;
        if($this->db->affected_rows()){
            return true;
        }else{
            return false;
        }
    }
}