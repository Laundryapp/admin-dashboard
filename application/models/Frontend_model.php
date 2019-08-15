<?php

defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set('Asia/Kolkata');
class Frontend_model extends CI_Model {

	 function get_data($table){
        $this->db->where('status',1);
        return $this->db->get($table)->result();
    }

    function get_all_data($table){
        return $this->db->get($table)->result();
    }

    function update($table,$data,$id){
        $this->db->set($data);
        $this->db->where('id',$id);
        if($this->db->update($table)){
            return true;
        }else{
            return false;
        }
    }

    function delete($table,$id){
        $this->db->where('id',$id);
        if($this->db->delete($table)){
            return true;
        }else{
            return false;
        }
    }

    function delete_product($table,$id){
        $this->db->where('id',$id);
        $this->db->set('status',2);
        if($this->db->update($table)){
        $this->db->where('product_id',$id);
        $this->db->set('status',2);
        $this->db->update('delivery_price_location');
            return true;
        }else{
            return false;
        }
    }

    function add_data($data,$table){
        $this->db->set($data);
        if($this->db->insert($table)){
            return $this->db->insert_id();
        }else{
            return false;
        }
    }

    function get_single_data($table,$id){
        $this->db->where('id',$id);
        return $this->db->get($table)->row();
    }

    function get_district(){
        return $this->db->where('state_id',$this->input->post('state_id'))->select('id, city')->get('city')->result();
    }

    function get_mandal(){
        $this->db->where('status',1);
        return $this->db->where('city_id',$this->input->post('district_id'))->select('id, mandal')->get('mandal')->result();
    }

    function get_village(){
        $this->db->where('status',1);
        return $this->db->where('mandal_id',$this->input->post('mandal_id'))->select('id, village')->get('village')->result();
    }

    function get_user_categories($id){
    $sql = "select id, category from category where id IN (select category_id from userproducts where user_id = ".$id." and status = 1)";    // $sql = "select id, category from category WHERE status = 1";
    return $this->db->query($sql)->result();
    }	function get_sub_categories($catid){		$this->db->select('sub_category.subcatname,sub_category.subcatid');        $this->db->from('sub_category');        $this->db->where('sub_category.catid',$catid);		$this->db->where('sub_category.subcatstatus',1);		$query = $this->db->get();		return $query->result();  	}	function get_units_categories($catid){		$this->db->select('units.unit,units.id,units.unit_singular');        $this->db->from('units');        $this->db->where('units.catid',$catid);		$this->db->where('units.status',1);		$query = $this->db->get();		return $query->result();  	}

    function get_units(){
        return $this->db->select('id, unit')->get('units')->result();
    }

    function get_unit_name($id){
        $this->db->where('id',$id);
        return $this->db->get('units')->row();
    }

    function upload_products($file,$file1,$file2,$file3){
        //echo $file; echo $file1;echo $file2;echo $file3;die;
        //echo $this->input->post('quantity_from')[0];die;		
        $data = array(
            'user_id' => $this->session->userdata('user_id'),
            'category_id' => $this->input->post('catid'),            'sub_category_id' => $this->input->post('scatid'),
            'name' => $this->input->post('product_name'),
            'total_qty' => $this->input->post('total_qty'),
            'min_sell_qty' => $this->input->post('min_sell_qty'),            'product_summary' => $this->input->post('product_summary'),            'brand_name' => $this->input->post('brand_name'),            'category' => $this->input->post('catname'),            'subcategory' => $this->input->post('scatname'),
            // 'unit_id' => $this->input->post('unit_id'),            'unit_id' => $this->input->post('uuid'),
            'price' => $this->input->post('unit_price'),
            'image' => $file,
            'image2' => $file1,
            'image3' => $file2,
            'image4' => $file3,
            'date' => date('Y-m-d H:i:s')
             );// echo "<pre>";print_r($data);exit;
             if($this->db->insert('products',$data)){
                $last_id = $this->db->insert_id();
                for ($i=0; $i < count($this->input->post('discount')); $i++) { 
                    if($this->input->post('quantity_to')[$i] != ''){					$betweenPrice = $this->input->post('discount')[$i];					
                    $data1 = array(
                    'product_id' => $last_id,
                    'quantity_from' => $this->input->post('quantity_from')[$i],
                    'quantity_to' => $this->input->post('quantity_to')[$i],
                    'discount' => $this->input->post('discount')[$i],
                    'delivery_price' => $this->input->post('delivery_price')[$i]
                    );
                    $this->db->insert('product_discount',$data1);
                }else{

                }

                }
                return 'success';
            }
            else
            {                return 'failed';
            }
    }

