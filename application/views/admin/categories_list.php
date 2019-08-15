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
					<a class="btn btn-primary btn-sm pull-right" href="<?php echo base_url();?>admin/settings/add_category" type="button" style="margin-top: -5px;" >Add Category</a>
                </div>
				<div class="ibox-content">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover dataTables" >
							<thead>
								<tr>
									<th>Sr No.</th>
									<th>Category ID</th>
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
										<td><?php echo $row->category_ref_id; ?></td>
										<td><?php echo ucfirst($row->category_name);?></td>	
										<td>
											<?php												
												if(isset($row->catimg) && $row->catimg!=""){
													$sImage = $row->catimg;
													$sysRoot = $_SERVER["DOCUMENT_ROOT"];
													$sFolderLoc = "/product_images/";
													$thisFileName = $sImage;
													$thisFullName = $sysRoot.$sFolderLoc.$thisFileName;
													if (file_exists($thisFullName)) { $sImage  = $thisFileName; }else{ $sImage  = 'noicon.png'; } 
												}else{
													$sImage = 'noicon.png';
												}												
												
											?>
												<img src="<?php echo 'http://vclean4u.uk/product_images/'.$sImage;?>" width="100">
										</td>
										<?php	
											$ssImage = "";
											if(isset($row->catthumbimg) && $row->catthumbimg!=""){
												$ssImage = $row->catthumbimg;
												$sysRoot = $_SERVER["DOCUMENT_ROOT"];
												$sFolderLoc = "/product_images/";
												$thisFileName = $ssImage;
												$thisFullName = $sysRoot.$sFolderLoc.$thisFileName;
												if (file_exists($thisFullName)) { $ssImage  = $thisFileName; }else{ $ssImage  = 'noicon.png'; } 
											}else{
												$ssImage = 'noicon.png';
											}										
										?>
										<td><img src="<?php echo 'http://vclean4u.uk/product_images/'.$ssImage;?>" width="100"></td>
										<td>
											<?php if($row->cat_status == 1){ ?>
												<input value="Active" type="button" id="cat_actions" name="cat_actions" class="btn btn-primary btn-xs" onClick="check_actions('<?php echo $row->cat_id; ?>',0);">
											<?php } ?>
											<?php if($row->cat_status == 0){ ?>
												<input value="Inactive" type="button" id="cat_actions" name="cat_actions" class="btn btn-danger btn-xs " onClick="check_actions('<?php echo $row->cat_id; ?>',1);">
											<?php } ?>
										</td>
										<td>
											<a href="<?php echo base_url();?>admin/settings/edit_category?id=<?php echo $row->cat_id;?>"><button type="button" class="btn btn-xs btn-success" value="<?php echo $row->cat_id?>"><i class="fa fa-edit"></i> Edit</button></a>
											<!--<a href="<?php echo base_url();?>admin/common/category_view?id=<?php echo $row->cat_id; ?>"><button type="button" class="btn btn-xs btn-info" value="<?php echo $row->cat_id; ?>"><i class="fa fa-eye"></i> View</button></a>-->
											<input value="Delete" type="button" id="cat_actions" name="cat_actions" class="btn btn-danger btn-xs " onClick="check_actions('<?php echo $row->cat_id; ?>',2);">
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
	function check_actions(catid,st){
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
				window.location= "<?php echo base_url()?>admin/settings/category_actions/" + catid +"/0";
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
				window.location= "<?php echo base_url()?>admin/settings/category_actions/" + catid +"/1";
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
				window.location= "<?php echo base_url()?>admin/settings/category_actions/" + catid +"/2";
			});
		}
	}
</script>