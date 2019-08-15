<style type="text/css">
	.avoid-clicks { pointer-events: none; }
</style>
<div class="row  border-bottom white-bg page-heading">
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
<div class="wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><?=$page_title;?></h5>
                    <a class="btn btn-primary btn-sm pull-right" href="#" type="button" style="margin-top: -5px;" onclick="window.history.go(-1)"><i class="fa fa-angle-double-left"></i> Back</a>
                </div>
                <div class="ibox-content">
					<form method="POST" action="" enctype="multipart/form-data" id="cate_form" name="cate_form">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<div class="col-xs-4">
								<p class="margin-top-10">Name <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="category_name" type="text" name="category_name" value="">
									<span id="error_category_name" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Images <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8"> 
								<input accept="image/*" type="file" name="file" id="catimg" name="catimg" class="form-control" />
								<span id="error_catimg" style="color:red;"></span>
							</div>
							<div class="clearfix"></div><br>
							<div class="col-xs-4">
								<p class="margin-top-10">Thumb Images <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">  
								<input accept="image/*" type="file" name="file1" id="catthumbimg" name="catthumbimg" class="form-control" />
								<span id="error_catthumbimg" style="color:red;"></span>
							</div>
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Choose Payment Type </p>
							</div>
							<div class="col-xs-8">
								<input type="radio" checked="" onChange="return checkVal(0);" value="0" id="optionsRadios1" name="cat_offer_type"> Discount %  Off &nbsp;&nbsp;
								<input type="radio" value="1" id="optionsRadios2" onChange="return checkVal(1);" name="cat_offer_type">&nbsp;&nbsp;Fixed Amount  
							</div>							
							<div class="clearfix"></div><br>
							<span id="hid_dis" >
								<div class="col-xs-4">
									<p class="margin-top-10">Discount % Off per category</p>
								</div>
								<div class="col-xs-8">  
									<input type="text" id="cat_discount_per" name="cat_discount_per"  class="rButton form-control" />
									<span id="error_cat_discount_per" style="color:red;"></span>
								</div>
								<div class="clearfix"></div><br>
							</span>							
							<span id="hid_fix" style="display:none;">
								<div class="col-xs-4">
									<p class="margin-top-10">Fixed Amount</p>
								</div>
								<div class="col-xs-8">  
									<input type="text" id="cat_dis_fixed_amt" name="cat_dis_fixed_amt" class="rButton form-control" />
									<span id="error_cat_dis_fixed_amt" style="color:red;"></span>
								</div>
								<div class="clearfix"></div><br>
							</span>
						</div>
					</div>
					<div class="pull-right"><br>
					<input type="button" name="cat_submit" onClick="cat_validate();" value="Add" id="cat_submit" class="btn btn-success btn-round col-xs-12">
					</div>
					<div class="clearfix"></div>
					</form>
                </div>
            </div>
        </div>
    </div>
    <?php
		$this->load->view('admin/includes/footer');
    ?>
    <script>
		function cat_validate(){
			var flag = true;
			var category_name = $("#category_name").val();
			var catimg = $("#catimg").val();
			var catthumbimg = $("#catthumbimg").val();
			var cat_discount_per = $("#cat_discount_per").val();
			var cat_dis_fixed_amt = $("#cat_dis_fixed_amt").val();
			var cat_offer_type = $("input[name='cat_offer_type']:checked").val();
			if(category_name==""){
				flag = false;
				$("#error_category_name").html("Category is required.");
			}else{
				$("#error_category_name").html("");
			}
			if(catimg==""){
				flag = false;
				$("#error_catimg").html("Category image is required.");
			}else{
				$("#error_catimg").html("");
			}
			if(catthumbimg==""){
				flag = false;
				$("#error_catthumbimg").html("Category thumb image is required.");
			}else{
				$("#error_catthumbimg").html("");
			}
			// if(cat_offer_type==0){
				// $("#cat_dis_fixed_amt").val(0);
				// $("#error_cat_dis_fixed_amt").html("");
				// $("#hid_dis").show();
				// $("#hid_fix").hide();
				// if(cat_discount_per == ""){
					// flag = false;
					// $("#error_cat_discount_per").html("Discount % per category is required");
				// }else{
					// $("#error_cat_discount_per").html("");
				// }
			// }else if(cat_offer_type==1){
				// $("#cat_discount_per").val(0);
				// $("#error_cat_discount_per").html("");
				// $("#hid_fix").show();
				// $("#hid_dis").hide();
				// if(cat_dis_fixed_amt == ""){
					// flag = false;
					// $("#error_cat_dis_fixed_amt").html("Fixed amount is required.");
				// }else{
					// $("#error_cat_dis_fixed_amt").html("");
				// }
			// }
			if(flag==false){
				return false;
			}else{
				$("#cate_form").submit();
			}
		}
		function checkVal(val){
			if(val==0){
				$("#cat_discount_per").val(0);
				$("#hid_fix").hide();
				$("#hid_dis").show();
			}else{
				$("#cat_dis_fixed_amt").val(0);
				$("#hid_fix").show();
				$("#hid_dis").hide();
			}
		}
	</script>