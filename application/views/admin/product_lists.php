<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h2><?=$page_title;?></h2>
		<ol class="breadcrumb">
			<li><a href="<?=base_url();?>/admin/dashboard">Dashboard</a></li>
			<li class="active"><strong><?=$page_title;?></strong></li>
		</ol>
    </div>
	<div class="col-lg-2"> </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5><?=$page_title;?></h5>
					<a class="btn btn-primary btn-sm pull-right" href="<?php echo base_url();?>admin/settings/add_product" type="button" style="margin-top: -5px;" >Add Product</a>
                </div>
				<div class="ibox-content">
					<div class=" col-xs-6 col-xs-offset-3">
						<label>Select a Category</label>
						<select class="form-control" onchange="categoryWise(this.value)">
							<option value="">ALL</option>
							<?php if(isset($cat_details) && count($cat_details)>0){ foreach($cat_details as $cats){ $catId = $cats->cat_id; ?>
								<option value="<?php echo $cats->cat_id; ?>" <?php if(isset($_GET['catid']) && $_GET['catid'] == $catId)echo 'selected' ?>><?php echo ucfirst($cats->category_name); ?></option>
							<?php } } ?>
						</select>
                    </div>
					<div class="clearfix"></div><br>
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover dataTables" >
							<thead>
								<tr>
									<th>Sr No.</th>
									<th>Category Name</th>
									<th>Name</th>
									<th>Image</th>
									<th>Thumb Image</th>
									<th>Status</th>
									<th>Manage</th>
								</tr>
							</thead>
							<tbody>
								<?php  $s=0; foreach ($details as $row){ ?>
									<tr>
										<td><?php echo ++$s;?></td>
										<td><?php echo ucfirst($row->category_name); ?></td>
										<td><?php echo ucfirst($row->product_name);?></td>	
										<td>
											<?php												
												if(isset($row->product_image) && $row->product_image!=""){
													$sImage = $row->product_image;
													$sysRoot = $_SERVER["DOCUMENT_ROOT"];
													$sFolderLoc = "/product_images/";
													$thisFileName = $sImage;
													$thisFullName = $sysRoot.$sFolderLoc.$thisFileName;
													if (file_exists($thisFullName)) { $sImage  = $thisFileName; }else{ $sImage  = 'noicon.png'; } 
												}else{
													$sImage = 'noicon.png';
												}												
												
											?>
										<img src="<?php echo 'http://vclean4u.uk/product_images/'.$sImage;?>" width="100"></td>
										<td>
											<?php												
												if(isset($row->product_thumb_image) && $row->product_thumb_image!=""){
													$ssImage = $row->product_thumb_image;
													$sysRoot = $_SERVER["DOCUMENT_ROOT"];
													$sFolderLoc = "/product_images/";
													$thisFileName = $ssImage;
													$thisFullName = $sysRoot.$sFolderLoc.$thisFileName;
													if (file_exists($thisFullName)) { $ssImage  = $thisFileName; }else{ $ssImage  = 'noicon.png'; } 
												}else{
													$ssImage = 'noicon.png';
												}												
												
											?>
										<img src="<?php echo 'http://vclean4u.uk/product_images/'.$ssImage;?>" width="100"></td>
										<td>
											<?php if($row->status == 1){ ?>
												<input value="Active" type="button" id="cat_actions" name="cat_actions" class="btn btn-primary btn-xs" onClick="check_actions('<?php echo $row->prdid; ?>',0);">
											<?php } ?>
											<?php if($row->status == 0){ ?>
												<input value="Inactive" type="button" id="cat_actions" name="cat_actions" class="btn btn-danger btn-xs " onClick="check_actions('<?php echo $row->prdid; ?>',1);">
											<?php } ?>
										</td>
										<td>
											<a href="<?php echo base_url();?>admin/settings/edit_product?id=<?php echo $row->prdid;?>"><button type="button" class="btn btn-xs btn-success" value="<?php echo $row->prdid?>"><i class="fa fa-edit"></i> Edit</button></a>
											<!--<a href="<?php echo base_url();?>admin/common/category_view?id=<?php echo $row->prdid; ?>"><button type="button" class="btn btn-xs btn-info" value="<?php echo $row->prdid; ?>"><i class="fa fa-eye"></i> View</button></a>-->
											<input value="Delete" type="button" id="cat_actions" name="cat_actions" class="btn btn-danger btn-xs " onClick="check_actions('<?php echo $row->prdid; ?>',2);">
										</td>
									</tr>
								<?php }  ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
        </div>
    </div>
 </div>
<?php 
$this->load->view('admin/includes/footer');
?>
<script type="text/javascript">
	function check_actions(prdid,st){
		if(st==0){
			swal({
				title: "Are you sure?",
				text: "You want to Change the Status!",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Yes, change it!",
				closeOnConfirm: false
			},
			function(){
				window.location= "<?php echo base_url()?>admin/settings/product_Item_actions/" + prdid +"/0";
			});
		}else if(st==1){
			swal({
				title: "Are you sure?",
				text: "You want to Change the Status!",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Yes, change it!",
				closeOnConfirm: false
			},
			function(){
				window.location= "<?php echo base_url()?>admin/settings/product_Item_actions/" + prdid +"/1";
			});
		}else if(st==2){
			swal({
				title: "Are you sure?",
				text: "You want to Delete entire data related to this!",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Yes, delete it!",
				closeOnConfirm: false
			},
			function(){
				window.location= "<?php echo base_url()?>admin/settings/product_Item_actions/" + prdid +"/2";
			});
		}
	}
	function categoryWise(prdCatid){
		if(prdCatid!=""){
			window.location= "<?php echo base_url()?>admin/settings/product_lists?catid=" + prdCatid;
		}else{
			window.location= "<?php echo base_url()?>admin/settings/product_lists";
		}
	}
</script>