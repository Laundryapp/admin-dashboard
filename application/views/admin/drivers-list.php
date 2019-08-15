<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h2><?=$page_title;?></h2>
		<ol class="breadcrumb">
			
			<li>
				<a href="<?=base_url();?>/admin/dashboard">Dashboard</a>
			</li>
			<li class="active">
				<strong><?=$page_title;?></strong>
			</li>
		</ol>
	</div>
	<div class="col-lg-2">

	</div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="col-md-12">
				<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><?=$page_title;?></h5>
				<a class="btn btn-primary btn-sm open pull-right" href="<?php echo base_url();?>admin/settings/add_driver" type="button" style="margin-top: -5px;"><i class="fa fa-plus"></i> Add</a>
			</div>
				<div class="ibox-content">
			<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover dataTables" >
			<thead>
			<tr>
				<th>Store ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone Number</th>
				<th>Assign Vendors</th>
				<th>Status</th>
				<th>Manage</th>
			</tr>
			</thead>
			<tbody>
				<?php  $s=0; foreach ($driverList as $driver){ ?>
					<tr>
						<td><?php echo $driver->unique_id;?></td>
						<td><?php if(isset($driver->name) && $driver->name!="") { echo ucfirst($driver->name);}else{ };?></td>
						<td><?php echo $driver->email;?></td>
						<td><?php echo $driver->mobile;?></td>
						<td><?php if(isset($assVen[$driver->id])){ echo $assVen[$driver->id]; }else{ } ?></td>
						<td>
							<?php if($driver->driver_status == '1'){ ?>
								<input value="Active" type="button" id="cat_actions" name="cat_actions" class="btn btn-primary btn-xs" onClick="check_actions('<?php echo $driver->id; ?>',0);">
							<?php } ?>
							<?php if($driver->driver_status == '0'){ ?>
								<input value="Inactive" type="button" id="cat_actions" name="cat_actions" class="btn btn-danger btn-xs " onClick="check_actions('<?php echo $driver->id; ?>',1);">
							<?php } ?>
						</td>
						<td>
							<a href="<?=base_url();?>admin/settings/edit_driver?id=<?=$driver->id;?>"><button type="button" class="btn btn-xs btn-success delete_driver"><i class="fa fa-edit"></i> Edit</button></a>
							<input value="Delete" type="button" id="cat_actions" name="cat_actions" class="btn btn-danger btn-xs " onClick="check_actions('<?php echo $driver->id; ?>',2);">
							<input value="Assign Vendors" type="button" class="btn btn-primary btn-xs " onClick="assigned_vendors_popup('<?php echo $driver->id; ?>','<?php echo $driver->postcode; ?>');">
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
</div>

<!-- Assigned Vendors -->
<div class="modal fade" id="assignedVendorPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">Assign Vendors</h4>
		</div>
		<form class="form-horizontal" method="POST" id="ass_vendor" name="ass_vendor" >
			<div class="modal-body">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">Vendords List <sup style="color:red;">*</sup></label>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<div class="col-sm-8">
							<select id="vendorids" name="vendorids[]" style="max-width:90%;" multiple placeholder="Select Vendors" ></select><span id="error_list" name="error_list" style="color:red;margin-left:"></span>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="hid_driver_id" id="hid_driver_id" value="<?php echo $driver->id; ?>" >
			<input type="hidden" name="hid_post_code" id="hid_post_code" value="<?php echo $driver->postcode; ?>" >
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-primary" onClick="assigned_vendors()">Assigned</button>
			</div>
		</form>
    </div>
  </div>
</div>

<div class="modal fade" id="vendorsEmpty" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Warning Message</h4>
      </div>
      <div class="modal-body"><p id="chnageText">Vendors list not found.</p></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
      </div>
    </div>
  </div>
</div>

<?php 
$this->load->view('admin/includes/footer');
?>
<script type="text/javascript">

$(".open").click(function(){
	 $('#open').toggle();
	if($('.open').html() == '<i class="fa fa-plus"></i> Add'){
		$('.open').html('<i class="fa fa-minus"></i> Close');
	}else{
		$('.open').html('<i class="fa fa-plus"></i> Add');
	}
});

function check_actions(driverId,driverType){
	if(driverType == 0){
		var msg = "Are you sure want to inactive?";
	}else if(driverType == 1){
		var msg = "Are you sure want to active?";
	}else{
		var msg = "Are you sure want to delete?";
	}
	if(confirm(msg)){
		
	}else{
		return false;
	}
	
	$.ajax({
		type	: 	"POST",
		cache	:	false,
		url		: 	'<?=base_url();?>admin/settings/checkactions',
		data	:	{driverId:driverId,drivertype:driverType,updatetable:'driver'},
		dataType:'json',
		success	: 	function(resHtml) {
			window.location = "<?=base_url();?>admin/settings/drivers_list";
		},complete: function(e){
			if(e.status == 302){
				location.href=baseUrl;
			}
		}
	});
}

function assigned_vendors_popup(driverid,postcode){
	$('#error_list').html('');
	$('#vendorsEmpty').modal('hide');
	$('#assignedVendorPopup').modal('hide');
	if(postcode == ""){
		$('#chnageText').html('Postcode is empty.');
		$('#vendorsEmpty').modal('show');
		return false;
	}
	$.ajax({
		type	: 	"POST",
		cache	:	false,
		url		: 	'<?=base_url();?>admin/settings/getVendorsList',
		data	:	{driverId:driverid,postcode:postcode},
		dataType:'json',
		success	: 	function(resHtml) {
			if(resHtml.status == 1){
				$('#vendorids').html(resHtml.options);
				$('#assignedVendorPopup').modal('show');
			}else{
				$('#chnageText').html('Vendors list not found.');
				$('#vendorsEmpty').modal('show');
			}
			$('#vendorids').fSelect();
		},complete: function(e){
			if(e.status == 302){
				location.href=baseUrl;
			}
		}
	});
	
}

function assigned_vendors(){
	$('#error_list').html('');
	var venList = $('#vendorids').val();
	var driverid = $('#hid_driver_id').val();
	if(venList == null ){
		$('#error_list').html('Please select vendors.');
		return false;
	}
	$.ajax({
		type	: 	"POST",
		cache	:	false,
		url		: 	'<?=base_url();?>admin/settings/saveVendorsList',
		data	:	{driverId:driverid,venList:venList},
		dataType:'json',
		success	: 	function(resHtml) {
			$('#assignedVendorPopup').modal('hide');
			window.location = "<?=base_url();?>admin/settings/drivers_list";
		},complete: function(e){
			if(e.status == 302){
				location.href=baseUrl;
			}
		}
	});
	
}
</script>
