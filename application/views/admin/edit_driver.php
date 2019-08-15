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
					<form method="POST" action="" enctype="multipart/form-data" id="driver_form" name="driver_form">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<div class="col-xs-4">
								<p class="margin-top-10">Name <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="name" type="text" name="name" value="<?php echo $driverinfo->name;?>">							
									<span id="error_name" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Email <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="email" type="text" name="email" value="<?php echo $driverinfo->email;?>">
									<span id="error_email" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Post Code <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="postcode" type="text" name="postcode" value="<?php echo $driverinfo->postcode;?>">
									<span id="error_postcode" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							
							<div class="col-xs-4">
								<p class="margin-top-10">Address <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<textarea class="mdl-textfield__input form-control" id="address"  name="address" value=""><?php echo $driverinfo->address;?></textarea>
									<span id="error_address" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Mobile Number <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="mobilenumber" type="number" name="mobilenumber" value="<?php echo $driverinfo->mobile;?>" ></textarea>
									<span id="error_mobilenumber" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							
							<div class="col-xs-4">
								<p class="margin-top-10">Alternative Mobile Number </p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="altermobilenumber" type="number" name="altermobilenumber" value="<?php echo $driverinfo->alternate_mobile;?>">
									<span id="error_altermobilenumber" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							
							<?php 
								$profile_img = "";
								$pancard_img = "";
								$licence_img = "";
								if($driverinfo->profile_pic != ""){
									$profile_img = "<center><img src ='".base_url()."/product_images/".$driverinfo->profile_pic."' height='100' width='100'  ></center><br/>";
								}
								if($driverinfo->pancard != ""){
									$pancard_img = "<center><img src ='".base_url()."/product_images/".$driverinfo->pancard."' height='100' width='100'  ></center><br/>";
								}
								if($driverinfo->driving_license != ""){
									$licence_img = "<center><img src ='".base_url()."/product_images/".$driverinfo->driving_license."' height='100' width='100'  ></center><br/>";
								}
							?>
							<?php echo $profile_img; ?>					
							<div class="col-xs-4">
								<p class="margin-top-10">Profile Pic <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">  
								<input accept="image/*" type="file" name="profile_pic" id="profile_pic" name="profile_pic" class="form-control" />
								<span id="error_profile_pic" style="color:red;"></span>
							</div>
							<div class="clearfix"></div> <br>
							<?php echo $pancard_img; ?>	
							<div class="col-xs-4">
								<p class="margin-top-10">Pancard <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8"> 
								<input accept="image/*" type="file"  id="pancard" name="pancard" class="form-control" />
								<span id="error_pancard" style="color:red;"></span>
							</div>
							<div class="clearfix"></div><br>
							<?php echo $licence_img; ?>	
							<div class="col-xs-4">
								<p class="margin-top-10">Driving licence <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">  
								<input accept="image/*" type="file" name="drivinglicence" id="drivinglicence" name="drivinglicence" class="form-control" />
								<span id="error_drivinglicence" style="color:red;"></span>
							</div>
							<div class="clearfix"></div> <br>
							<?php 
								$selected = "";
								$selected1 = "";
								if($driverinfo->cab_type == "1"){
									$selected = "selected";
								}else{
									$selected1 = "selected";
								}
							?>
							<div class="col-xs-4">
								<p class="margin-top-10">Vehicle Type <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<select class="mdl-textfield__input form-control" id="vehicletype" name="vehicletype" value="">
										<option value="1" <?php echo $selected; ?> >Bike</option>
										<option value="2" <?php echo $selected1; ?> >Car</option>
									</select>
									<span id="error_vehicletype" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Vehicle Number <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input form-control" id="vehiclenum" type="text" name="vehiclenum" value="<?php echo $driverinfo->cab_number;?>">
									<span id="error_vehiclenum" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Vehicle Modal <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="text" class="mdl-textfield__input form-control" id="vehiclemodal"  name="vehiclemodal" value="<?php echo $driverinfo->car_model;?>">
									<span id="error_vehiclemodal" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							
							<div class="col-xs-4">
								<p class="margin-top-10">Vehicle color <sup style="color:red">*</sup></p>
							</div>
							<div class="col-xs-8">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="text" class="mdl-textfield__input form-control" id="vehiclecolor"  name="vehiclecolor" value="<?php echo $driverinfo->car_color;?>">
									<span id="error_vehiclecolor" style="color:red"></span>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Available Day & Time</p>
							</div>
							<div class="col-xs-2">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="checkbox" id="sunday" name="sunday" <?php echo $sunchek; ?>> Sunday  
								</div>
							</div> 
							<div class="col-xs-6">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<div class="col-sm-4">
										<select class="form-control" name="sundaytime" id="sundaytime" ><?php echo $sunday; ?></select>										
									</div>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Available Day & Time</p>
							</div>
							<div class="col-xs-2">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="checkbox" id="monday" name="monday" <?php echo $monchek; ?>> Monday  
								</div>
							</div> 
							<div class="col-xs-6">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<div class="col-sm-4">
										<select class="form-control" name="mondaytime" id="mondaytime" ><?php echo $monday; ?></select>										
									</div>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Available Day & Time</p>
							</div>
							<div class="col-xs-2">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="checkbox" id="tuesday" name="tuesday" <?php echo $tuechek; ?>> Tuesday  
								</div>
							</div> 
							<div class="col-xs-6">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<div class="col-sm-4">
										<select class="form-control" name="tuesdaytime" id="tuesdaytime" ><?php echo $tuesday; ?></select>										
									</div>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Available Day & Time</p>
							</div>
							<div class="col-xs-2">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="checkbox" id="wednesday" name="wednesday" <?php echo $wedchek; ?>> Wednesday  
								</div>
							</div> 
							<div class="col-xs-6">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<div class="col-sm-4">
										<select class="form-control" name="wednesdaytime" id="wednesdaytime" ><?php echo $wednesday; ?></select>										
									</div>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Available Day & Time</p>
							</div>
							<div class="col-xs-2">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="checkbox" id="thrusday" name="thrusday" <?php echo $thrchek; ?>> Thrusday  
								</div>
							</div> 
							<div class="col-xs-6">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<div class="col-sm-4">
										<select class="form-control" name="thrusdaytime" id="thrusdaytime" ><?php echo $thrusday; ?></select>										
									</div>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Available Day & Time</p>
							</div>
							<div class="col-xs-2">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="checkbox" id="friday" name="friday" <?php echo $frichek; ?> > Friday  
								</div>
							</div> 
							<div class="col-xs-6">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<div class="col-sm-4">
										<select class="form-control" name="fridaytime" id="fridaytime" ><?php echo $friday; ?></select>
									</div>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
							<div class="col-xs-4">
								<p class="margin-top-10">Available Day & Time</p>
							</div>
							<div class="col-xs-2">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input type="checkbox" id="saturday" name="saturday" <?php echo $satchek; ?>> Saturday  
								</div>
							</div> 
							<div class="col-xs-6">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<div class="col-sm-4">
										<select class="form-control" name="saturdaytime" id="saturdaytime" ><?php echo $saturday; ?></select>										
									</div>
								</div>
							</div> 
							<div class="clearfix"></div> <br>
						</div>
					</div>
					<div class="pull-right"><br>
					<input type="hidden" id="hid_driverid" name="hid_driverid" value="<?php echo $driverinfo->id; ?>">
					<input type="button"  onClick="saveDriverInfo();" value="Update" class="btn btn-success btn-round col-xs-12">
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
function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
}
function saveDriverInfo(){
	var flag = true;
	var name = $("#name").val();
	var email = $("#email").val();
	var postcode = $("#postcode").val();
	var phonenumber = $("#mobilenumber").val();
	var address = $("#address").val();
	var vehicletype = $("#vehicletype").val();
	var vehiclenumber = $("#vehiclenum").val();
	var vehiclemodal = $("#vehiclemodal").val();
	var vehiclecolor = $("#vehiclecolor").val();
	var profilepic = $("#profile_pic").val();
	var pancard = $("#pancard").val();
	var drivinglicence = $("#drivinglicence").val();

	$('#error_phonemail').html('');
	if(name==""){
		flag = false;
		$("#error_name").html("Name is required.");
	}else{
		$("#error_name").html("");
	}
	if(email==""){
		flag = false;
		$("#error_email").html("Email is required.");
	}else if( !validateEmail(email)) {
		$('#error_email').html('Email is not valid.');
		flag = false;
	}else{
		$("#error_email").html("");
	}
	if(postcode==""){
		flag = false;
		$("#error_postcode").html("Postcode is required.");
	}else{
		$("#error_postcode").html("");
	}
	if(phonenumber==""){
		flag = false;
		$("#error_mobilenumber").html("Mobile number is required.");
	}else{
		$("#error_mobilenumber").html("");
	}
	if(address == ""){
		flag = false;
		$("#error_address").html("Address is required.");
	}else{
		$("#error_address").html("");
	}
	if(vehicletype==""){
		flag = false;
		$("#error_vehicletype").html("Vehicle type is required.");
	}else{
		$("#error_vehicletype").html("");
	}
	if(vehiclenumber==""){
		flag = false;
		$("#error_vehiclenum").html("Vehicle number is required.");
	}else{
		$("#error_vehiclenum").html("");
	}
	if(vehiclecolor==""){
		flag = false;
		$("#error_vehiclecolor").html("Vehicle color is required.");
	}else{
		$("#error_vehiclecolor").html("");
	}
	if(vehiclemodal==""){
		flag = false;
		$("#error_vehiclemodal").html("Vehicle modal is required.");
	}else{
		$("#error_vehiclemodal").html("");
	}
	// if(profilepic == ""){
		// $("#error_profile_pic").html("Profile image is required.");
		// flag = false;
	// }else{
		// $("#error_profile_pic").html("");
	// }
	// if(pancard==""){
		// flag = false;
		// $("#error_pancard").html("Pancard is required.");
	// }else{
		// $("#error_pancard").html("");
	// }
	// if(drivinglicence == ""){
		// flag = false;
		// $("#error_drivinglicence").html("Driving licence is required.");
	// }else{
		// $("#error_drivinglicence").html("");
	// }
	if(flag == true){
		$.ajax({
			type	: 	"POST",
			cache	:	false,
			url		: 	'<?=base_url();?>admin/settings/checkemailphone',
			data	:	$('#driver_form').serialize(),
			dataType:'json',
			success	: 	function(resHtml) {
				console.log(resHtml.status);
				if(resHtml.status == 1){
					$("#driver_form").submit();
				}else if(resHtml.status == 2){
					$('#error_mobilenumber').html('Phone number already exits.');
					$('#mobilenumber').focus();
					return false;
				}else if(resHtml.status == 3){
					$('#error_email').html('Email already exits.');
					$('#email').focus();
					return false;
				}else if(resHtml.status == 4){
					$('#error_mobilenumber').html('Phone number and Email already exits.');
					$('#mobilenumber').focus();
					return false;
				}
			},complete: function(e){
				if(e.status == 302){
					location.href=baseUrl;
				}
			}
		});
	}
}
</script>
	