
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
                        <a class="btn btn-primary btn-sm open pull-right" href="<?php echo base_url();?>admin/settings/add_vendor" type="button" style="margin-top: -5px;"><i class="fa fa-plus"></i> Add</a>
                    </div>
                        <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover dataTables" >
                    <thead>
                    <tr>
                        <th>Sr No.</th>
                        <th>Store ID</th>
                        <th>Store Name</th>
                        <th>Store User Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Status</th>
                        <th>Manage</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php  $s=0; foreach ($vendorsList as $vendor){ ?>
                            <tr>
                                <td><?php echo ++$s; ?></td>
                                <td><?php echo $vendor->store_unique_id;?></td>
                                <td><?php if(isset($vendor->store_name) && $vendor->store_name!="") { echo ucfirst($vendor->store_name);}else{ };?></td>
                                <td><?php echo ucfirst($vendor->first_name).' '.ucfirst($vendor->last_name);?></td>
                                <td><?php echo $vendor->store_person_email;?></td>
                                <td><?php echo $vendor->store_phoneid;?></td>
								<td>
									<?php if($vendor->account_status == 'A'){ ?>
										<input value="Active" type="button" id="cat_actions" name="cat_actions" class="btn btn-primary btn-xs" onClick="check_actions('<?php echo $vendor->id; ?>',0);">
									<?php } ?>
									<?php if($vendor->account_status == 'I'){ ?>
										<input value="Inactive" type="button" id="cat_actions" name="cat_actions" class="btn btn-danger btn-xs " onClick="check_actions('<?php echo $vendor->id; ?>',1);">
									<?php } ?>
								</td>
                                <td>
                                    <a href="<?=base_url();?>admin/settings/edit_vendor?id=<?=$vendor->id;?>"><button type="button" class="btn btn-xs btn-success delete_vendor"><i class="fa fa-edit"></i> Edit</button></a>
									<input value="Delete" type="button" id="cat_actions" name="cat_actions" class="btn btn-danger btn-xs " onClick="check_actions('<?php echo $vendor->id; ?>',2);">
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

function check_actions(vendorId,driverType){
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
		data	:	{vendorId:vendorId,drivertype:driverType,updatetable:'vendor'},
		dataType:'json',
		success	: 	function(resHtml) {
			window.location = "<?=base_url();?>admin/settings/vendors_list";
		},complete: function(e){
			if(e.status == 302){
				location.href=baseUrl;
			}
		}
	});
}
</script>
