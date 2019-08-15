<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	class Common_model extends CI_Model {
    function dbsave(){
        $this->load->dbutil();
        $prefs = array(
			'format'        => 'zip',                       
			'filename'      => date('d-M-Y').'-mybackup.sql', 
			'add_drop'      => TRUE,
			'add_insert'    => TRUE,  
			'newline'       => "\n" 
        );
        $backup = $this->dbutil->backup($prefs);
        $this->load->helper('file');
        write_file('mybackup.zip', $backup);
        $this->load->helper('download');
        force_download('mybackup.zip', $backup);
    }
	public function updatedInsertedProductItem($data,$product_image,$product_thumb_image){
		$category_id ="";
		if(isset($data['category_id']) && $data['category_id']!=""){
			$category_id = $data['category_id'];
		}
		$product_name ="";
		if(isset($data['product_name']) && $data['product_name']!=""){
			$product_name = $data['product_name'];
		}
		$product_description ="";
		if(isset($data['product_description']) && $data['product_description']!=""){
			$product_description = $data['product_description'];
		}
		$product_discount_type = 0;
		if(isset($data['product_discount_type']) && $data['product_discount_type']!=""){
			$product_discount_type = $data['product_discount_type'];
		}
		$product_discount_per = 0;
		if(isset($data['product_discount_per']) && $data['product_discount_per']!=""){
			$product_discount_per = $data['product_discount_per'];
		}
		$product_discount_fixed = 0;
		if(isset($data['product_discount_fixed']) && $data['product_discount_fixed']!=""){
			$product_discount_fixed = $data['product_discount_fixed'];
		}
		$product_price = 0;
		if(isset($data['product_price']) && $data['product_price']!=""){
			$product_price = $data['product_price'];
		}
		$dataa =array(
			'category_id'     => $category_id,
			'product_name'    => $product_name,
			'product_description'  => $product_description,
			'product_discount_type' => $product_discount_type,
			'product_discount_per' => $product_discount_per,
			'product_discount_fixed' => $product_discount_fixed,
			'product_image'            => $product_image,
			'product_thumb_image'       => $product_thumb_image,
			'product_price'       => $product_price,
		);
		if(isset($data['h_prdid']) && $data['h_prdid']!=""){
			$prdid = $data['h_prdid'];
			$dataa['updated_at'] =  date('Y-m-d H:i:s');
			  $this->db->where('prdid',$prdid);
			if ($this->db->update('tbl_products',$dataa) === FALSE){
				return 0;
			}else{
				return $prdid;
			}
		}else{
			$dataa['created_date']   =  date('Y-m-d H:i:s');
			$dataa['updated_at']   =  date('Y-m-d H:i:s');
			$dataa['status']      =  1;
			if($this->db->insert('tbl_products', $dataa) === FALSE){                
				return 0;
			}else{
				return $this->db->insert_id();
			}
		}	
	}
	public function item_inserted_images($product_id,$product_image,$product_thumb_image){
		$this->db->where('product_id',$product_id);
		if($this->db->delete('tbl_product_images')){
		   $st=1;
		}else{
			$st=0;
		}
		$dataa =array(
			'pi_image'       => $product_image,
			'pi_thumb_image' => $product_thumb_image,
			'product_id' => $product_id,
			'pi_status' => 1,
			'pi_created_at' => date('Y-m-d H:i:s'),
			'pi_updated_at' => date('Y-m-d H:i:s'),
		);
		if($this->db->insert('tbl_product_images', $dataa) === FALSE){                
			return 0;
		}else{
			return $this->db->insert_id();
		}
	}
	public function updatedInsertedCategory($data,$catimg,$catthumbimg){
		if(isset($data['category_name']) && $data['category_name']!=""){
			$category_name = $data['category_name'];
		}
		$cat_offer_type = 0;
		if(isset($data['cat_offer_type']) && $data['cat_offer_type']!=""){
			$cat_offer_type = $data['cat_offer_type'];
		}
		$cat_discount_per = 0;
		if(isset($data['cat_discount_per']) && $data['cat_discount_per']!=""){
			$cat_discount_per = $data['cat_discount_per'];
		}
		$cat_dis_fixed_amt = 0;
		if(isset($data['cat_dis_fixed_amt']) && $data['cat_dis_fixed_amt']!=""){
			$cat_dis_fixed_amt = $data['cat_dis_fixed_amt'];
		}
		$dataa =array(
			'category_name'     => $category_name,
			'cat_offer_type'    => $cat_offer_type,
			'cat_discount_per'  => $cat_discount_per,
			'cat_dis_fixed_amt' => $cat_dis_fixed_amt,
			'catimg'            => $catimg,
			'catthumbimg'       => $catthumbimg,
		);
		if(isset($data['h_cat_id']) && $data['h_cat_id']!=""){
			$catId = $data['h_cat_id'];
			$dataa['cat_updatedat'] =  date('Y-m-d H:i:s');
			  $this->db->where('cat_id',$catId);
			if ($this->db->update('tbl_product_categories',$dataa) === FALSE){
				return 0;
			}else{
				return $catId;
			}
		}else{
			$dataa['cat_createdat']   =  date('Y-m-d H:i:s');
			$dataa['cat_updatedat']   =  date('Y-m-d H:i:s');
			$dataa['cat_status']      =  1;
			if($this->db->insert('tbl_product_categories', $dataa) === FALSE){                
				return 0;
			}else{
				return $this->db->insert_id();
			}
		}	
	}
	public function updatedInsertedcategory_ref_id($cateInserted,$category_ref_id){
		$data = array(
            'category_ref_id' => $category_ref_id,
        );
        $this->db->where('cat_id',$cateInserted);
        if ($this->db->update('tbl_product_categories',$data) === FALSE){
            return 0;
        }else{
            return 1;
        }
	}
	public function category_actions($id,$type){
		if($type==2){
			$this->db->where('cat_id',$id);
			if($this->db->delete('tbl_product_categories')){
			   return 1;
			}else{
				return 0;
			}
		}else{
			$data = array(
				'cat_status' => $type,
			);
			$this->db->where('cat_id',$id);
			if ($this->db->update('tbl_product_categories',$data) === FALSE){
				return 0;
			}else{
				return 1;
			}
		}
	}
	public function product_Item_actions($id,$type){
		if($type==2){
			$this->db->where('prdid',$id);
			if($this->db->delete('tbl_products')){
			   return 1;
			}else{
				return 0;
			}
		}else{
			$data = array(
				'status' => $type,
			);
			$this->db->where('prdid',$id);
			if ($this->db->update('tbl_products',$data) === FALSE){
				return 0;
			}else{
				return 1;
			}
		}
	}
	public function getItem_details($table,$id){
		$this->db->where('prdid',$id);
        return $this->db->get($table)->row();
	}
	public function getCategory_details($table,$id){
		$this->db->where('cat_id',$id);
        return $this->db->get($table)->row();
	}
    function update($table,$data,$id){
        $this->db->set($data);
		if($table=='sub_category'){
			$this->db->where('subcatid',$id);
		}else{
			$this->db->where('id',$id);
		}
        if($this->db->update($table)){
            return true;
        }else{
            return false;
        }
    }
    function get_data($table){
		// $this->db->where('status',1);
        return $this->db->get($table)->result();
    }
	public function get_vendors_data($table){
		$this->db->join('tbl_stores_logininfo_master','tbl_stores_logininfo_master.store_id = tbl_stores_master.id','LEFT');
		$this->db->where('tbl_stores_logininfo_master.account_status != "D"');
        return $this->db->get($table)->result();
	}
	public function get_drivers_data($table){
		$this->db->where('driver_status !=',2);
        return $this->db->get($table)->result();
	}
	public function get_users_data($table){
		$this->db->join('tbl_user_login_accessinfo','tbl_user_login_accessinfo.userid = tbl_users_master.id','LEFT');
        return $this->db->get($table)->result();
	}
	function get_data_cats($table){
		$this->db->where('cat_status',1);
        return $this->db->get($table)->result();
    }
	function get_data_items($table,$catid){
		$this->db->select('*');
        $this->db->from($table);	
		$this->db->join('tbl_product_categories','tbl_product_categories.cat_id = tbl_products.category_id','LEFT');
		if($catid!=""){
			$this->db->where('tbl_products.category_id',$catid);
		}
		$this->db->where('tbl_product_categories.cat_status',1);
        return $this->db->get()->result();
    }
	function get_units_data($table){
		$this->db->select('units.id,units.unit,units.unit_singular,units.status,category.category');
        $this->db->from('units');	
		$this->db->join('category','category.id = units.catid','LEFT');
        return $this->db->get()->result();
    }
	function get_subcat_data($table){
		$this->db->join('category','category.id = sub_category.catid');
		$this->db->where('subcatstatus',1);
        return $this->db->get($table)->result();

    }
	function get_subcat_single_data($table,$id){

        $this->db->where('subcatid',$id);

        return $this->db->get($table)->row();

    }
	function get_single_data($table,$id){
        $this->db->where('id',$id);
        return $this->db->get($table)->row();
    }
    function get_products($id){
        $this->db->where('user_id',$id);
        $this->db->where('enquiry_type','product');
        return $this->db->get('userproducts')->result();
    }
    function get_pending_requestes_count($id){
        $this->db->where('user_id',$id);
        $this->db->where('status',0);
		return $this->db->get('userproducts')->result();
    }
    function get_locations($id){
        $this->db->where('user_id',$id);
        $this->db->where('enquiry_type','location');
        return $this->db->get('userproducts')->result();
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
	/* Store information */
	function get_single_vendors_data($table,$storeId){
        $this->db->where('id',$storeId);
        return $this->db->get($table)->row();
    }
	function get_vendors_holidays_list($table,$storeId){
        $this->db->where('shl_store_id',$storeId);
        return $this->db->get($table)->result();
    }
	function get_vendors_express($table,$storeId){
        $this->db->where('set_store_id',$storeId);
        return $this->db->get($table)->result();
    }
	function get_vendors_shop_timings($table,$storeId){
        $this->db->where('sst_store_id',$storeId);
        return $this->db->get($table)->row();
    }
	/* End  */
    function add($table,$data){
        $this->db->set($data);
        if($this->db->insert($table)){
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
    function deactive($table,$id){
        if($this->db->where('id',$id)->get($table)->row()->status == 1){
            $this->db->set('status',0);
        }else{
            $this->db->set('status',1);
        }
        $this->db->where('id',$id);
        if($this->db->update($table)){
            return true;
        }else{
            return false;
        }
    }
    function change_status($table,$id){
        $this->db->set('status',1);
        $this->db->where('id',$id);
        if($this->db->update($table)){
            return true;
        }else{
            return false;
        }
    }
    function cancel($table,$id){
        if($this->db->where('id',$id)->get($table)->row()->status == 2){
            $this->db->set('status',1);
        }else{
            $this->db->set('status',2);
        }
        $this->db->where('id',$id);
        if($this->db->update($table)){
            return true;
        }else{
            return false;
        }
    }
    function get_users($table,$type){
        $this->db->where('user_type',$type);
        $this->db->order_by('id','DESC');
        return $this->db->get($table)->result();
    }
    function get_products_list($type){
        // $this->db->select('products.*, category.category, users.name as user_name, units.unit');
        // $this->db->from('products');
        // $this->db->join('category','category.id = products.category_id');
        // $this->db->join('units','units.id = products.unit_id');
        // $this->db->join('users','users.id = products.user_id');
        $sql = "SELECT `products`.*, `category`.`category`, `users`.`name` as `user_name`, `units`.`unit` FROM `products` JOIN `category` ON `category`.`id` = `products`.`category_id` JOIN `units` ON `units`.`id` = `products`.`unit_id` JOIN `users` ON `users`.`id` = `products`.`user_id` where `products`.`user_id` IN (select id from users where user_type = '".$type."') AND products.status = 1 ORDER BY products.id DESC";
        return $this->db->query($sql)->result();
        //return $this->db->get()->result();
         //$this->db->get();
         //echo $this->db->last_query();die;
	}



    function get_request_count($user_type,$request_type){

        $sql = "SELECT id from userproducts where enquiry_type = '".$request_type."' and status = 0 and user_id in (select id from users where user_type = '".$user_type."')";
		return $this->db->query($sql)->result();

    }



    function get_products_count($type){

        $sql = "SELECT `id` FROM `products` where `user_id` IN (select id from users where user_type = '".$type."') and status = 1 ORDER BY products.id DESC";

        return $this->db->query($sql)->result();

    }



    function get_product_details($pid){

        $this->db->select('products.*, category.category, users.name as user_name, units.unit');

        $this->db->from('products');

        $this->db->join('category','category.id = products.category_id');

        $this->db->join('units','units.id = products.unit_id');

        $this->db->join('users','users.id = products.user_id');

        $this->db->where('products.id',$pid);

        return $this->db->get()->row();

    }



    function get_product_discounts($pid){

        $this->db->where('product_id',$pid);

        return $this->db->get('product_discount')->result();

    }



    function get_product_discount($id){

        $this->db->where('product_id',$id);

        return $this->db->get('product_discount')->result();

    }

    

    function get_user_categories($id){

        $sql = "select id, category from category where id IN (select category_id from userproducts where user_id = ".$id." and status = 1)";

        return $this->db->query($sql)->result();

    }



    function orders(){

        $this->db->select('temparory_cart.*,cart.order_id,units.unit');

        $this->db->from('products');

        $this->db->join('units','units.id = products.unit_id');

        $this->db->join('temparory_cart','temparory_cart.product_id = products.id');

        $this->db->join('cart','cart.temparory_cart_id=temparory_cart.id');

        $this->db->where('temparory_cart.status !=',0);

        if($this->input->get_post('search')){

            $this->db->where('temparory_cart.status',$this->input->get_post('search'));

        }

        $this->db->order_by('temparory_cart.id','DESC');

        return $this->db->get()->result();

    }   



    function failed_users(){

        $sql = "SELECT * FROM users WHERE user_type IS NULL";

        return $this->db->query($sql)->result();

    }



    function referral_users(){

        $this->db->select('users.name, users.mobile_number as mobile, refer.*');

        $this->db->from('refer');

        $this->db->join('users','users.referid = refer.refer_from');

        $this->db->where('refer.status',1);

        $this->db->order_by('refer.registered_date','DESC');

        return $this->db->get()->result();

    }



    function amount_request(){

        $this->db->select('users.name, users.mobile_number as mobile, transfer.*');

        $this->db->from('transfer');

        $this->db->join('users','users.id = transfer.user_id');

        $this->db->order_by('id','DESC');

        return $this->db->get()->result();

    }



     function change_all_status($table){

        //echo $this->input->post('ids')[6];

        //print_r($this->input->post('ids'));die;

        for($i=0; $i<count($this->input->post('ids'));$i++) {

            if($this->db->where('id',$this->input->post('ids')[$i])->get($table)->row()->status == 1){

            $this->db->set('status',0);

            }else{

                $this->db->set('status',1);

            }

            $this->db->where('id',$this->input->post('ids')[$i]);

            $k = $this->db->update($table);

        }

        

        if($k){

            return true;

        }else{

            return false;

        }

    }



    function update_product($id,$file,$file1,$file2,$file3){

        $data = array(

        'category_id' => $this->input->post('category_id'),

        'name' => $this->input->post('name'),

        'total_qty' => $this->input->post('total_qty'),

        'min_sell_qty' => $this->input->post('min_sell_qty'),

        'unit_id' => $this->input->post('unit_id'),

        'price' => $this->input->post('price'),

        'image' => $file,

        'image2' => $file1,

        'image3' => $file2,

        'image4' => $file3

         );

        $this->db->set($data);

        $this->db->where('id',$id); 

         if($this->db->update('products')){

            $last_id = $id;

            if(count($this->input->post('discount')) > 0){

            

            $ids = '';

            for ($i=0; $i < count($this->input->post('discount')); $i++) { 

                if($this->input->post('discount_id')[$i] == ''){

                $data1 = array(

                'product_id' => $last_id,

                'quantity_from' => $this->input->post('quantity_from')[$i],

                'quantity_to' => $this->input->post('quantity_to')[$i],

                'discount' => $this->input->post('discount')[$i],

                'delivery_price' => $this->input->post('delivery_price')[$i]

                );

                $this->db->insert('product_discount',$data1);

                $ids .=$this->db->insert_id().',';

            }else{

                $data1 = array(

                'product_id' => $last_id,

                'quantity_from' => $this->input->post('quantity_from')[$i],

                'quantity_to' => $this->input->post('quantity_to')[$i],

                'discount' => $this->input->post('discount')[$i],

                'delivery_price' => $this->input->post('delivery_price')[$i]

                );

                $this->db->set($data1);

                $this->db->where('id',$this->input->post('discount_id')[$i]); 

                $this->db->update('product_discount');

                $ids .=$this->input->post('discount_id')[$i].',';

            }



            }

            $ids = rtrim($ids,',');

            $sql = "DELETE FROM `product_discount` WHERE id NOT IN (".$ids.") AND product_id = ".$last_id;

            $this->db->query($sql);

        }else{

            $sql = "DELETE FROM `product_discount` WHERE product_id = ".$last_id;

            $this->db->query($sql);

        }

            return 'success';

        

        }

        else

        {

            return 'failed';

        }

    }
	function getDriverId(){
		$this->db->select('*');
        $this->db->from('tbl_drivers_master');
		$this->db->order_by('id','desc'); 	
		$this->db->limit(1);				
		$query = $this->db->get();
		return $result = $query->row(); 
	}
	function getStoreId(){
		$this->db->select('*');
        $this->db->from('tbl_stores_master');
		$this->db->order_by('id','desc'); 	
		$this->db->limit(1);				
		$query = $this->db->get();
		return $result = $query->row(); 
	}
	public function saveVendorInfo($table,$postDetailes){
		if($postDetailes['percentage_of_cost'] != ""){
			$postDetailes['percentage_of_cost'] = $postDetailes['percentage_of_cost'];
		}else{
			$postDetailes['percentage_of_cost'] = 0;
		}
		if($postDetailes['default_cost'] != ""){
			$postDetailes['default_cost'] = $postDetailes['default_cost'];
		}else{
			$postDetailes['default_cost'] = 0;
		}
		if(isset($postDetailes['hid_storeid'])){
			$dataa = array(
				'store_name'                     =>  $postDetailes['store_name'],
				'first_name'                     =>  $postDetailes['first_name'],
				'last_name'                      =>  $postDetailes['last_name'],
				'store_person_email'             =>  $postDetailes['store_person_email'],
				'postcode'                       =>  $postDetailes['postcode'],
				'store_latitude'                 =>  $postDetailes['store_latitude'],
				'store_longitude'                =>  $postDetailes['store_longitude'],
				'store_phoneid'                  =>  $postDetailes['store_phoneid'],
				'store_address'                  =>  $postDetailes['store_address'],
				'store_des'                  	 =>  $postDetailes['store_des'],
				'store_location'                 =>  $postDetailes['store_location'],
				'store_profile_pic'              =>  $postDetailes['hid_profile_pic'],
				'store_commercial_pic'           =>  $postDetailes['hid_commercial_pic'],
				'shop_open_time'                 =>  $postDetailes['shop_open_time'],
				'shop_close_time'                =>  $postDetailes['shop_close_time'],
				'normal_type_of_cost'            =>  $postDetailes['normal_type_of_cost'],
				'percentage_of_cost'             =>  $postDetailes['percentage_of_cost'],
				'default_cost'                	 =>  $postDetailes['default_cost'],
				'normal_pickup_hours'            =>  $postDetailes['normal_pickup_hours'],
				'normal_delivery_days'           =>  $postDetailes['normal_delivery_days'],
				'modified_date_time'             =>  date('Y-m-d H:i:s'),
			);
			$this->db->where('id',$postDetailes['hid_storeid']);
			if ($this->db->update($table,$dataa) === FALSE){
				return 0;
			}else{
				return 1;
			}
		}else{
			$geheighstStoreId = $this->getStoreId();
			$me_unique_code = 'LND_STO'.str_pad((int)($geheighstStoreId->id+1), 3, "0", STR_PAD_LEFT);
			$dataa = array(
				'type'							 =>  'V',
				'division_id'                    =>  '0',
				'store_unique_id'                =>  $me_unique_code,
				'store_name'                     =>  $postDetailes['store_name'],
				'first_name'                     =>  $postDetailes['first_name'],
				'last_name'                      =>  $postDetailes['last_name'],
				'store_person_email'             =>  $postDetailes['store_person_email'],
				'postcode'                       =>  $postDetailes['postcode'],
				'store_latitude'                 =>  $postDetailes['store_latitude'],
				'store_longitude'                =>  $postDetailes['store_longitude'],
				'store_phoneid'                  =>  $postDetailes['store_phoneid'],
				'store_address'                  =>  $postDetailes['store_address'],
				'store_des'                  	 =>  $postDetailes['store_des'],
				'store_location'                 =>  $postDetailes['store_location'],
				'store_profile_pic'              =>  $postDetailes['hid_profile_pic'],
				'store_commercial_pic'           =>  $postDetailes['hid_commercial_pic'],
				'shop_open_time'                 =>  $postDetailes['shop_open_time'],
				'shop_close_time'                =>  $postDetailes['shop_close_time'],
				'normal_pickup_hours'            =>  $postDetailes['normal_pickup_hours'],
				'normal_delivery_days'           =>  $postDetailes['normal_delivery_days'],
				'normal_type_of_cost'            =>  $postDetailes['normal_type_of_cost'],
				'percentage_of_cost'             =>  $postDetailes['percentage_of_cost'],
				'default_cost'                	 =>  $postDetailes['default_cost'],
				'created_date_time'              =>  date('Y-m-d H:i:s'),
				'modified_date_time'             =>  date('Y-m-d H:i:s'),
			);
			if($this->db->insert($table, $dataa) === FALSE){                
				return 0;
			}else{
				return $this->db->insert_id();
			}
		}
	}
	
	public function saveLoginInfo($table,$storeId){
		$dataa = array(
			'store_id'             =>  $storeId,
			'password'             =>  md5('vclean4u123'),
			'email_verification_key' => md5('$storeId'),
			'account_status'       =>  "A",
		);
		if($this->db->insert($table, $dataa) === FALSE){                
			return 0;
		}else{
			return $this->db->insert_id();
		}
	}
	public function saveShopDetailes($table,$postdetailes,$storeId){
		
		if(isset($postdetailes['isitholiday_sunday'])){
			$postdetailes['isitholiday_sunday'] = 1;
		}else{
			$postdetailes['isitholiday_sunday'] = 0;
		}
		if(isset($postdetailes['isitholiday_monday'])){
			$postdetailes['isitholiday_monday'] = 1;
		}else{
			$postdetailes['isitholiday_monday'] = 0;
		}
		
		if(isset($postdetailes['isitholiday_tuesday'])){
			$postdetailes['isitholiday_tuesday'] = 1;
		}else{
			$postdetailes['isitholiday_tuesday'] = 0;
		}
		if(isset($postdetailes['isitholiday_wednesday'])){
			$postdetailes['isitholiday_wednesday'] = 1;
		}else{
			$postdetailes['isitholiday_wednesday'] = 0;
		}
		if(isset($postdetailes['isitholiday_thrusday'])){
			$postdetailes['isitholiday_thrusday'] = 1;
		}else{
			$postdetailes['isitholiday_thrusday'] = 0;
		}
		if(isset($postdetailes['isitholiday_firday'])){
			$postdetailes['isitholiday_firday'] = 1;
		}else{
			$postdetailes['isitholiday_firday'] = 0;
		}
		if(isset($postdetailes['isitholiday_saturday'])){
			$postdetailes['isitholiday_saturday'] = 1;
		}else{
			$postdetailes['isitholiday_saturday'] = 0;
		}
		
		$dataa =array(
			'sst_store_id'					=> $storeId,
			'sst_open_time'	                => $postdetailes['shop_open_time'],
			'sst_close_time'                => $postdetailes['shop_close_time'],
			'sst_sunday_open_time'          => $postdetailes['store_sunday_otimings'],
			'sst_sunday_close_time'         => $postdetailes['store_sunday_ctimings'],
			'sst_sunday_holiday'            => $postdetailes['isitholiday_sunday'],
			'sst_monday_open_time'          => $postdetailes['store_monday_otimings'],
			'sst_monday_close_time'         => $postdetailes['store_monday_ctimings'],
			'sst_monday_holiday'            => $postdetailes['isitholiday_monday'],
			'sst_tuesday_open_time'         => $postdetailes['store_tuesday_otimings'],
			'sst_tuesday_close_time'        => $postdetailes['store_tuesday_ctimings'],
			'sst_tuesday_holiday'           => $postdetailes['isitholiday_tuesday'],
			'sst_wednesday_open_time'       => $postdetailes['store_wednesday_otimings'],
			'sst_wednesday_close_time'      => $postdetailes['store_wednesday_ctimings'],
			'sst_wednesday_holiday'         => $postdetailes['isitholiday_wednesday'],
			'sst_thrusday_open_time'        => $postdetailes['store_thrusday_otimings'],
			'sst_thrusday_close_time'       => $postdetailes['store_thrusday_ctimings'],
			'sst_thrusday_holiday'          => $postdetailes['isitholiday_thrusday'],
			'sst_friday_open_time'          => $postdetailes['store_firday_otimings'],
			'sst_friday_close_time'         => $postdetailes['store_firday_ctimings'],
			'sst_friday_holiday'            => $postdetailes['isitholiday_firday'],
			'sst_saturday_open_time'        => $postdetailes['store_saturday_otimings'],
			'sst_saturday_close_time'       => $postdetailes['store_saturday_ctimings'],
			'sst_saturday_holiday'          => $postdetailes['isitholiday_saturday'],
			'sst_created_at'                => date('Y-m-d H:i:s'),
			'sst_updated_at'                => date('Y-m-d H:i:s'),
			'sst_status'                    => 1,
		);
		if($this->db->insert($table, $dataa) === FALSE){                
			return 0;
		}else{
			return $this->db->insert_id();
		}
	}

	public function saveHolidayDetailes($table,$holiday,$reason,$storeId){
		$holidayDate = null;
		if($holiday != ""){
			$holidayDate = date('Y-m-d',strtotime($holiday));
		}
		$dataa =array(
			'shl_store_id'		 => $storeId,
			'shl_holiday_date'	 => $holidayDate,
			'shl_holiday_reason' => $reason,
			'shl_created_at'     => date('Y-m-d H:i:s'),
			'shl_updated_at'     => date('Y-m-d H:i:s'),
			'shl_status'         => 1,
		);
		if($this->db->insert($table, $dataa) === FALSE){                
			return 0;
		}else{
			return $this->db->insert_id();
		}
	}
	
	public function saveExpressDetailes($table,$picHour,$deliHour,$perCost,$defaultcost,$storeId,$per_of_type){
		if($perCost != ""){
			$perCost = $perCost;
		}else{
			$perCost = 0;
		}
		if($defaultcost != ""){
			$defaultcost = $defaultcost;
		}else{
			$defaultcost = 0;
		}
		$dataa =array(
			'set_store_id'				=> $storeId,
			'set_pickup_hour'           => $picHour,
			'set_delivery_hour'         => $deliHour,
			'set_percentage_of_cost'    => $perCost,
			'set_default_cost'          => $defaultcost,
			'set_type_of_cost'          => $per_of_type,
			'set_created_at'            => date('Y-m-d H:i:s'),
			'set_updated_at'            => date('Y-m-d H:i:s'),
			'set_status'                => 1,
		);
		if($this->db->insert($table, $dataa) === FALSE){                
			return 0;
		}else{
			return $this->db->insert_id();
		}
	}
	public function updateHolidayDate($table,$holidatedate,$storeId){
		$dataa['modified_date_time'] =  date('Y-m-d H:i:s');
		$dataa['holidays_list'] =  $holidatedate;
		$this->db->where('id',$storeId);
		if ($this->db->update($table,$dataa) === FALSE){
			return 0;
		}else{
			return 1;
		}
	}
	public function updateExpressInfo($table,$picHour,$deliHour,$perCost,$defaultcost,$storeId){
		$dataa['modified_date_time']         =  date('Y-m-d H:i:s');
		$dataa['express_minimum_hours']      =  $picHour;
		$dataa['express_pickup_time']        =  $deliHour;
		$dataa['express_percentage_of_cost'] =  $perCost;
		$dataa['express_default_cost']       =  $defaultcost;
		$this->db->where('id',$storeId);
		if ($this->db->update($table,$dataa) === FALSE){
			return 0;
		}else{
			return 1;
		}
	}
	public function deleteVendorInfo($table,$storeId,$deleteType){
		if($deleteType == 1){
			$this->db->where('id',$storeId);
		}else if($deleteType == 2){
			$this->db->where('sst_store_id',$storeId);
		}else if($deleteType == 3){
			$this->db->where('shl_store_id',$storeId);
		}else if($deleteType == 4){
			$this->db->where('set_store_id',$storeId);
		}
		if($this->db->delete($table)){
		   return $st = 1;
		}else{
			return $st = 0;
		}
	}
	/* Save Driver information */
	public function saveDriverInfo($table,$postDetailes){
		ini_set('display_errors',1);
		if(isset($postDetailes['hid_driverid'])){
			$dataa = array(
				'name'                              => $postDetailes['name'],
				'email'                             => $postDetailes['email'],
				'address'                           => $postDetailes['address'],
				'mobile'                            => $postDetailes['mobilenumber'],
				'postcode'                          => $postDetailes['postcode'],
				'alternate_mobile'                  => $postDetailes['altermobilenumber'],
				'cab_type'                          => $postDetailes['vehicletype'],
				'cab_number'                        => $postDetailes['vehiclenum'],
				'car_model'                         => $postDetailes['vehiclemodal'],
				'car_color'                         => $postDetailes['vehiclecolor'],
			);
			$this->db->where('id',$postDetailes['hid_driverid']);
			if ($this->db->update($table,$dataa) === FALSE){
				return 0;
			}else{
				return 1;
			}
		}else{
			$geheighstDrId = $this->getDriverId();
			// $me_unique_code = 'MM_DR'.str_pad((int)($geheighstDrId->id+1), 5, "0", STR_PAD_LEFT);
			$me_unique_code = 'MM_DR00'.(int)($geheighstDrId->id+1);
			$dataa = array(
				'unique_id'							=> $me_unique_code,
				'name'                              => $postDetailes['name'],
				'email'                             => $postDetailes['email'],
				'password'                          => md5('vcleandriver4u123'),
				'address'                           => $postDetailes['address'],
				'postcode'                          => $postDetailes['postcode'],
				'mobile'                            => $postDetailes['mobilenumber'],
				'alternate_mobile'                  => $postDetailes['altermobilenumber'],
				'cab_type'                          => $postDetailes['vehicletype'],
				'cab_number'                        => $postDetailes['vehiclenum'],
				'car_model'                         => $postDetailes['vehiclemodal'],
				'car_color'                         => $postDetailes['vehiclecolor'],
				'rest_verification_key'             => md5($me_unique_code),
				'driver_status'						=> 1,
				'created_at'						=> date('Y-m-d H:i:s'),
			);
			if($this->db->insert($table, $dataa) === FALSE){                
				return 0;
			}else{
				return $this->db->insert_id();
			}
		}
	}
	/* Driver Timings  */
	public function saveDriverAvailableTimings($table,$postDetailes,$driverId){
		$this->db->where('dat_driver_id',$driverId);
		if($this->db->delete($table)){
		   $status = 1;
		}else{
			$status = 0;
		}
		if($status != 0){
			$sunday = 0;
			$monday = 0;
			$tuesday = 0;
			$wednesday = 0;
			$thrusday = 0;
			$friday = 0;
			$saturday = 0;
			$days = array();
			$times = array();
			if(isset($postDetailes['sunday'])){
				$sunday  = 1;
				array_push($days,'sunday');
				array_push($times,$postDetailes['sundaytime']);
			}
			if(isset($postDetailes['monday'])){
				$monday = 1;
				array_push($days,'monday');
				array_push($times,$postDetailes['mondaytime']);
			}
			if(isset($postDetailes['tuesday'])){
				$tuesday = 1;
				array_push($days,'tuesday');
				array_push($times,$postDetailes['tuesdaytime']);
			}
			if(isset($postDetailes['wednesday'])){
				$wednesday = 1;
				array_push($days,'wednesday');
				array_push($times,$postDetailes['wednesdaytime']);
			}
			if(isset($postDetailes['thrusday'])){
				$thrusday = 1;
				array_push($days,'thrusday');
				array_push($times,$postDetailes['thrusdaytime']);
			}
			if(isset($postDetailes['friday'])){
				$friday = 1;
				array_push($days,'friday');
				array_push($times,$postDetailes['fridaytime']);
			}
			if(isset($postDetailes['saturday'])){
				$saturday = 1;
				array_push($days,'saturday');
				array_push($times,$postDetailes['saturdaytime']);
			}
			if(!empty($days)){
				$avaDay = "";
				$avaTim = "";
				foreach($days as $key => $day){
					$avaDay .= $day.',';
					$avaTim .= $times[$key].',';
				}
				$data['available_days'] =  rtrim($avaDay,',');
				$data['available_timeframes'] =  rtrim($avaTim,',');
				$this->db->where('id',$driverId);
				$this->db->update('tbl_drivers_master',$data);
					
			}
			$dataa = array(
				'dat_driver_id'					   => $driverId,
				'dat_sunday_available'             => $sunday,
				'dat_sunday_time'                  => $postDetailes['sundaytime'],
				'dat_monday_available'             => $monday,
				'dat_monday_time'                  => $postDetailes['mondaytime'],
				'dat_tuesday_available'            => $tuesday,
				'dat_tuesday_time'                 => $postDetailes['tuesdaytime'],
				'dat_wednesday_available'          => $wednesday,
				'dat_wednesday_time'               => $postDetailes['wednesdaytime'],
				'dat_thrusday_available'           => $thrusday,
				'dat_thrusday_time'                => $postDetailes['thrusdaytime'],
				'dat_friday_available'             => $friday,
				'dat_friday_time'                  => $postDetailes['fridaytime'],
				'dat_saturday_available'           => $saturday,
				'dat_saturday_time'                => $postDetailes['saturdaytime'],
				'dat_created_at'                   => date('Y-m-d H:i:s'),
				'dat_updated_at'                   => date('Y-m-d H:i:s'),
				'dat_status'                       => 1,
			);
			if($this->db->insert($table, $dataa) === FALSE){                
				return 0;
			}else{
				return $this->db->insert_id();
			}
		}
	}
	function checkEmailPhone($emailmobile,$checktype,$hidid){
		$this->db->select('*');
        $this->db->from('tbl_drivers_master');
		if($checktype == 1){
			$this->db->where('email',$emailmobile); 	
		}else{
			$this->db->where('mobile',$emailmobile);
		}		
		if($hidid != 0){
			$this->db->where('id !=',$hidid);
		}
		$query = $this->db->get();
		return $result = $query->result(); 
	}
	function getDriverInfo($table,$driverId){
		$this->db->select('*');
        $this->db->from($table);
		$this->db->join('tbl_driver_available_timings','tbl_driver_available_timings.dat_driver_id = id','LEFT');
		$this->db->where('id',$driverId); 	
		$this->db->where('driver_status',1); 	
		$query = $this->db->get();
		return $result = $query->row(); 
	}
	function updateDriverImage($table,$imageName,$driverId,$uploadType){
		if($uploadType == 1){
			$data['profile_pic'] =  $imageName;
		}else if($uploadType == 2){
			$data['pancard'] 	=  $imageName;
		}else if($uploadType == 3){
			$data['driving_license'] =  $imageName;
		}
		$this->db->where('id',$driverId);
		$this->db->update('tbl_drivers_master',$data);
	}
	function updateDriverStatus($table,$postdetailes){
		if($postdetailes['updatetable'] == "driver"){
			$data['driver_status'] =  $postdetailes['drivertype'];
			$this->db->where('id',$postdetailes['driverId']);
			$this->db->update('tbl_drivers_master',$data);
		}else{
			if($postdetailes['drivertype'] == 0){
				$postdetailes['drivertype'] = "I";
			}else if($postdetailes['drivertype'] == 1){
				$postdetailes['drivertype'] = "A";
			}else{
				$postdetailes['drivertype'] = "D";
			}
			$data['account_status'] =  $postdetailes['drivertype'];
			$this->db->where('store_id',$postdetailes['vendorId']);
			$this->db->update('tbl_stores_logininfo_master',$data);
		}
	}
	function getVendorsList($table,$postdetailes){
		$this->db->select('*');
        $this->db->from($table);
		$this->db->where('postcode',$postdetailes['postcode']); 	
		$query = $this->db->get();
		return $result = $query->result(); 
	}
	function getAssVendorsList($table,$postdetailes){
		$this->db->select('*');
        $this->db->from($table);
		$this->db->where('driver_id',md5($postdetailes['driverId'])); 	
		$query = $this->db->get();
		return $result = $query->result(); 
	}
	function getAssVendors($table,$driverid){
		$this->db->select('*');
        $this->db->from($table);
		$this->db->join('tbl_stores_logininfo_master','tbl_stores_logininfo_master.email_verification_key = vendor_id','LEFT');
		$this->db->join('tbl_stores_master','tbl_stores_master.id = tbl_stores_logininfo_master.store_id','LEFT');
		$this->db->where('driver_id',md5($driverid)); 	
		$query = $this->db->get();
		return $result = $query->result(); 
	}
	public function saveVenList($table,$postDetailes){
		$this->db->where('driver_id',md5($postDetailes['driverId']));
		if($this->db->delete($table)){
		   $status = 1;
		}else{
			$status = 0;
		}
		if($status != 0){
			foreach($postDetailes['venList'] as $vendorId){
				$dataa = array(
					'vendor_id'		=> md5($vendorId),
					'driver_id'		=> md5($postDetailes['driverId']),
					'created_at'	=> date('Y-m-d H:i:s'),
					'status'    	=> 1,
				);
				if($this->db->insert($table, $dataa) === FALSE){                
					
				}else{
					
				}
			}
			return $this->db->insert_id();
		}
	}
}