     function get_products_list($user_id,$date,$search){
        $this->db->select('products.id,products.name, products.total_qty, products.min_sell_qty, products.price, products.date, units.unit_singular' );
        $this->db->select("CONCAT('".base_url()."',products.image) as 'image'");
        $this->db->from('products');
        $this->db->join('units', 'products.unit_id = units.id','left');
        $this->db->where('products.user_id',$user_id);
        $this->db->where('products.status',1);
        if($date != ''){
        $this->db->where('DATE(products.date)',$date);
        }
        if($search != ''){
        $this->db->where('products.category_id',$search);
        }
        $this->db->order_by('products.date','DESC');
        return $this->db->get()->result();
        // $this->db->get();
        // echo $this->db->last_query();die;
    }

    function display_products($id,$category_id,$item){
    $this->db->where('id',$id);
    $row = $this->db->get('users')->row();
//        return $row->district;
    if($row->user_type == 'Distributor'){
    $sql = "SELECT * FROM products WHERE user_id IN (SELECT user_id FROM userproducts WHERE location_id IN (SELECT location_id FROM userproducts WHERE user_id = $id and status = 1) AND status = 1) and user_id != $id and user_id IN (SELECT id from users where user_type = 'Farmer' and status = 1) and status = 1 AND category_id = $category_id and name like '%$item%' order by id DESC";
    //echo $sql;die;
    return $this->db->query($sql)->result();
    }else if($row->user_type == 'Seller'){
    $sql = "SELECT * FROM products WHERE user_id IN (SELECT user_id FROM userproducts WHERE location_id IN (SELECT location_id FROM userproducts WHERE user_id = $id and status = 1) AND status = 1) and user_id IN (SELECT id from users where user_type = 'Distributor' and status = 1) and status = 1 AND category_id = $category_id and name like '%$item%' order by id DESC";
    //echo $sql;die;
    return $this->db->query($sql)->result();
    }
    else{
    return false;
    }
    //return $sql;
    }

    function product_discount($id,$qty){
//        $this->db->select('discount');
//        $this->db->where('product_id',$id);
//        $this->db->where('quantity_from >=', $qty);
//        $this->db->where('quantity_to <=', $qty);
//        $this->db->get('product_discount');
    $sql = "SELECT `discount` FROM `product_discount` WHERE `product_id` = $id AND $qty between quantity_from and quantity_to";
    $res = $this->db->query($sql)->row();
    if($res == ''){
        return 0;
    }else{
        return $res->discount;
    }
    //return $this->db->last_query(); 
    }

    function get_product_discount($id){
        $this->db->where('product_id',$id);
        $this->db->where('discount !=',0);
        $this->db->limit(3);
        return $this->db->get('product_discount')->result();
    }

    function get_user_location($id){
    //$id = $this->input->post('user_id');
    $this->db->select('state.state,state.id as state_id, city.city as district, city.id as district_id, mandal.mandal, mandal.id as mandal_id');
    //, village.village,village.id as village_id
    $this->db->from('users');
    $this->db->join('state','state.id = users.state');
    $this->db->join('city','city.id = users.district');
    $this->db->join('mandal','mandal.id = users.mandal');
    $this->db->where('users.id',$id);
    //$this->db->join('village','village.id = users.village');
    return $this->db->get()->row();
    //$this->db->get();
    //echo $this->db->last_query();die;
    }

