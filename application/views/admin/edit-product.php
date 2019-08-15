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
					<form method="POST" action="" enctype="multipart/form-data" id="product_item_form" name="product_item_form">
						<input type="hidden" id="h_prdid" name="h_prdid" value="<?php echo $itemdetails->prdid; ?>">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<div class="col-xs-4">
								<p class="margin-top-10">Category <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<select class="form-control mdl-textfield mdl-js-textfield mdl-textfield--floating-label" id="category_id" name="category_id" >
										<option value="">Select a Category</option>
										<?php if(isset($cat_details) && count($cat_details)>0){ foreach($cat_details as $cats){ $catId = $cats->cat_id; $selected =""; if($catId==$itemdetails->category_id){ $selected="selected"; }?>
											<option <?php echo $selected; ?> value="<?php echo $cats->cat_id; ?>" ><?php echo ucfirst($cats->category_name); ?></option>
										<?php } } ?>
									</select>									
									<span id="error_category_id" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Item Name <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="product_name" type="text" name="product_name" value="<?php echo $itemdetails->product_name; ?>">
									<span id="error_product_name" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<?php 
								$catimg = "";$catthumbimg = "";
								if(isset($itemdetails->product_image) && $itemdetails->product_image!=""){ 
									$catimg = $itemdetails->product_image;
								}
								if(isset($itemdetails->product_thumb_image) && $itemdetails->product_thumb_image!=""){ 
									$catthumbimg = $itemdetails->product_thumb_image;
								}
							?>
							<input type="hidden" id="h_product_image" name="h_product_image" value="<?php echo $catimg; ?>">
							<input type="hidden" id="h_product_thumb_image" name="h_product_thumb_image" value="<?php echo $catthumbimg; ?>">
							<div class="col-xs-4">
								<p class="margin-top-10">Images <?php if($catimg!=""){ ?><sup style="color:red">*</sup><?php } ?></p>
							</div>							
							<?php if(isset($itemdetails->product_thumb_image) && $itemdetails->product_thumb_image!=""){  ?>
								<div class="col-xs-6"> 
									<input accept="image/*" type="file" name="product_image" id="product_image" class="form-control" />
									<span id="error_catimg" style="color:red;"></span>
								</div>
								<div class="col-xs-2"> 
									<?php												
										if(isset($itemdetails->product_image) && $itemdetails->product_image!=""){
											$sImage = $itemdetails->product_image;
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
								</div>
							<?php }else{ ?>
								<div class="col-xs-8"> 
									<input accept="image/*" type="file"  id="product_image" name="product_image" class="form-control" />
									<span id="error_product_image" style="color:red;"></span>
								</div>
							<?php } ?>							
							<div class="clearfix"></div><br>
							<div class="col-xs-4">
								<p class="margin-top-10">Thumb Images <?php if($catthumbimg!=""){ ?><sup style="color:red">*</sup><?php } ?></p>
							</div>							
							<?php if(isset($itemdetails->product_thumb_image) && $itemdetails->product_thumb_image!=""){  ?>
								<div class="col-xs-6"> 
									<input accept="image/*" type="file" name="product_thumb_image" id="product_thumb_image" class="form-control" />
									<span id="error_catimg" style="color:red;"></span>
								</div>
								<div class="col-xs-2"> 
									<?php												
										if(isset($itemdetails->product_thumb_image) && $itemdetails->product_thumb_image!=""){
											$sImage = $itemdetails->product_thumb_image;
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
								</div>
							<?php }else{ ?>
								<div class="col-xs-8">  
									<input accept="image/*" type="file" name="product_thumb_image" id="product_thumb_image" name="catthumbimg" class="form-control" />
									<span id="error_product_thumb_image" style="color:red;"></span>
								</div>
							<?php } ?>
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Price <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="product_price" type="number" name="product_price" value="<?php echo $itemdetails->product_price; ?>">
									<span id="error_product_price" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							
							<div class="col-xs-4">
								<p class="margin-top-10">Choose Payment Discount Type </p>
							</div>
							<?php 
								$checked1="";
								$checked2="";
								if(isset($itemdetails->product_discount_type) && $itemdetails->product_discount_type==0){ 
									$checked1="checked";
								}else if(isset($itemdetails->product_discount_type) && $itemdetails->product_discount_type==1){  
									$checked2="checked";
								} 
							?>
							<div class="col-xs-8">
								<input type="radio" <?php echo $checked1; ?> onChange="return checkVal(0);" value="0" id="optionsRadios1" name="product_discount_type"> Discount %  Off &nbsp;&nbsp;
								<input <?php echo $checked2; ?> type="radio" value="1" id="optionsRadios2" onChange="return checkVal(1);" name="product_discount_type">&nbsp;&nbsp;Fixed Amount  
							</div>							
							<div class="clearfix"></div><br>
							<span id="hid_dis" >
								<div class="col-xs-4">
									<p class="margin-top-10">Discount % Off per category</p>
								</div>
								<div class="col-xs-8">  
									<input type="number" id="product_discount_per" name="product_discount_per"  class="rButton form-control" value="<?php echo $itemdetails->product_discount_per; ?>">
									<span id="error_product_discount_per" style="color:red;"></span>
								</div>
								<div class="clearfix"></div><br>
							</span>							
							<span id="hid_fix" style="display:none;">
								<div class="col-xs-4">
									<p class="margin-top-10">Fixed Amount</p>
								</div>
								<div class="col-xs-8">  
									<input type="number" id="product_discount_fixed" name="product_discount_fixed" class="rButton form-control" value="<?php echo $itemdetails->product_discount_fixed; ?>">
									<span id="error_product_discount_fixed" style="color:red;"></span>
								</div>
								<div class="clearfix"></div><br>
							</span>
							<div class="col-xs-4">
								<p class="margin-top-10">Product Description <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<textarea style="height:100px;" id="product_description" name="product_description" class="mdl-textfield__input form-control"><?php echo $itemdetails->product_description; ?></textarea>
									<span id="error_product_description" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
						</div>
					</div>
					<div class="pull-right"><br>
					<input type="button" name="cat_submit" onClick="cat_validate();" value="Update" id="cat_submit" class="btn btn-success btn-round col-xs-12">
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
			var category_id = $("#category_id").val();
			var product_name = $("#product_name").val();
			var product_image = $("#product_image").val();
			var product_thumb_image = $("#product_thumb_image").val();
			var product_price = $("#product_price").val();
			var product_discount_per = $("#product_discount_per").val();
			var product_discount_fixed = $("#product_discount_fixed").val();
			var product_description = $("#product_description").val();
			var product_discount_type = $("input[name='product_discount_type']:checked").val();
			if(category_id==""){
				flag = false;
				$("#error_category_id").html("Category is required.");
			}else{
				$("#error_category_id").html("");
			}
			if(product_name==""){
				flag = false;
				$("#error_product_name").html("Product item name is required.");
			}else{
				$("#error_product_name").html("");
			}
			<?php if(isset($itemdetails->product_image) && $itemdetails->product_image==""){  ?>
				if(product_image==""){
					flag = false;
					$("#error_product_image").html("Product Item image is required.");
				}else{
					$("#error_product_image").html("");
				}
			<?php } ?>
			<?php if(isset($itemdetails->product_thumb_image) && $itemdetails->product_thumb_image==""){  ?>
				if(product_thumb_image==""){
					flag = false;
					$("#error_product_thumb_image").html("Product Item thumb image is required.");
				}else{
					$("#error_product_thumb_image").html("");
				}
			<?php } ?>
			if(product_price==""){
				flag = false;
				$("#error_product_price").html("Price image is required.");
			}else{
				$("#error_product_price").html("");
			}
			// if(product_discount_type==0){
				// $("#product_discount_fixed").val(0);
				// $("#error_product_discount_per").html("");
				// $("#hid_dis").show();
				// $("#hid_fix").hide();
				// if(product_discount_per == ""){
					// flag = false;
					// $("#error_product_discount_per").html("Discount % per category is required");
				// }else{
					// $("#error_product_discount_per").html("");
				// }
			// }else if(product_discount_type==1){
				// $("#product_discount_per").val(0);
				// $("#error_cat_discount_per").html("");
				// $("#hid_fix").show();
				// $("#hid_dis").hide();
				// if(product_discount_fixed == ""){
					// flag = false;
					// $("#error_product_discount_fixed").html("Fixed amount is required.");
				// }else{
					// $("#error_product_discount_fixed").html("");
				// }
			// }
			if(product_description.trim()==""){
				flag = false;
				$("#error_product_description").html("Product Description is required.");
			}else{
				$("#error_product_description").html("");
			}
			if(flag==false){
				return false;
			}else{
				$("#product_item_form").submit();
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
	<script>
        // CKEDITOR.replace( 'product_description' );
</script>