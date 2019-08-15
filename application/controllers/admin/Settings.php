<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Settings extends MY_Controller {
    function __construct() {
		parent::__construct();
		$this->login_required();
		$this->load->model('admin/Settings_model');
		$this->load->model('admin/Common_model');
    }
	public function index()
	{
		$this->admin_view('settings');
	}

	function admin_settings(){
		if($this->input->get_post('submit')){
			if($this->input->get_post('password') !=''){
				$data1=array(
					'username'=>$this->input->get_post('username'),
					'password'=>md5($this->input->get_post('password')),
					'email'=>$this->input->get_post('email')
				);
			}else{
				$data1=array(
					'username'=>$this->input->get_post('username'),
					'email'=>$this->input->get_post('email')
				);
			}
			$id = $this->input->get_post('id');
			$result = $this->Common_model->update('tbl_admin_users_master',$data1,$id);
			if($result){
				$_SESSION['username'] = $this->input->get_post('username');
				$_SESSION['email']    = $this->input->get_post('email');
				$this->session->set_flashdata('success_message', '"Admin settings updated successfully","Success"');
				redirect(base_url().'admin/settings/admin_settings');
			}else{
				$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');
				redirect(base_url().'admin/settings/admin_settings');	
			}
		}
		$this->data['page_title']='Admin Settings';
		$this->data['page']='admin_setting';
		$this->data['details']=$this->Common_model->get_data('tbl_admin_users_master');
		$this->admin_view('admin_setting');
	}
	
	public function product_lists(){
		if(isset($_GET["catid"]) && $_GET["catid"]!=""){
			$id = $_GET["catid"];
		}else{
			$id ="";
		}
		$this->data['page_title']='Product Items';
		$this->data['page']='product_lists';
		$this->data['details']=$this->Common_model->get_data_items('tbl_products',$id);
		$this->data['cat_details']=$this->Common_model->get_data_cats('tbl_product_categories');
		$this->admin_view('product_lists');
	}
	public function categories_list(){
		$this->data['page_title']='Product Categories';
		$this->data['page']='categories_list';
		$this->data['details']=$this->Common_model->get_data('tbl_product_categories');
		$this->admin_view('categories_list');
	}
	public function product_Item_actions($id,$type){
		if($id){
			$result = $this->Common_model->product_Item_actions($id,$type);
			if($result){
				$this->session->set_flashdata('success_message','"Status Changed Successfully","Success"');
				echo '<script>window.history.go(-1)</script>';
			}else{
				$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');
				echo '<script>window.history.go(-1)</script>';
			}
		}else{
			$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');
			echo '<script>window.history.go(-1)</script>';
		}		
	}
	public function category_actions($id,$type){
		if($id){
			$result = $this->Common_model->category_actions($id,$type);
			if($result){
				$this->session->set_flashdata('success_message','"Status Changed Successfully","Success"');
				echo '<script>window.history.go(-1)</script>';
			}else{
				$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');
				echo '<script>window.history.go(-1)</script>';
			}
		}else{
			$this->session->set_flashdata('error_message', '"Please try again later.","Failed!"');
			echo '<script>window.history.go(-1)</script>';
		}		
	}
	public function edit_category(){
		if(isset($_POST['category_name']) && $_POST['category_name']!=""){
			$error = 1;
			if(isset($_FILES['file']['name']) && $_FILES['file']['name'] != ''){
				$catimgg = date('dmYHis').str_replace(" ", "", basename($_FILES['file']['name']));
				$catimg = '../product_images/'.$catimgg;
				if(move_uploaded_file($_FILES['file']['tmp_name'],$catimg)){
					$error = 1;
				}else{
					$error = 0;
				}
			}else if(isset($_POST['h_catimg']) && $_POST['h_catimg']!=""){
				$catimgg = $_POST['h_catimg'];
			}
			$error1 = 1;
			if(isset($_FILES['file1']['name']) && $_FILES['file1']['name'] != ''){
				$catthumbimgg = date('dmYHis').str_replace(" ", "", basename($_FILES['file1']['name']));
				$catthumbimg = '../product_images/'.$catthumbimgg;
				if(move_uploaded_file($_FILES['file1']['tmp_name'],$catthumbimg)){
					$error1 = 1;
				}else{
					$error1 = 0;
				}			
			}else if(isset($_POST['h_catthumbimg']) && $_POST['h_catthumbimg']!=""){
				$catthumbimgg = $_POST['h_catthumbimg'];
			}
			$cateInserted = $this->Common_model->updatedInsertedCategory($_POST,$catimgg,$catthumbimgg);
			if($cateInserted){
				if(isset($_POST['h_cat_id']) && $_POST['h_cat_id']!=""){					
					$this->session->set_flashdata('success_message', '"Product Category updated successfully","Success"');
				}else{
					$category_ref_id = 'CAT_0'.$cateInserted;
					$category_ref_id = $this->Common_model->updatedInsertedcategory_ref_id($cateInserted,$category_ref_id);
					$this->session->set_flashdata('success_message', '"Product Category inserted successfully","Success"');
				}				
				redirect(base_url().'admin/settings/categories_list');
			}
		}else{
			$this->data['page_title']='Edit Category';
			$this->data['page']='edit_category';
			if(isset($_GET['id']) && $_GET['id']!=""){
				$cat_id = $_GET['id'];
			}
			$this->data['catdetails']=$this->Common_model->getCategory_details('tbl_product_categories',$cat_id);
			$this->admin_view('edit-category');
		}
	}
	public function getaddresses(){
		ini_set('display_errors',1);
		$postcode = $_POST['postalCode'];
		// $postcode = $_GET['postcode']; //ID1 1QD,  GU5 0BD
		$api_key  = "iddqd";
		$base_url = "https://api.ideal-postcodes.co.uk/v1/postcodes/";
		$url      = $base_url . rawurlencode($postcode) . "?api_key=" . $api_key;
		$ch       = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$response = json_decode(curl_exec($ch), true);
		curl_close($ch);
		$addresses = $response["result"];	
		// echo "<pre>"; print_r($addresses); exit;
		// print_r($addresses); exit;
		$response['addresses'] = array();	
		foreach($addresses as $addr){
			$track = array(); 
			$track['postcode'] = $addr['postcode'];
			$track['postcode_inward'] = $addr['postcode_inward'];
			$track['postcode_outward'] = $addr['postcode_outward'];
			$track['post_town'] = $addr['post_town'];
			$track['thoroughfare'] = $addr['thoroughfare'];
			$track['building_name'] = $addr['building_name'];
			$track['udprn'] = $addr['udprn'];
			$track['postcode_type'] = $addr['postcode_type'];
			$track['delivery_point_suffix'] = $addr['delivery_point_suffix'];
			$track['line_1'] = $addr['line_1'];
			$track['line_2'] = $addr['line_2'];
			$track['line_3'] = $addr['line_3'];
			$track['premise'] = $addr['premise'];
			$track['longitude'] = $addr['longitude'];
			$track['latitude'] = $addr['latitude'];
			$track['eastings'] = $addr['eastings'];
			$track['northings'] = $addr['northings'];
			$track['country'] = $addr['country'];
			$track['traditional_county'] = $addr['traditional_county'];
			$track['administrative_county'] = $addr['administrative_county'];
			$track['postal_county'] = $addr['postal_county'];
			$track['county'] = $addr['county'];
			$track['district'] = $addr['district'];
			$track['ward'] = $addr['ward'];
			$track['dependant_locality'] = $addr['dependant_locality'];
			array_push($response['addresses'],$track);
		}
		
		// echo "<pre>"; print_r($response['addresses']); exit;
			// $response['addresses'] = array();	
		// $response['addresses']['line_1'] = 'Flat 19';
        // $response['addresses']['line_2'] = 'The Beeches';
        // $response['addresses']['line_3'] = 'Horsham Road, Bramley';
        // $response['addresses']['premise'] = 'Flat 19, The Beeches';
		 
		$l1 = "";
		$l2 = "";
		$l3 = "";
		$l4 = "";
		if($track['line_1'] != "" && $track['line_2'] != ""){
			$l1 = $track['line_1'];
		}
		if($track['line_2'] != ""){
			$l2 = ','.$track['line_2'];
		}
		if($track['line_3'] != ""){
			$l3 = ','.$track['line_3'];
		}
		if($track['premise'] != ""){
			$l4 = ','.$track['premise'];
		}
        $store_address = $l1.$l2.$l3.$l4;
        // $response['addresses']['longitude'] = '-0.560776';
        // $response['addresses']['latitude'] = '51.195498';
        // $response['addresses']['dependant_locality'] = 'Bramley';
		echo json_encode(array('output' =>'sucess','lattitude' => $track['latitude'],'longitude' => $track['longitude'],'address'=>  $store_address,'location' =>  $track['dependant_locality']));
	}
	
	public function add_category(){
		if(isset($_POST['category_name']) && $_POST['category_name']!=""){
			$error = 1;
			if(isset($_FILES['file']['name']) && $_FILES['file']['name'] != ''){
				$catimgg = date('dmYHis').str_replace(" ", "", basename($_FILES['file']['name']));
				$catimg = '../product_images/'.$catimgg;
				if(move_uploaded_file($_FILES['file']['tmp_name'],$catimg)){
					$error = 1;
				}else{
					$error = 0;
				}
			}
			$error1 = 1;
			if(isset($_FILES['file1']['name']) && $_FILES['file1']['name'] != ''){
				$catthumbimgg = date('dmYHis').str_replace(" ", "", basename($_FILES['file1']['name']));
				$catthumbimg = '../product_images/'.$catthumbimgg;
				if(move_uploaded_file($_FILES['file1']['tmp_name'],$catthumbimg)){
					$error1 = 1;
				}else{
					$error1 = 0;
				}			
			}
			$cateInserted = $this->Common_model->updatedInsertedCategory($_POST,$catimgg,$catthumbimgg);
			if($cateInserted){
				if(isset($_POST['h_cat_id']) && $_POST['h_cat_id']!=""){					
					$this->session->set_flashdata('success_message', '"Product Category updated successfully","Success"');
				}else{
					$category_ref_id = 'CAT_0'.$cateInserted;
					$category_ref_id = $this->Common_model->updatedInsertedcategory_ref_id($cateInserted,$category_ref_id);
					$this->session->set_flashdata('success_message', '"Product Category inserted successfully","Success"');
				}				
				redirect(base_url().'admin/settings/categories_list');
			}
		}else{
			$this->data['page_title']='Add Category';
			$this->data['page']='add_category';
			$this->data['details']=$this->Common_model->get_data('tbl_product_categories');
			$this->admin_view('add-category');
		}
	}
	public function add_product(){
		if(isset($_POST['category_id']) && $_POST['category_id']!=""){
			$error = 1;
			if(isset($_FILES['product_image']['name']) && $_FILES['product_image']['name'] != ''){
				$product_image = date('dmYHis').str_replace(" ", "", basename($_FILES['product_image']['name']));
				$productimage = '../product_images/'.$product_image;
				if(move_uploaded_file($_FILES['product_image']['tmp_name'],$productimage)){
					$error = 1;
				}else{
					$error = 0;
				}
			}
			$error1 = 1;
			if(isset($_FILES['product_thumb_image']['name']) && $_FILES['product_thumb_image']['name'] != ''){
				$product_thumb_image = date('dmYHis').str_replace(" ", "", basename($_FILES['product_thumb_image']['name']));
				$productthumbimage = '../product_images/'.$product_thumb_image;
				if(move_uploaded_file($_FILES['product_thumb_image']['tmp_name'],$productthumbimage)){
					$error1 = 1;
				}else{
					$error1 = 0;
				}			
			}
			$cateInserted = $this->Common_model->updatedInsertedProductItem($_POST,$product_image,$product_thumb_image);
			if($cateInserted){
				if(isset($_POST['h_prdid']) && $_POST['h_prdid']!=""){	
					$cateInserted = $_POST['h_prdid'];
					$itemInsertedPname = $this->Common_model->item_inserted_images($cateInserted,$product_image,$product_thumb_image);
					$this->session->set_flashdata('success_message', '"Product Item updated successfully","Success"');
				}else{	
					$itemInsertedPname = $this->Common_model->item_inserted_images($cateInserted,$product_image,$product_thumb_image);
					$this->session->set_flashdata('success_message', '"Product Item inserted successfully","Success"');
				}				
				redirect(base_url().'admin/settings/product_lists');
			}
		}else{
			$this->data['page_title']='Add Product Item';
			$this->data['page']='add_product';
			$this->data['cat_details']=$this->Common_model->get_data_cats('tbl_product_categories');
			$this->admin_view('add-product');
		}
	}
	public function edit_product(){
		if(isset($_POST['category_id']) && $_POST['category_id']!=""){
			$error = 1;
			if(isset($_FILES['product_image']['name']) && $_FILES['product_image']['name'] != ''){
				$product_image = date('dmYHis').str_replace(" ", "", basename($_FILES['product_image']['name']));
				$productimage = '../product_images/'.$product_image;
				if(move_uploaded_file($_FILES['product_image']['tmp_name'],$productimage)){
					$error = 1;
				}else{
					$error = 0;
				}
			}
			$error1 = 1;
			if(isset($_FILES['product_thumb_image']['name']) && $_FILES['product_thumb_image']['name'] != ''){
				$product_thumb_image = date('dmYHis').str_replace(" ", "", basename($_FILES['product_thumb_image']['name']));
				$productthumbimage = '../product_images/'.$product_thumb_image;
				if(move_uploaded_file($_FILES['product_thumb_image']['tmp_name'],$productthumbimage)){
					$error1 = 1;
				}else{
					$error1 = 0;
				}			
			}
			$cateInserted = $this->Common_model->updatedInsertedProductItem($_POST,$product_image,$product_thumb_image);
			if($cateInserted){
				if(isset($_POST['h_prdid']) && $_POST['h_prdid']!=""){	
					$cateInserted = $_POST['h_prdid'];
					$itemInsertedPname = $this->Common_model->item_inserted_images($cateInserted,$product_image,$product_thumb_image);
					$this->session->set_flashdata('success_message', '"Product Item updated successfully","Success"');
				}else{	
					$itemInsertedPname = $this->Common_model->item_inserted_images($cateInserted,$product_image,$product_thumb_image);
					$this->session->set_flashdata('success_message', '"Product Item inserted successfully","Success"');
				}				
				redirect(base_url().'admin/settings/product_lists');
			}
		}else{
			$this->data['page_title']='Edit Product Item';
			$this->data['page']='edit_product';
			if(isset($_GET['id']) && $_GET['id']!=""){
				$prdid = $_GET['id'];
			}
			$this->data['itemdetails']=$this->Common_model->getItem_details('tbl_products',$prdid);
			$this->data['cat_details']=$this->Common_model->get_data_cats('tbl_product_categories');
			$this->admin_view('edit-product');
		}
	}
	public function drivers_list(){
		ini_set('display_errors',1);
		$this->data['page_title']='Drivers List';
		$this->data['page']='drivers_list';
		$this->data['driverList']=$this->Common_model->get_drivers_data('tbl_drivers_master');
		$assVen = array();
		if(count($this->data['driverList']) > 0){
			foreach($this->data['driverList'] as $driverlist){
				$getAssVen = $this->Common_model->getAssVendors('tbl_vendor_drivers',$driverlist->id);
				if(count($getAssVen) > 0 ){
					$name = "";
					foreach($getAssVen as $vendName){
						$name .= $vendName->store_unique_id.'-'.$vendName->first_name.',';
					}
					if($name != ""){
						$assVen[$driverlist->id] =  rtrim($name,',');
					}
				}
			}
		}
		// print_r($assVen); exit;
		$this->data['assVen']= $assVen;
		$this->admin_view('drivers-list');
	}
	public function checkemailphone(){
		if(isset($_POST['hid_driverid'])){
			$_POST['hid_driverid'] = $_POST['hid_driverid'];
		}else{
			$_POST['hid_driverid'] = 0;
		}
		$checkEmail = $this->Common_model->checkEmailPhone($_POST['email'],1,$_POST['hid_driverid']);
		$checkPhone = $this->Common_model->checkEmailPhone($_POST['mobilenumber'],2,$_POST['hid_driverid']);
		if(count($checkEmail) == 0 && count($checkPhone) == 0){
			echo  json_encode(array('output' =>'success','status' => 1));
		}else if(count($checkEmail) > 0 && count($checkPhone) > 0){
			echo  json_encode(array('output' =>'success','status' => 4));
		}else if(count($checkPhone) > 0){
			echo  json_encode(array('output' =>'success','status' => 2));
		}else if(count($checkEmail) > 0){
			echo  json_encode(array('output' =>'success','status' => 3));
		}
	}
	public function add_driver(){
		$this->data['page_title']='Add Driver';
		$this->data['page']='add_driver';
		if(isset($_POST['name'])){
			$driverId = $this->Common_model->saveDriverInfo('tbl_drivers_master',$_POST);
			$profile_pic = ''; 
			if(isset($_FILES['profile_pic']['name']) && $_FILES['profile_pic']['name'] != ''){
				$catimgg = date('dmYHis').'1'.str_replace(" ", "", basename($_FILES['profile_pic']['name']));
				$catimg = './product_images/'.$catimgg;
				if(move_uploaded_file($_FILES['profile_pic']['tmp_name'],$catimg)){
					$profile_pic = $catimgg;
					$this->Common_model->updateDriverImage('tbl_drivers_master',$profile_pic,$driverId,1);
				}
			}
			$pancard  = '';
			if(isset($_FILES['pancard']['name']) && $_FILES['pancard']['name'] != ''){
				$catimgg = date('dmYHis').'2'.str_replace(" ", "", basename($_FILES['pancard']['name']));
				$catimg = './product_images/'.$catimgg;
				if(move_uploaded_file($_FILES['pancard']['tmp_name'],$catimg)){
					$pancard = $catimgg;
					$this->Common_model->updateDriverImage('tbl_drivers_master',$pancard,$driverId,2);
				}
			}
			$drivinglicence  = '';
			if(isset($_FILES['drivinglicence']['name']) && $_FILES['drivinglicence']['name'] != ''){
				$catimgg = date('dmYHis').'3'.str_replace(" ", "", basename($_FILES['drivinglicence']['name']));
				$catimg = './product_images/'.$catimgg;
				if(move_uploaded_file($_FILES['drivinglicence']['tmp_name'],$catimg)){
					$drivinglicence = $catimgg;
					$this->Common_model->updateDriverImage('tbl_drivers_master',$drivinglicence,$driverId,3);
				}
			}
			$this->Common_model->saveDriverAvailableTimings('tbl_driver_available_timings',$_POST,$driverId);
			// echo $driverId; exit;
			redirect(base_url().'admin/settings/drivers_list');
		}else{
			$this->data['timings']= $this->get_times();
			$this->admin_view('add_driver');
		}
		
	}
	public function edit_driver(){
		if(isset($_POST['name'])){
			$driverId = $_POST['hid_driverid'];
			$this->Common_model->saveDriverInfo('tbl_drivers_master',$_POST);
			$profile_pic = ''; 
			if(isset($_FILES['profile_pic']['name']) && $_FILES['profile_pic']['name'] != ''){
				$catimgg = date('dmYHis').'1'.str_replace(" ", "", basename($_FILES['profile_pic']['name']));
				$catimg = './product_images/'.$catimgg;
				if(move_uploaded_file($_FILES['profile_pic']['tmp_name'],$catimg)){
					$profile_pic = $catimgg;
					$this->Common_model->updateDriverImage('tbl_drivers_master',$profile_pic,$driverId,1);
				}
			}
			$pancard  = '';
			if(isset($_FILES['pancard']['name']) && $_FILES['pancard']['name'] != ''){
				$catimgg = date('dmYHis').'2'.str_replace(" ", "", basename($_FILES['pancard']['name']));
				$catimg = './product_images/'.$catimgg;
				if(move_uploaded_file($_FILES['pancard']['tmp_name'],$catimg)){
					$pancard = $catimgg;
					$this->Common_model->updateDriverImage('tbl_drivers_master',$catimgg,$driverId,2);
				}
			}
			$drivinglicence  = '';
			if(isset($_FILES['drivinglicence']['name']) && $_FILES['drivinglicence']['name'] != ''){
				$catimgg = date('dmYHis').'3'.str_replace(" ", "", basename($_FILES['drivinglicence']['name']));
				$catimg = './product_images/'.$catimgg;
				if(move_uploaded_file($_FILES['drivinglicence']['tmp_name'],$catimg)){
					$drivinglicence = $catimgg;
					$this->Common_model->updateDriverImage('tbl_drivers_master',$catimgg,$driverId,3);
				}
			}
			$this->Common_model->saveDriverAvailableTimings('tbl_driver_available_timings',$_POST,$driverId);
			redirect(base_url().'admin/settings/drivers_list');
		}else{
			$driverId = $_GET['id'];
			$driverinfo = $this->Common_model->getDriverInfo('tbl_drivers_master',$driverId);
			if(isset($driverinfo->dat_driver_id)){
				$this->data['sunday']= $this->get_times($driverinfo->dat_sunday_time,'+30 minutes');
				$this->data['monday']= $this->get_times($driverinfo->dat_monday_time,'+30 minutes');
				$this->data['tuesday']= $this->get_times($driverinfo->dat_tuesday_time,'+30 minutes');
				$this->data['wednesday']= $this->get_times($driverinfo->dat_wednesday_time,'+30 minutes');
				$this->data['thrusday']= $this->get_times($driverinfo->dat_thrusday_time,'+30 minutes');
				$this->data['friday']= $this->get_times($driverinfo->dat_friday_time,'+30 minutes');
				$this->data['saturday']= $this->get_times($driverinfo->dat_saturday_time,'+30 minutes');
				
				$this->data['sunchek'] = "";
				$this->data['monchek'] = "";
				$this->data['tuechek'] = "";
				$this->data['wedchek'] = "";
				$this->data['thrchek'] = "";
				$this->data['frichek'] = "";
				$this->data['satchek'] = "";
				
				if($driverinfo->dat_sunday_available == 1){
					$this->data['sunchek'] = "checked";
				}
				if($driverinfo->dat_monday_available == 1){
					$this->data['monchek'] = "checked";
				}
				if($driverinfo->dat_tuesday_available == 1){
					$this->data['tuechek'] = "checked";
				}
				if($driverinfo->dat_wednesday_available == 1){
					$this->data['wedchek'] = "checked";
				}
				if($driverinfo->dat_thrusday_available == 1){
					$this->data['thrchek'] = "checked";
				}
				if($driverinfo->dat_friday_available == 1){
					$this->data['frichek'] = "checked";
				}
				if($driverinfo->dat_saturday_available == 1){
					$this->data['satchek'] = "checked";
				}
			}
			$this->data['page_title']='Edit Driver';
			$this->data['page']='edit_driver';
			$this->data['driverinfo'] = $driverinfo;
			$this->admin_view('edit_driver');
		}
		
	}
	public function vendors_list(){
		$this->data['page_title']='Vendors List';
		$this->data['page']='vendors_list';
		$this->data['vendorsList']=$this->Common_model->get_vendors_data('tbl_stores_master');
		$this->admin_view('vendors-list');
	}
	public function edit_vendor(){
		$storeId = $_GET['id'];
		$this->data['page_title']='Edit Vendor';
		$this->data['page']='edit_vendor';
		$this->data['storeId'] = $storeId;
		
		$this->data['vendorInfo']=$this->Common_model->get_single_vendors_data('tbl_stores_master',$storeId);
		
		$this->data['holidaysList']=$this->Common_model->get_vendors_holidays_list('tbl_store_holidays_list',$storeId);
		$this->data['expressList']=$this->Common_model->get_vendors_express('tbl_store_express_timings',$storeId);
		$this->data['shoptimingsList'] = $this->Common_model->get_vendors_shop_timings('tbl_store_shop_timings',$storeId);
		if(isset($this->data['shoptimingsList']->sst_id)){
			$this->data['storeOpenTime']= $this->get_times($this->data['shoptimingsList']->sst_open_time,'+30 minutes');
			$this->data['StoreCloseTime']= $this->get_times_out($this->data['shoptimingsList']->sst_close_time,'+30 minutes');
			$this->data['storeSundayOpenTime']= $this->get_times($this->data['shoptimingsList']->sst_sunday_open_time,'+30 minutes');
			$this->data['StoreSundayCloseTime']= $this->get_times_out($this->data['shoptimingsList']->sst_sunday_close_time,'+30 minutes');
			$this->data['storeMondayOpenTime']= $this->get_times($this->data['shoptimingsList']->sst_monday_open_time,'+30 minutes');
			$this->data['StoreMondayCloseTime']= $this->get_times_out($this->data['shoptimingsList']->sst_monday_close_time,'+30 minutes');
			$this->data['storeTuesdayOpenTime']= $this->get_times($this->data['shoptimingsList']->sst_tuesday_open_time,'+30 minutes');
			$this->data['StoreTuesdayCloseTime']= $this->get_times_out($this->data['shoptimingsList']->sst_tuesday_close_time,'+30 minutes');
			$this->data['storeWednesdayOpenTime']= $this->get_times($this->data['shoptimingsList']->sst_wednesday_open_time,'+30 minutes');
			$this->data['StoreWednesdayCloseTime']= $this->get_times_out($this->data['shoptimingsList']->sst_wednesday_close_time,'+30 minutes');
			$this->data['storeThrusdayOpenTime']= $this->get_times($this->data['shoptimingsList']->sst_thrusday_open_time,'+30 minutes');
			$this->data['StoreThrusdayCloseTime']= $this->get_times_out($this->data['shoptimingsList']->sst_thrusday_close_time,'+30 minutes');
			$this->data['storeFridayOpenTime']= $this->get_times($this->data['shoptimingsList']->sst_friday_open_time,'+30 minutes');
			$this->data['StoreFridayCloseTime']= $this->get_times_out($this->data['shoptimingsList']->sst_friday_close_time,'+30 minutes');
			$this->data['storeSaturdayOpenTime']= $this->get_times($this->data['shoptimingsList']->sst_saturday_open_time,'+30 minutes');
			$this->data['StoreSaturdayCloseTime']= $this->get_times_out($this->data['shoptimingsList']->sst_saturday_close_time,'+30 minutes');
		}
		$this->admin_view('edit_vendor');
	}
	public function add_vendor(){
		$this->data['page_title']='Add Vendor';
		$this->data['page']='add_vendor';
		$this->data['timings']= $this->get_times();
		$this->data['timingout']= $this->get_times_out();
		$this->admin_view('add_vendor');
	}
	public function saveVendorDetailes(){
		// ini_set('dipslay_errors',1);
		
		if(isset($_POST['hid_storeid'])){
			$this->Common_model->saveVendorInfo('tbl_stores_master',$_POST);
			$this->Common_model->deleteVendorInfo('tbl_store_shop_timings',$_POST['hid_storeid'],2);
			$this->Common_model->deleteVendorInfo('tbl_store_holidays_list',$_POST['hid_storeid'],3);
			$this->Common_model->deleteVendorInfo('tbl_store_express_timings',$_POST['hid_storeid'],4);
			$storeId = $_POST['hid_storeid'];
		}else{
			$storeId = $this->Common_model->saveVendorInfo('tbl_stores_master',$_POST);
		   $this->Common_model->saveLoginInfo('tbl_stores_logininfo_master',$storeId);
		}
		
		if($_POST['shop_open_time'] != ""){
			$this->Common_model->saveShopDetailes('tbl_store_shop_timings',$_POST,$storeId);
		}
		$holidaydate = "";
		if(!empty($_POST['holidaydate'])){
			foreach($_POST['holidaydate'] as $key => $holiday){
				$this->Common_model->saveHolidayDetailes('tbl_store_holidays_list',$holiday,$_POST['reasonforholiday'][$key],$storeId);
				if($holiday != ""){
					$holDate = date('Y-m-d',strtotime($holiday));
					$holidaydate .= $holDate.',';
				}
			}
			if($holidaydate != ""){
				$this->Common_model->updateHolidayDate('tbl_stores_master',rtrim($holidaydate,','),$storeId);
			}
		}
		$expressMin = "";
		$expressPic = "";
		$expressPer = "";
		$expressDefault = "";
		if(!empty($_POST['express_minimum_hours'])){
			foreach($_POST['express_minimum_hours'] as $key => $express){
				
				$this->Common_model->saveExpressDetailes('tbl_store_express_timings',$express,$_POST['express_pickup_time'][$key],$_POST['express_percentage_of_cost'][$key],$_POST['express_default_cost'][$key],$storeId,$_POST['express_percentage_of_type'][$key]);
				if($express != ""){
					$expressMin .= $express.',';
				}
				if($_POST['express_pickup_time'][$key] != ""){
					$expressPic .= $_POST['express_pickup_time'][$key].',';
				}
				if($_POST['express_percentage_of_cost'][$key] != ""){
					$expressPer .= $_POST['express_percentage_of_cost'][$key].',';
				}
				if($_POST['express_default_cost'][$key] != ""){
					$expressDefault .= $_POST['express_default_cost'][$key].',';
				}
			}
			if($holidaydate != ""){
				$this->Common_model->updateExpressInfo('tbl_stores_master',rtrim($expressMin,','),rtrim($expressPic,','),rtrim($expressPer,','),rtrim($expressDefault,','),$storeId);
			}
		}
		echo  json_encode(array('output' =>'success'));
	}
	public function uploadImage(){
		// echo "<pre>"; print_r($_FILES); exit;
		$profile_pic = ''; 
		if(isset($_FILES['profile_pic']['name']) && $_FILES['profile_pic']['name'] != ''){
			$catimgg = date('dmYHis').'1'.str_replace(" ", "", basename($_FILES['profile_pic']['name']));
			$catimg = './product_images/'.$catimgg;
			if(move_uploaded_file($_FILES['profile_pic']['tmp_name'],$catimg)){
				$profile_pic = $catimgg;
			}
		}
		$commercial_pic  = '';
		if(isset($_FILES['commercial_pic']['name']) && $_FILES['commercial_pic']['name'] != ''){
			$catimgg = date('dmYHis').'2'.str_replace(" ", "", basename($_FILES['commercial_pic']['name']));
			$catimg = './product_images/'.$catimgg;
			if(move_uploaded_file($_FILES['commercial_pic']['tmp_name'],$catimg)){
				$commercial_pic = $catimgg;
			}
		}
		echo  json_encode(array('output' =>'success','profile_pic' => $profile_pic,'commercial_pic' => $commercial_pic ));
	}
	function get_times( $default = '07:00', $interval = '+30 minutes' ) {
		$output = '';
		$current = strtotime( '00:00' );
		$end = strtotime( '23:59' );

		while( $current <= $end ) {
			$time = date( 'H:i', $current );
			$sel = ( $time == $default ) ? ' selected' : '';

			$output .= "<option value=\"{$time}\"{$sel}>" . date( 'h.i A', $current ) .'</option>';
			$current = strtotime( $interval, $current );
		}

		return $output;
	}
	
	public function get_times_out( $default = '07:00', $interval = '+30 minutes' ) {
		$output = '';
		$current = strtotime( '00:00' );
		$end = strtotime( '23:59' );
		while( $current <= $end ) {
			$time = date( 'H:i', $current );
			$sel = "";
			
			if(strtotime($time) >= strtotime($default)){
				$output .= "<option value=\"{$time}\"{$sel}>" . date( 'h.i A', $current ) .'</option>';
			}
			$current = strtotime( $interval, $current );
		}
		return $output;
	}
	
	public function checkactions(){
		$this->Common_model->updateDriverStatus('tbl_drivers_master',$_POST);
		echo json_encode(array('output' =>'success'));
	}
	
	public function getVendorsList(){
		$assVenArray = array();
		$venList = $this->Common_model->getVendorsList('tbl_stores_master',$_POST);
		$assvenList = $this->Common_model->getAssVendorsList('tbl_vendor_drivers',$_POST);
		if(count($assvenList) > 0){
			foreach($assvenList as $vList){
				array_push($assVenArray,$vList->vendor_id);
			}
		}
		if(count($venList)>0){
			$options = "";
			$sel = "";
			foreach($venList as $list){
				if(!empty($assVenArray)){
					if(in_array(md5($list->id),$assVenArray)){
						$options .= '<option value="'.$list->id.'"  selected>'.$list->store_unique_id.' - '.$list->first_name.'</option>';
					}else{
						$options .= '<option value="'.$list->id.'" >'.$list->store_unique_id.' - '.$list->first_name.'</option>';
					}
				}else{
					$options .= '<option value="'.$list->id.'" >'.$list->store_unique_id.' - '.$list->first_name.'</option>';
				}
				
			}
			echo json_encode(array('output' =>'success','status' => 1,'options'=>$options));
		}else{
			echo json_encode(array('output' =>'success','status' => 0,'msg' => "Vendors not found."));
		}
	}
	
	public function saveVendorsList(){
		 $this->Common_model->saveVenList('tbl_vendor_drivers',$_POST);
		 echo json_encode(array('output' =>'success'));
	}
}