    function request_list($id,$type){
    $this->db->select('state.state, city.city as district, mandal.mandal, category.category, userproducts.*');
    $this->db->from('userproducts');
    $this->db->join('category','category.id = userproducts.category_id');
    $this->db->join('mandal','mandal.id = userproducts.location_id');
    $this->db->join('city','city.id = mandal.city_id');
    $this->db->join('state','state.id = city.state_id');
    $this->db->where('userproducts.user_id',$id);
    $this->db->where('userproducts.enquiry_type',$type);
    $this->db->order_by('userproducts.date','ASC');
    return $this->db->get()->result();
        // return $this->db->where('user_id',$id)->where('enquiry_type',$type)->get('userproducts')->result();
    }

    function items_list($category_id,$user_id){
        $this->db->where('category_id',$category_id);
        $this->db->where('user_id',$user_id);
        $this->db->where('status',1);
        $this->db->select('id,name');
        $this->db->order_by('date','ASC');
        return $this->db->get('products')->result();
    }

    function get_user_locations($user_id){
        $res = $this->db->where('id',$user_id)->get('users')->row();
        if($this->session->userdata('user_type') != 'Farmer'){
            $this->db->select('mandal.id,mandal.mandal');
            $this->db->from('userproducts');
            $this->db->join('mandal','mandal.id = userproducts.location_id');
            $this->db->where('userproducts.user_id',$user_id);
            $this->db->where('userproducts.location_id !=',$res->mandal);
            $this->db->where('userproducts.status',1);
            return $this->db->get()->result();
        }else{
            //echo $res->mandal;die;
            return $this->db->select('mandal.id,mandal.mandal')->where('city_id',$res->district)->where('id !=',$res->mandal)->get('mandal')->result();
        }
        
    }

