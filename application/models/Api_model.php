<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Api_model extends CI_Model {

    function insert_data($data,$table){
        $this->db->set($data);
        if($this->db->insert($table)){
            return $this->db->insert_id();
        }else{
            return false;
        }
    }

    function update_data($data,$table,$id){
        $this->db->set($data);
        $this->db->where('id',$id);
        if($this->db->update($table)){
            return true;
        }else{
            return false;
        }
    }

    function check_otp($data){
        $this->db->where('mobile_number',$data->mobile_number);
        $this->db->where('otp',$data->otp);
        if($this->db->get('users')->num_rows() == 1){
            $this->db->where('mobile_number',$data->mobile_number);
            $this->db->set('status',1);
            $this->db->set('otp','');
            $this->db->set('otp_verification',1);
            $this->db->update('users');
            return 'success';
        }else{
            return 'failed';
        }
    }

    function resend_otp($data){
        $this->db->set($data);
        $this->db->where('mobile_number',$this->input->get_post('mobile_numer'));
        if($this->db->update('users')){
            return 'success';
        }else{
            return 'failed';
        }
    }

    function partner_with_us($data1){
        // $image = 'admin_assets/profile/'.time().'_'.$_FILES['image']['name'];
     //    move_uploaded_file($_FILES['image']['tmp_name'],$image);

        $data = array(
        'name' => $data1->name,
        'user_type' => $data1->user_type,
        'category' => $data1->category,
        'state' => $data1->state,
        'district' => $data1->district,
        'mandal' => $data1->mandal,
        'village' => $data1->village,
        'address' => $data1->address,
        //'profile' => $image
        );
        $this->db->where('id',$data1->id);
        if($this->db->update('users',$data)){
                $data = array(
                    'user_id' => $data1->id,
                    'category_id' => $data1->category,
                    'location_id' => $data1->mandal,
                    'status' => 1,
                    'enquiry_type'=>'product'
                );
                $this->db->insert('userproducts',$data);

                $data = array(
                    'user_id' => $data1->id,
                    'category_id' => $data1->category,
                    'location_id' => $data1->mandal,
                    'status' => 1,
                    'enquiry_type'=>'location'
                );
                $this->db->insert('userproducts',$data);

             return 'success';
         }else{
             return false;
         }

    }

    function sign_up($otp,$data1){
        $data = array(
            'email' => $data1->email,
            'dob' => date('Y-m-d',strtotime($data1->dob)),
            'gender' => $data1->gender,
            'password' => md5($data1->password),
            'terms_conditions' => $data1->terms_conditions,
            'otp'=>$otp,
            'mobile_number' => $data1->mobile_number
             );

             if($this->db->insert('users',$data)){
                 return $this->db->insert_id();
             }else{
                 return false;
             }
    }

    function get_data($table){
        $this->db->where('status',1);
        return $this->db->get($table)->result();
    }

    function get_district($data){
        return $this->db->where('state_id',$data->state_id)->select('id, city')->get('city')->result();
    }

    function get_mandal($data){
        $this->db->where('status',1);
        return $this->db->where('city_id',$data->district_id)->select('id, mandal')->get('mandal')->result();
    }

    function get_village($data){
        $this->db->where('status',1);
        return $this->db->where('mandal_id',$data->mandal_id)->select('id, village')->get('village')->result();
    }

    function check_login($data){
        $mobile_number = $data->mobile_number;
        $pwd = md5($data->password);
        $this->db->where('mobile_number',$mobile_number);
        $this->db->where('password',$pwd);
        $res = $this->db->get('users');
        if($res->num_rows() == 1){
            //$this->db->select("CONCAT('".base_url()."',profile) as 'image'");
            return $this->db->where('id',$res->row()->id)->select('id, name, user_type, mobile_number,state,district,mandal,village,status,otp_verification')->get('users')->row();
        }else{
            return false;
        }
    }

    function upload_products($response){
        $data2 =  $response->discount_details;
        // $image = 'admin_assets/products/'.time().'_'.$_FILES['image']['name'];
     //        move_uploaded_file($_FILES['image']['tmp_name'],$image);

        $data = array(
            'user_id' => $response->user_id,
            'category_id' => $response->category_id,
            'name' => $response->name,
            'total_qty' => $response->total_qty,
            'min_sell_qty' => $response->min_sell_qty,
            'unit_id' => $response->unit_id,
            'price' => $response->price,
            'image' => $response->image
             );
             if($this->db->insert('products',$data)){
                $last_id = $this->db->insert_id();
                for ($i=0; $i < count($response->discount_details); $i++) { 
                    $data1 = array(
                    'product_id' => $last_id,
                    'quantity_from' => $data2[$i]->quantity_from,
                    'quantity_to' => $data2[$i]->quantity_to,
                    'discount' => $data2[$i]->discount,
                    'delivery_price' => $data2[$i]->delivery_price
                    );
                    $this->db->insert('product_discount',$data1);
                }
                return 'success';
            }
            else
            {
                return 'failed';
            }
    }


    function update_products($response){
        $data2 =  $response->discount_details;

        $id = $response->id;

//        if($_FILES['image']['name'] != ''){
//        $image = 'admin_assets/products/'.time().'_'.$_FILES['image']['name'];
//            move_uploaded_file($_FILES['image']['tmp_name'],$image);
//        }else{
//            $image = $this->input->post('image1');
//        }

        $data = array(
            'user_id' => $response->user_id,
            'category_id' => $response->category_id,
            'name' => $response->name,
            'total_qty' => $response->total_qty,
            'min_sell_qty' => $response->min_sell_qty,
            'unit_id' => $response->unit_id,
            'price' => $response->price,
            'image' => $response->image
             );
             $this->db->where('id',$id);
             if($this->db->update('products',$data)){

                for ($i=0; $i < count($response->discount_details); $i++) {
                    if($data2[$i]->id == ''){
                    $data1 = array(
                    'product_id' => $id,
                    'quantity_from' => $data2[$i]->quantity_from,
                    'quantity_to' => $data2[$i]->quantity_to,
                    'discount' => $data2[$i]->discount,
                    'delivery_price' => $data2[$i]->delivery_price
                    );
                    $this->db->insert('product_discount',$data1);
                    $ids[] = $this->db->insert_id();
                    }else{
                    $data1 = array(
                    'product_id' => $id,
                    'quantity_from' => $data2[$i]->quantity_from,
                    'quantity_to' => $data2[$i]->quantity_to,
                    'discount' => $data2[$i]->discount,
                    'delivery_price' => $data2[$i]->delivery_price
                    );
                    $this->db->where('id',$data2[$i]->id);
                    $this->db->update('product_discount',$data1);
                    $ids[] = $data2[$i]->id;
                    }
                }

                    $ids1 = implode(",",$ids);

                    $sql = "DELETE from product_discount where product_id = $id and id NOT IN ($ids1)";
                    $this->db->query($sql);
                 return 'success';
             }else{
                 return 'failed';
             }
    }


    function product_details(){
        $pid = $this->input->post('product_id');
        $this->db->where('id', $pid);
        return $this->db->get('products')->row();
    }

    function get_product_discount($table,$pid){
        $this->db->where('product_id',$pid);
        return $this->db->get($table)->result();
    }

    function get_products_list(){
        $this->db->select('products.id,products.name, products.total_qty, products.min_sell_qty, products.price, products.date, units.unit' );
        $this->db->select("CONCAT('".base_url()."',products.image) as 'image'");
        $this->db->from('products');
        $this->db->join('units', 'products.unit_id = units.id');
        return $this->db->get()->result();
    }

    function get_your_products(){
        $user_id = $this->input->post('user_id');
        if($this->db->select('user_type')->from('users')->where('id',$user_id)->get() != 'farmer'){
        $this->db->select('distributer.product,products.product as product_name');
        $this->db->from('distributer');
        $this->db->join('products', 'distributer.product = products.id');
        $this->db->where('distributer.user_id',$user_id);
        return $this->db->get()->result();
        }else{
        $this->db->select('users.product,products.product as product_name');
        $this->db->from('users');
        $this->db->join('products', 'users.product = products.id');
        $this->db->where('users.id',$user_id);
        return $this->db->get()->result();
        }
    }

    function get_items(){
        $product_id = $this->input->post('product_id');
        $this->db->where('product_id',$product_id);
        $this->db->select('id,item');
        return $this->db->get('items')->result();
    }

    function get_units(){
        return $this->db->select('id, unit')->get('units')->result();
    }

    function get_single_data($table,$id){
        return $this->db->where('id',$id)->get($table)->row();
    }

    function get_user_categories($id){
        $sql = "select id, category from category where id IN (select category_id from userproducts where user_id = ".$id." and status = 1)";
        return $this->db->query($sql)->result();
    }

    function get_user_items($id){
        //$id = $this->input->post('user_id');
        $sql = "select id,name from products where user_id = $id";
        return $this->db->query($sql)->result();
    }

    function get_user_location($id){
        //$id = $this->input->post('user_id');
        $this->db->select('state.state,state.id as state_id, city.city as district, city.id as district_id, mandal.mandal, mandal.id as mandal_id, village.village,village.id as village_id');
        $this->db->from('users');
        $this->db->join('state','state.id = users.state');
        $this->db->join('city','city.id = users.district');
        $this->db->join('mandal','mandal.id = users.mandal');
        $this->db->join('village','village.id = users.village');
        return $this->db->get()->result();
    }

    function requested_product_list($id){
        //$id = $this->input->post('user_id');
        return $this->db->where('user_id',$id)->where('enquiry_type','product')->get('userproducts')->result();
    }

    function get_location($id){
        $this->db->select('state.state,city.city,mandal.mandal');
        $this->db->from('mandal');
        $this->db->join('city','city.id = mandal.city_id');
        $this->db->join('state','state.id = city.state_id');
        $this->db->where('mandal.id ='.$id);
        return $this->db->get()->row();
        //echo $this->db->last_query();die;
    }

    function requested_location_list($id){
        //$id = $this->input->post('user_id');
        return $this->db->where('user_id',$id)->where('enquiry_type','location')->get('userproducts')->result();
    }

    function delivery_charge_list($id){
        //$id = $this->input->post('user_id');
        $this->db->select('delivery_price_location.*, mandal.mandal as mandal_name, products.name as item_name');
        $this->db->from('delivery_price_location');
        $this->db->join('mandal','mandal.id = delivery_price_location.mandal');
        $this->db->join('products','products.id = delivery_price_location.product_id');
        $this->db->where('delivery_price_location.user_id',$id);
        return $this->db->get()->result();
        //return $this->db->last_query();
    }

    function items_list($data){
        $id = $data->category_id;
        $user_id = $data->user_id;
        $this->db->where('category_id',$id);
        $this->db->where('user_id',$user_id);
        $this->db->where('status',1);
        $this->db->select('id,name');
        return $this->db->get('products')->result();
    }

    function forget_password($pwd,$mobile){
        $this->db->where('mobile_number',$mobile);
        $this->db->set('password',md5($pwd));
        if($this->db->update('users')){
            return true;
        }else{
            return false;
        }
    }
    
    function display_products($id,$category_id){
        $this->db->where('id',$id);
        $row = $this->db->get('users')->row();
//        return $row->district;
        $sql = "SELECT * FROM products WHERE user_id IN (SELECT user_id FROM userproducts WHERE location_id IN (SELECT location_id FROM userproducts WHERE user_id = $id) AND category_id = $category_id AND status = 1) and user_id != $id and status = 1";
        return $this->db->query($sql)->result();
        //return $sql;
    }
    
    function product_discount($id,$qty){
//        $this->db->select('discount');
//        $this->db->where('product_id',$id);
//        $this->db->where('quantity_from >=', $qty);
//        $this->db->where('quantity_to <=', $qty);
//        $this->db->get('product_discount');
        $sql = "SELECT `discount` FROM `product_discount` WHERE `product_id` = $id AND $qty between quantity_from and quantity_to";
        return $this->db->query($sql)->row();
        //return $this->db->last_query(); 
    }
    
    function search_products($id,$category_id,$search){
        $this->db->where('id',$id);
        $row = $this->db->get('users')->row();
//        return $row->district;
        $sql = "SELECT * FROM products WHERE user_id IN (SELECT user_id FROM userproducts WHERE location_id IN (SELECT location_id FROM userproducts WHERE user_id = $id) AND category_id = $category_id AND status = 1) and user_id != $id and status = 1 and name LIKE '%$search%'";
        return $this->db->query($sql)->result();
        //return $sql;
        
    }
    
    // function refer_friend(){
        
    // }
}