    function delivery_charges_list($user_id){
        $this->db->select('delivery_price_location.*, mandal.mandal, products.name');
        $this->db->from('delivery_price_location');
        $this->db->join('mandal','mandal.id = delivery_price_location.mandal');
        $this->db->join('products','products.id = delivery_price_location.product_id');
        $this->db->where('delivery_price_location.user_id',$user_id);
        $this->db->where('delivery_price_location.status',1);
        $this->db->order_by('delivery_price_location.date','ASC');
        return $this->db->get()->result();
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

    function set_qty($temparory_cart, $orderid){
        $temparory_cart =$this->db->where('id',$temparory_cart)->get('temparory_cart')->row();
        $this->db->set('temparory_cart_id',$temparory_cart->id);
        $this->db->set('user_id',$this->session->userdata('user_id'));
        $this->db->set('status',1);
        $this->db->set('date',date('Y-m-d H:i:s'));
        $this->db->set('order_id',$orderid);
        $this->db->insert('cart');
        $sql = "UPDATE `products` SET total_qty = (total_qty - $temparory_cart->quantity) where id = $temparory_cart->product_id";
        return $this->db->query($sql);
    }

    function new_orders($user_id,$order_id,$date){
        $this->db->select('temparory_cart.*,cart.order_id,units.unit, products.image');
        $this->db->from('products');
        $this->db->where('products.user_id',$user_id);
        $this->db->join('units','units.id = products.unit_id');
        $this->db->join('temparory_cart','temparory_cart.product_id = products.id');
        $this->db->join('cart','cart.temparory_cart_id=temparory_cart.id');
        $this->db->where('temparory_cart.status',1);

        if($order_id != ''){
            $this->db->where('cart.order_id',$order_id);
        }
        if($date != ''){
        $this->db->where('DATE(temparory_cart.created_date)',$date);
        }
        $this->db->order_by('temparory_cart.created_date','DESC');
        return $this->db->get()->result();
        //echo $this->db->last_query();die;
    }

    function confirm_order($id){
        $this->db->set('status',2);
        $this->db->where('temparory_cart_id',$id);
        $this->db->update('cart');

        $this->db->set('status',2);
        $this->db->where('id',$id);
        return $this->db->update('temparory_cart');
    }

    function cancel_order($id){
        $this->db->set('status',4);
        $this->db->where('temparory_cart_id',$id);
        $this->db->update('cart');

        $this->db->set('status',4);
        $this->db->where('id',$id);
        $this->db->update('temparory_cart');

        $product = $this->db->where('id',$id)->get('temparory_cart')->row();

        $sql = "UPDATE `products` SET total_qty = (total_qty + $product->quantity) where id = $product->product_id";
        return $this->db->query($sql);
    }

    function cancel_orders($user_id,$order_id,$date){
        $this->db->select('temparory_cart.*,cart.order_id,units.unit, products.image');
        $this->db->from('products');
        $this->db->where('products.user_id',$user_id);
        $this->db->join('units','units.id = products.unit_id');
        $this->db->join('temparory_cart','temparory_cart.product_id = products.id');
        $this->db->join('cart','cart.temparory_cart_id=temparory_cart.id');
        $this->db->where('temparory_cart.status',4);

        if($order_id != ''){
            $this->db->where('cart.order_id',$order_id);
        }
        if($date != ''){
        $this->db->where('DATE(temparory_cart.created_date)',$date);
        }
        $this->db->order_by('temparory_cart.created_date','DESC');
        return $this->db->get()->result();
        //echo $this->db->last_query();die;
    }

    function confirm_orders($user_id,$order_id,$date){
        $this->db->select('temparory_cart.*,cart.order_id,units.unit, products.image');
        $this->db->from('products');
        $this->db->where('products.user_id',$user_id);
        $this->db->join('units','units.id = products.unit_id');
        $this->db->join('temparory_cart','temparory_cart.product_id = products.id');
        $this->db->join('cart','cart.temparory_cart_id=temparory_cart.id');
        $this->db->where('temparory_cart.status',2);

        if($order_id != ''){
            $this->db->where('cart.order_id',$order_id);
        }
        if($date != ''){
        $this->db->where('DATE(temparory_cart.created_date)',$date);
        }
        $this->db->order_by('temparory_cart.id','DESC');
        return $this->db->get()->result();
    }

    function shipped_orders($id){
        $this->db->set('status',3);
        $this->db->where('id',$id);
        $this->db->update('temparory_cart');

        $this->db->set('status',3);
        $this->db->where('temparory_cart_id',$id);
        return $this->db->update('cart');
    }

    function delivery_orders($user_id,$order_id,$date){
        $this->db->select('temparory_cart.*,cart.order_id,units.unit, products.image');
        $this->db->from('products');
        $this->db->where('products.user_id',$user_id);
        $this->db->join('units','units.id = products.unit_id');
        $this->db->join('temparory_cart','temparory_cart.product_id = products.id');
        $this->db->join('cart','cart.temparory_cart_id=temparory_cart.id');
        $this->db->where('temparory_cart.status',3);

        if($order_id != ''){
            $this->db->where('cart.order_id',$order_id);
        }
        if($date != ''){
        $this->db->where('DATE(temparory_cart.created_date)',$date);
        }
        $this->db->order_by('temparory_cart.id','DESC');
        return $this->db->get()->result();
    }

    function my_orders($user_id,$order_id,$date){
        $this->db->select('temparory_cart.*,cart.order_id,units.unit');
        $this->db->from('products');
        $this->db->join('units','units.id = products.unit_id');
        $this->db->join('temparory_cart','temparory_cart.product_id = products.id');
        $this->db->join('cart','cart.temparory_cart_id=temparory_cart.id');
        $this->db->where('temparory_cart.status !=',0);
        $this->db->where('temparory_cart.user_id',$user_id);

        if($order_id != ''){
            $this->db->where('cart.order_id',$order_id);
        }
        if($date != ''){
        $this->db->where('DATE(temparory_cart.created_date)',$date);
        }
        $this->db->order_by('temparory_cart.id','DESC');
        return $this->db->get()->result();
    }

     function get_dis_data($id){
        $this->db->where('status',1);
        $this->db->where('product_id',$id);
        return $this->db->get('product_discount')->result();
    }

    function update_product($id,$file,$file1,$file2,$file3){			        $data = array(			'user_id' => $this->session->userdata('user_id'),            'category_id' => $this->input->post('catid'),			'sub_category_id' => $this->input->post('scatid'),			'name' => $this->input->post('product_name'),			'total_qty' => $this->input->post('total_qty'),			'min_sell_qty' => $this->input->post('min_sell_qty'),			'unit_id' => $this->input->post('uuid'),			'price' => $this->input->post('unit_price'),			'product_summary' => $this->input->post('product_summary'),            'brand_name' => $this->input->post('brand_name'),            'category' => $this->input->post('catname'),            'subcategory' => $this->input->post('scatname'),			'image' => $file,			'image2' => $file1,			'image3' => $file2,			'image4' => $file3,			'date' => date('Y-m-d H:i:s')        );        $this->db->set($data);
        $this->db->where('id',$id); 
        if($this->db->update('products')){            $last_id = $id;            $ids = '';            if(count($this->input->post('quantity_from'))>0){				for ($i=0; $i < count($this->input->post('discount')); $i++) {
					if($this->input->post('discount_id')[$i] == '' && $this->input->post('quantity_to')[$i] != ''){						$data1 = array(
							'product_id' => $last_id,
							'quantity_from' => $this->input->post('quantity_from')[$i],
							'quantity_to' => $this->input->post('quantity_to')[$i],
							'discount' => $this->input->post('discount')[$i],
							'delivery_price' => $this->input->post('delivery_price')[$i]
						);
						$this->db->insert('product_discount',$data1);
						$ids .=$this->db->insert_id().',';					}else{
						if($this->input->post('quantity_to')[$i] != ''){							$data1 = array(
								'product_id' => $last_id,
								'quantity_from' => $this->input->post('quantity_from')[$i],
								'quantity_to' => $this->input->post('quantity_to')[$i],
								'discount' => $this->input->post('discount')[$i],
								'delivery_price' => $this->input->post('delivery_price')[$i]
							);
							$this->db->set($data1);							$this->db->where('id',$this->input->post('discount_id')[$i]); 							$this->db->update('product_discount');							$ids .=$this->input->post('discount_id')[$i].',';						}
					}				}				$ids = rtrim($ids,',');				$sql = "DELETE FROM `product_discount` WHERE id NOT IN (".$ids.") AND product_id = ".$last_id;				$this->db->query($sql);			}else{				$sql = "DELETE FROM `product_discount` WHERE product_id = ".$last_id;				$this->db->query($sql);			}            return 'success';        }
        else
        {
            return 'failed';
        }
    }

    function get_referal_amount($rid){
        $this->db->select_sum('refer_amount');
        $this->db->from('refer');
        $this->db->where('refer_from',$rid);
        $this->db->where('clam',1);
        return $this->db->get()->row();
        //echo $this->db->last_query();die;
    }

    function get_categories_data($user_id){
        $sql = "SELECT * from category where id not in(SELECT category_id from userproducts where user_id = $user_id and enquiry_type = 'product') and status = 1";
        return $this->db->query($sql)->result();
    }

    function get_user_mandal($user_id){
        $res = $this->db->where('id',$user_id)->get('users')->row();
        $sql = "SELECT * from mandal where id != $res->mandal and city_id =  $res->district";
        return $this->db->query($sql)->result();
    }

    function get_discount($id){
        $this->db->select('products.price,product_discount.*,units.unit');
        $this->db->from('products');
        $this->db->join('product_discount','products.id = product_discount.product_id');
        $this->db->join('units','units.id = products.unit_id');
        $this->db->where('products.id',$id);
        return $this->db->get()->result();
    }

    function get_delivery_charges($id){
        $this->db->select('delivery_price_location.*,mandal.mandal');
        $this->db->from('delivery_price_location');
        $this->db->join('mandal','mandal.id = delivery_price_location.mandal');
        $this->db->where('delivery_price_location.product_id',$id);
        return $this->db->get()->result();
    }

    function referral_users($referid){
        $this->db->select('users.name, users.mobile_number as mobile, refer.*');
        $this->db->from('refer');
        $this->db->join('users','users.mobile_number = refer.mobile_number');
        $this->db->where('refer.status',1);
        $this->db->where('refer.refer_from',$referid);
        $this->db->order_by('refer.registered_date','DESC');
        return $this->db->get()->result();
        //echo $this->db->last_query();die;
    }

    function get_order_id($id){
        $this->db->where('temparory_cart_id',$id);
        return $this->db->get('cart')->row();
    }	function getMaxItemQty($pid){		$this->db->select('total_qty,min_sell_qty,price');        $this->db->from('products');		$this->db->where('products.id=',$pid);		$query = $this->db->get();		return $query->row();  	}	function getCheckItemCart($pid,$userId){		$this->db->select('dummy_temporary_cart.*');        $this->db->from('dummy_temporary_cart');		$this->db->where('dummy_temporary_cart.product_id',$pid);		$this->db->where('dummy_temporary_cart.user_id=',$userId);		$query = $this->db->get();		return $query->row();  	}	function insertCartItem($pid,$qty,$totDis,$pname,$unitPrice,$grand_price,$user_id,$delivery_charges){		if($discount==""){			$discount = 0;		}else{			$discount = $discount;		}		if($delivery_charges==""){			$delivery_charges = 0;		}else{			$delivery_charges = $delivery_charges;		}		$data1 = array(			'product_id' 		=> $pid,			'user_id' 			=> $user_id,			'unit_price'		=> $unitPrice,			'total_price' 		=> $grand_price,			'delivery_charges' 	=> $delivery_charges,			'discount' 			=> $discount,			'quantity' 			=> $qty,			'item_name' 		=> $pname,			'created_date'      => date('Y-m-d H:i:s'),		);		if($this->db->insert('dummy_temporary_cart', $data1) === FALSE){                			return 0;		}else{			$id = $this->db->insert_id();			return $id;		}	}	function updateCartItem($id,$toalQty,$totalPrice,$totalDiscount,$delivery_charges){		if($totalDiscount==""){			$totalDiscount = 0;		}else{			$totalDiscount = $totalDiscount;		}		if($delivery_charges==""){			$delivery_charges = 0;		}else{			$delivery_charges = $delivery_charges;		}		$data = array(			'delivery_charges' 	=> $delivery_charges,			'discount' 			=> $totalDiscount,			'total_price' 		=> $totalPrice,			'quantity' 			=> $toalQty,        );        $this->db->where('dummyid',$id);        if($this->db->update('dummy_temporary_cart',$data) === FALSE){            return 0;        }else{            return $id;        }	}	public function getTemCartItems($userId){		$this->db->select('dummy_temporary_cart.dummyid,dummy_temporary_cart.product_id,dummy_temporary_cart.quantity,products.*,units.*,users.id');        $this->db->from('dummy_temporary_cart');		$this->db->join('products','products.id  = dummy_temporary_cart.product_id','left');		$this->db->join('users','products.user_id  = users.id','left');		$this->db->join('units','units.id  = products.unit_id','left');		$this->db->where('dummy_temporary_cart.user_id=',$userId);		$query = $this->db->get();		return $query->result();   	}	function product_delivery_price($id,$qty){		$sql = "SELECT `delivery_price` FROM `product_discount` WHERE `product_id` = $id AND $qty between quantity_from and quantity_to";		$res = $this->db->query($sql)->row();		if($res == ''){			return 0;		}else{			return $res->delivery_price;		}    }	function getUserinfo($userId){		$this->db->select('mobile_number,state.state,city.city,mandal.mandal,village,street,house_no,pincode,address,email,name');        $this->db->from('users');		$this->db->join('state','state.id = users.state');		$this->db->join('city','city.id = users.district');		$this->db->join('mandal','mandal.id = users.mandal');		$this->db->where('users.id=',$userId);		$query = $this->db->get();		return $query->row();  	}	public function getUserCartItemCnt($userId){		$this->db->select('count(*) as cnt');        $this->db->from('dummy_temporary_cart');		$this->db->where('dummy_temporary_cart.user_id=',$userId);		$query = $this->db->get();		return $query->row();  	}	public function cartItemDelete($dId)	{		        $this->db->where('dummyid',$dId);        if($this->db->delete('dummy_temporary_cart')){            return 1;        }else{            return 0;        }	}	public function getDummyItemDetails($id){		$this->db->select('*');        $this->db->from('dummy_temporary_cart');		$this->db->where('dummy_temporary_cart.dummyid=',$id);		$query = $this->db->get();		return $query->row();  	}	public function insertCartItemData($tableName,$data){		$this->db->set($data);        if($this->db->insert($tableName)){            return $this->db->insert_id();        }else{            return 0;        }	}
}