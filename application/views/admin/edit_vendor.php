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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
<div class="wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><?=$page_title;?></h5>
                    <a class="btn btn-primary btn-sm pull-right" href="#" type="button" style="margin-top: -5px;" onclick="window.history.go(-1)"><i class="fa fa-angle-double-left"></i> Back</a>
                </div>
                <div class="ibox-content">
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<div class="box-body mandatory_color">						
									<div class="panel with-nav-tabs panel-default">
										<div class="panel-heading">
											<ul id="rowTab" class="nav nav-tabs">
												<!--<li class="active" id="li_1"><a href="#tab1default" data-toggle="tab">Vendor Details</a></li>-->
												<li class="active" id="li_1"><a href="#tabdefault_1" data-toggle="tab">Vendor Details</a></li>
												<li id="li_2"><a href="#tabdefault_2" data-toggle="tab">Address Details</a></li>
												<li id="li_3"><a href="#tabdefault_3" data-toggle="tab">Shop Timings</a></li>		
												<li id="li_4"><a href="#tabdefault_4" data-toggle="tab">Holidays List</a></li>	
												<li id="li_5"><a href="#tabdefault_5" data-toggle="tab">Normal & Express Timings</a></li>		
												<li id="li_6"><a href="#tabdefault_6" data-toggle="tab">Shop Pictures</a></li>		
											</ul>
										</div>
										<form class="form-horizontal"  method="POST" name="add_vendor" id="add_vendor" enctype="multipart/form-data">
											<div class="panel-body">
												<div class="tab-content">
												<input type="hidden" id="tab1V" name="tab1V" value="0">
												<input type="hidden" id="tab3V" name="tab3V" value="1">
												<input type="hidden" id="tab7V" name="tab7V" value="1">
													<div class="tab-pane fade in active" id="tabdefault_1">
														<div class="form-horizontal">
															<div class="box-body mandatory_color">
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_first_name" class="col-sm-4 control-label">Store Name <sup style="color:red"> *</sup></label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="store_name" name="store_name" placeholder="Store Name" required value="<?php echo $vendorInfo->store_name; ?>" >
																		<span id="error_store_name" style="color:red"></span>
																		</div>		
																	</div>												
																	<div class="form-group">
																		<label for="u_last_name" class="col-sm-4 control-label">First Name<sup style="color:red"> *</sup></label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="first_name" name="first_name" placeholder="First Name" required value="<?php echo $vendorInfo->first_name; ?>">
																		<span id="error_first_name" style="color:red"></span>
																		</div>											
																	</div>
																	<div class="form-group">
																		<label for="u_last_name" class="col-sm-4 control-label">Last Name<sup style="color:red"> *</sup></label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="last_name" name="last_name" placeholder="Last Name" required value="<?php echo $vendorInfo->last_name; ?>">
																		<span id="error_last_name" style="color:red"></span>
																		</div>											
																	</div>
																	<div class="form-group">
																		<label for="u_email" class="col-sm-4 control-label">Email <sup style="color:red"> *</sup></label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="store_person_email" name="store_person_email" placeholder="Email Address" required value="<?php echo $vendorInfo->store_person_email; ?>">
																			<span id="error_store_person_email" style="color:red"></span>    
																		</div>
																	</div>													
																	<div class="form-group">
																		<label for="u_user_name" value="" class="col-sm-4 control-label">Phone <sup style="color:red">*</sup></label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="store_phoneid" name="store_phoneid" placeholder="Phone" required value="<?php echo $vendorInfo->store_phoneid; ?>"> 
																			<span id="error_store_phoneid" style="color:red"></span>    
																		</div>
																	</div>	
																	<div class="form-group">
																		<label for="u_user_name" value="" class="col-sm-4 control-label">About <sup style="color:red">*</sup></label>
																		<div class="col-sm-8">
																			<textarea type="text" class="form-control" id="store_des" name="store_des" placeholder="About" ><?php echo $vendorInfo->store_des; ?></textarea></div>
																	</div>	
																</div>
															</div>
															<div class="clearfix"></div>
															<div class="box-footer">
																<span style="display:none;float:left;" id="addUserLoader"><i class="fa fa-refresh fa-spin"></i></span>​
																  <a class="btn btn-primary btnNext pull-right" onClick="saveStoreDetailes(2)">Next</a>
															</div>										
														</div>
													</div>
													<div class="tab-pane fade in" id="tabdefault_2">
														<div class="form-horizontal">
															<div class="box-body mandatory_color">	
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="firstname" class="col-sm-4 control-label">Post Code <sup style="color:red">*</sup> </label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="postcode" name="postcode" placeholder="Post Code" value="<?php echo $vendorInfo->postcode; ?>" onBlur="getPostCodes()">
																			<span id="error_postcode" style="color:red"></span>
																		</div>
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="firstname" class="col-sm-4 control-label">Latitude </label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="store_latitude" name="store_latitude" placeholder="Latitude" readonly value="<?php echo $vendorInfo->store_latitude; ?>">
																			<!--<span id="id_store_latitude">+3232.3232323</span>-->
																			<span id="error_store_latitude" style="color:red"></span>
																		</div>
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="firstname" class="col-sm-4 control-label">Longitude </label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="store_longitude" name="store_longitude" placeholder="Longitude" readonly value="<?php echo $vendorInfo->store_longitude; ?>">
																			<!--<span id="id_store_longitude">+3232.3232323</span>-->
																			<span id="error_store_longitude" style="color:red"></span>
																		</div>
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Address <sup style="color:red">*</sup></label>
																		<div class="col-sm-8">
																			<textarea class="form-control" id="store_address" name="store_address" placeholder="Address"><?php echo $vendorInfo->store_address; ?></textarea>
																			<span id="error_store_address" style="color:red"></span>
																		</div>
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Location <sup style="color:red">*</sup></label>
																		<div class="col-sm-8">
																			<input type="text" class="form-control" id="store_location" name="store_location" placeholder="Location" value="<?php echo $vendorInfo->store_location; ?>">
																			<span id="error_store_location" style="color:red"></span>
																		</div>
																	</div>
																</div>
															</div>
														<div class="clearfix"></div>
														<div class="box-footer">
															<span style="display:none;float:left;" id="addUserLoader"><i class="fa fa-refresh fa-spin"></i></span>​
															<a class="btn btn-primary btnPrevious pull-left" onClick="previous(1)">Previous</a>
															<a class="btn btn-primary btnNext pull-right" onClick="saveStoreDetailes(3)">Next</a>		
														</div>
														</div>
													</div>
													<div class="tab-pane fade" id="tabdefault_3">
														<div class="form-horizontal">
															<div class="box-body mandatory_color">
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Shop ( Opening and Closing Timings ) <sup style="color:red">*</sup></label>
																		<div class="col-sm-4">
																			<select class="form-control" name="shop_open_time" id="shop_open_time" onChange="changeTime('shop_open_time','shop_close_time')"><?php echo $storeOpenTime; ?></select>										
																		</div>
																		<div class="col-sm-4">
																			<select class="form-control" name="shop_close_time" id="shop_close_time" ><?php echo $StoreCloseTime; ?></select>
																		</div>
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Sunday ( Opening Timings and Closing Timings) <sup style="color:red">*</sup></label>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_sunday_otimings" id="store_sunday_otimings" onChange="changeTime('store_sunday_otimings','store_sunday_ctimings')"><?php echo $storeSundayOpenTime; ?></select>										
																		</div>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_sunday_ctimings" id="store_sunday_ctimings"><?php echo $StoreSundayCloseTime; ?></select>
																		</div>
																		<?php 
																			$check = "";
																			if($shoptimingsList->sst_sunday_holiday == 1){
																				$check = "checked";
																			}
																		?>
																		<div class="col-sm-4">
																			<input name="isitholiday_sunday" type="checkbox" id="isitholiday_sunday" <?php echo $check; ?>> Is it Holiday day
																		</div>											
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Monday ( Opening Timings and Closing Timings)  <sup style="color:red">*</sup></label>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_monday_otimings" id="store_monday_otimings" onChange="changeTime('store_monday_otimings','store_monday_ctimings')"><?php echo $storeMondayOpenTime; ?></select>										
																		</div>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_monday_ctimings" id="store_monday_ctimings"><?php echo $StoreMondayCloseTime; ?></select>
																		</div>
																		<?php 
																			$check = "";
																			if($shoptimingsList->sst_monday_holiday == 1){
																				$check = "checked";
																			}
																		?>																		
																		<div class="col-sm-4">
																			<input name="isitholiday_monday" type="checkbox" id="isitholiday_monday" <?php echo $check; ?>> Is it Holiday day
																		</div>	
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Tuesday ( Opening Timings and Closing Timings)  <sup style="color:red">*</sup></label>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_tuesday_otimings" id="store_tuesday_otimings" onChange="changeTime('store_tuesday_otimings','store_tuesday_ctimings')"><?php echo $storeTuesdayOpenTime; ?></select>										
																		</div>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_tuesday_ctimings" id="store_tuesday_ctimings"><?php echo $StoreTuesdayCloseTime; ?></select>
																		</div>
																		<?php 
																			$check = "";
																			if($shoptimingsList->sst_tuesday_holiday == 1){
																				$check = "checked";
																			}
																		?>
																		<div class="col-sm-4">
																			<input name="isitholiday_tuesday" type="checkbox" id="isitholiday_tuesday" <?php echo $check; ?>> Is it Holiday day
																		</div>
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Wednesday ( Opening Timings and Closing Timings)  <sup style="color:red">*</sup></label>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_wednesday_otimings" id="store_wednesday_otimings" onChange="changeTime('store_wednesday_otimings','store_wednesday_ctimings')"><?php echo $storeWednesdayOpenTime; ?></select>										
																		</div>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_wednesday_ctimings" id="store_wednesday_ctimings"><?php echo $StoreWednesdayCloseTime; ?></select>
																		</div>
																		
																		<?php 
																			$check = "";
																			if($shoptimingsList->sst_wednesday_holiday == 1){
																				$check = "checked";
																			}
																		?>
																		<div class="col-sm-4">
																			<input name="isitholiday_wednesday" type="checkbox" id="isitholiday_wednesday" <?php echo $check; ?>> Is it Holiday day
																		</div>
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Thursday ( Opening Timings and Closing Timings)  <sup style="color:red">*</sup></label>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_thrusday_otimings" id="store_thrusday_otimings" onChange="changeTime('store_thrusday_otimings','store_thrusday_ctimings')"><?php echo $storeThrusdayOpenTime; ?></select>										
																		</div>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_thrusday_ctimings" id="store_thrusday_ctimings"><?php echo $StoreThrusdayCloseTime; ?></select>
																		</div>
																		<?php 
																			$check = "";
																			if($shoptimingsList->sst_thrusday_holiday == 1){
																				$check = "checked";
																			}
																		?>
																		
																		<div class="col-sm-4">
																			<input name="isitholiday_thrusday" type="checkbox" id="isitholiday_thrusday" <?php echo $check; ?>> Is it Holiday day
																		</div>			
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Firday ( Opening Timings and Closing Timings)  <sup style="color:red">*</sup></label>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_firday_otimings" id="store_firday_otimings" onChange="changeTime('store_firday_otimings','store_firday_ctimings')"><?php echo $storeFridayOpenTime; ?></select>										
																		</div>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_firday_ctimings" id="store_firday_ctimings"><?php echo $StoreFridayCloseTime; ?></select>
																		</div>	
																		<?php 
																			$check = "";
																			if($shoptimingsList->sst_friday_holiday == 1){
																				$check = "checked";
																			}
																		?>
																		<div class="col-sm-4">
																			<input name="isitholiday_firday" type="checkbox" id="isitholiday_firday" <?php echo $check; ?>> Is it Holiday day
																		</div>		
																	</div>
																</div>
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_pan" class="col-sm-4 control-label">Saturday ( Opening Timings and Closing Timings)  <sup style="color:red">*</sup></label>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_saturday_otimings" id="store_saturday_otimings" onChange="changeTime('store_saturday_otimings','store_saturday_ctimings')"><?php echo $storeSaturdayOpenTime; ?></select>										
																		</div>
																		<div class="col-sm-4">
																			<select class="form-control" name="store_saturday_ctimings" id="store_saturday_ctimings"><?php echo $StoreSaturdayCloseTime; ?></select>
																		</div>	
																		<?php 
																			$satCheck = "";
																			if($shoptimingsList->sst_saturday_holiday == 1){
																				$satCheck = "checked";
																			}
																		?>
																		<div class="col-sm-4">
																			<input name="isitholiday_saturday" type="checkbox" id="isitholiday_saturday" <?php echo $satCheck; ?> > Is it Holiday day
																		</div>	
																	</div>
																</div>
															</div>
															<div class="clearfix"></div>
															<div class="box-footer">
																<span style="display:none;float:left;" id="addUserLoader"><i class="fa fa-refresh fa-spin"></i></span>​
																<a class="btn btn-primary btnPrevious pull-left" onClick="previous(2)">Previous</a>
																<a class="btn btn-primary btnNext pull-right" onClick="saveStoreDetailes(4)">Next</a>
															</div>										
														</div>
													</div>
													<div class="tab-pane fade" id="tabdefault_4">
														<span id="holidays_list_ids">
														<?php if(!empty($holidaysList)){
																foreach($holidaysList as $key => $hol){
																	$keyval = ($key+1);
														?>
															<div id="addmore_<?php echo $keyval; ?>">
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_last_name" class="col-sm-4 control-label">Holiday Date <sup style="color:red">*</sup></label>
																		<div class="col-sm-6">
																			<input type="text" class="form-control" id="holidaydate_<?php echo $keyval; ?>" name="holidaydate[]" placeholder="Holiday Date" value="<?php echo date('m/d/Y',strtotime($hol->shl_holiday_date));?>" >
																		</div>	
																		<?php if($key == 0){ ?>
																		<div class="col-sm-2">				
																			<a href="javascript:void(0);" onclick="addMoreHoliday()" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
																		</div>	
																	<?php }else{ ?>
																		<div class="col-sm-2">				
																			<a href="javascript:void(0);" onclick="removeHoliday('<?php echo $keyval; ?>')" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></a>
																		</div>									
																	<?php } ?>		
																	</div>
																	<div class="form-group">
																		<label for="u_last_name" class="col-sm-4 control-label">Reason for Holiday <sup style="color:red">*</sup></label>
																		<div class="col-sm-6">
																			<input type="text" class="form-control" id="reason_for_holiday_<?php echo $keyval; ?>" name="reasonforholiday[]" placeholder="Reson for Holiday" value="<?php echo $hol->shl_holiday_reason;?>" >
																		</div>										
																	</div>
																</div>
															</div>
														<?php }}else{ ?>
															<div id="addmore_1">
																<div class="col-md-9">
																	<div class="form-group">
																		<label for="u_last_name" class="col-sm-4 control-label">Holiday Date <sup style="color:red">*</sup></label>
																		<div class="col-sm-6">
																			<input type="text" class="form-control" id="holidaydate_1" name="holidaydate[]" placeholder="Holiday Date" >
																		</div>	
																		<div class="col-sm-2">				
																			<a href="javascript:void(0);" onclick="addMoreHoliday()" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
																		</div>			
																	</div>
																	<div class="form-group">
																		<label for="u_last_name" class="col-sm-4 control-label">Reason for Holiday <sup style="color:red">*</sup></label>
																		<div class="col-sm-6">
																			<input type="text" class="form-control" id="reason_for_holiday_1" name="reasonforholiday[]" placeholder="Reson for Holiday" >
																		</div>										
																	</div>
																</div>
															</div>
														<?php } ?>
														</span>
														<input type="hidden" name="hidHolVal" id="hidHolVal" value= <?php if(count($holidaysList) > 0){ echo count($holidaysList); }else{ echo 1; } ?> /> 
														<div class="clearfix"></div>
														<div class="box-footer">
															<a class="btn btn-primary btnPrevious pull-left" onClick="previous(3)">Previous</a>
															<span style="color:red;margin-left: 198px;" id="error_meg"></span>
															<a class="btn btn-primary btnNext pull-right" onClick="saveStoreDetailes(5)">Next</a>
														</div>	
													</div>
													<div class="tab-pane fade" id="tabdefault_5">
														<p> Normal Pickup Hours and Delivery Days </p>
														<div class="col-md-9">
															<div class="form-group">
																<label for="firstname" class="col-sm-4 control-label">Normal Pickup Hours <sup style="color:red">*</sup> </label>
																<div class="col-sm-8">
																	<input type="number" class="form-control" id="normal_pickup_hours" name="normal_pickup_hours" placeholder="Normal Pickup Hours" value="<?php echo $vendorInfo->normal_pickup_hours; ?>" >
																	<span id="error_normal_pickup_hours" style="color:red"></span>
																</div>
															</div>
															<div class="form-group">
																<label for="firstname" class="col-sm-4 control-label">Normal Delivery Days <sup style="color:red">*</sup> </label>
																<div class="col-sm-8">
																	<input type="number" class="form-control" id="normal_delivery_days" name="normal_delivery_days" placeholder="Normal Delivery Days" value="<?php echo $vendorInfo->normal_delivery_days; ?>">
																	<span id="error_normal_delivery_days" style="color:red"></span>
																</div>
															</div>
															<?php 
																$styleNorPer = "";
																$styleNorDefault = "display:none;";
																if($vendorInfo->normal_type_of_cost == 1){
																	$styleNorPer = "";
																}else if($vendorInfo->normal_type_of_cost == 2){
																	$styleNorPer = "display:none;";
																	$styleNorDefault = "";
																}
															?>
															<div class="form-group">
																<label for="" class="col-sm-4 control-label">Type Of Cost</label>
																<div class="col-sm-6">
																<?php  if($vendorInfo->normal_type_of_cost == 1){ ?>
																	<select class="form-control" id="normal_type_of_cost" name="normal_type_of_cost" onChange="normalChangeCost('1')"><option value="1" >Percentage of Cost</option><option value="2" >Default Cost</option></select>
																<?php }else if($vendorInfo->normal_type_of_cost == 2){ ?>
																	<select class="form-control" id="normal_type_of_cost" name="normal_type_of_cost" onChange="normalChangeCost('1')"><option value="1" >Percentage of Cost</option><option value="2" selected >Default Cost</option></select>
																<?php }else{ ?>
																	<select class="form-control" id="normal_type_of_cost" name="normal_type_of_cost" onChange="normalChangeCost('1')"><option value="1" >Percentage of Cost</option><option value="2"  >Default Cost</option></select>
																<?php } ?>
																</div>
															</div>
															<span id="hideshowNorPec_1" style="<?php echo $styleNorPer; ?>">
																<div class="form-group" >
																	<label for="firstname" class="col-sm-4 control-label">Percentage Of Cost</label>
																	<div class="col-sm-6">
																		<input type="number" class="form-control" id="percentage_of_cost" name="percentage_of_cost" placeholder="Percentage of cost" value="<?php echo $vendorInfo->percentage_of_cost;?>" >
																	</div>
																</div>
															</span>
															<span id="hideshowNorDefault_1" style="<?php echo $styleNorDefault; ?>">
																<div class="form-group" >
																	<label for="firstname" class="col-sm-4 control-label">Default Cost</label>
																	<div class="col-sm-6">
																		<input type="number" class="form-control" id="default_cost" name="default_cost" placeholder="Default cost" value="<?php echo $vendorInfo->default_cost;?>"></div>
																</div>
															</span>
															<p> Express Pickup & Delivery Hours </p>
															<span id="express_pickup_ids">
															<?php if(!empty($expressList)){
																foreach($expressList as $key => $express){
																	$keyval = ($key+1);
															?>
																<div id="express_addmore_<?php echo $keyval; ?>">
																	<div class="form-group">
																		<label for="firstname" class="col-sm-4 control-label">Pickup Hours  </label>
																		<div class="col-sm-6">
																			<input type="number" class="form-control" id="express_minimum_hours_<?php echo $keyval; ?>" name="express_minimum_hours[]" placeholder="Express Pickup Hours" value="<?php echo $express->set_pickup_hour; ?>" >
																		</div>
																		<?php if($key == 0){ ?>
																		<div class="col-sm-2">				
																			<a href="javascript:void(0);" onclick="addMoreExpress()" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
																		</div>
																		<?php }else{ ?>
																		<div class="col-sm-2">				
																			<a href="javascript:void(0);" onclick="removeExpress('<?php echo $keyval; ?>')" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></a>
																		</div>
																		<?php } ?>
																	</div>
																	<div class="form-group">
																		<label for="firstname" class="col-sm-4 control-label">Delivery Hours</label>
																		<div class="col-sm-6">
																			<input type="number" class="form-control" id="express_pickup_time_<?php echo $keyval; ?>" name="express_pickup_time[]" placeholder="Delivery hours" value="<?php echo $express->set_delivery_hour; ?>">
																		</div>
																	</div>
																	<?php 
																		$stylePer = "";
																		$styleDefault = "display:none;";
																		if($express->set_type_of_cost == 1){
																			$stylePer = "";
																		}else if($express->set_type_of_cost == 2){
																			$stylePer = "display:none;";
																			$styleDefault = "";
																		}
																	?>
																	<div class="form-group">
																		<label for="" class="col-sm-4 control-label">Type Of Cost</label>
																		<div class="col-sm-6">
																		<?php  if($express->set_type_of_cost == 1){ ?>
																			<select class="form-control" id="express_percentage_of_type_<?php echo $keyval; ?>" name="express_percentage_of_type[]" onChange="changeCost('<?php echo $keyval; ?>')"><option value="1" >Percentage of Cost</option><option value="2" >Default Cost</option></select>
																		<?php } else{ ?>
																			<select class="form-control" id="express_percentage_of_type_<?php echo $keyval; ?>" name="express_percentage_of_type[]" onChange="changeCost('<?php echo $keyval; ?>')"><option value="1" >Percentage of Cost</option><option value="2" selected >Default Cost</option></select>
																		<?php } ?>
																		</div>
																	</div>
																	
																	<span id="hideshowPec_<?php echo $keyval; ?>" style="<?php echo $stylePer; ?>">
																		<div class="form-group" >
																			<label for="firstname" class="col-sm-4 control-label">Percentage Of Cost</label>
																			<div class="col-sm-6">
																				<input type="number" class="form-control" id="express_percentage_of_cost_<?php echo $keyval; ?>" name="express_percentage_of_cost[]" placeholder="Percentage of cost" value="<?php echo $express->set_percentage_of_cost; ?>">
																			</div>
																		</div>
																	</span>
																	<span id="hideshowDefault_<?php echo $keyval; ?>" style="<?php echo $styleDefault;?>">
																		<div class="form-group" >
																			<label for="firstname" class="col-sm-4 control-label">Default Cost</label>
																			<div class="col-sm-6">
																				<input type="number" class="form-control" id="express_default_cost_<?php echo $keyval; ?>" name="express_default_cost[]" placeholder="Default cost" value="<?php echo $express->set_default_cost; ?>">
																			</div>
																		</div>
																	</span>
																</div>
															<?php }}else{ ?>
																<div id="express_addmore_1">
																	<div class="form-group">
																		<label for="firstname" class="col-sm-4 control-label">Pickup Hours  </label>
																		<div class="col-sm-6">
																			<input type="number" class="form-control" id="express_minimum_hours_1" name="express_minimum_hours[]" placeholder="Express Pickup Hours" value="" >
																		</div>
																		<div class="col-sm-2">				
																			<a href="javascript:void(0);" onclick="addMoreExpress()" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
																		</div>
																	</div>
																	<div class="form-group">
																		<label for="firstname" class="col-sm-4 control-label">Delivery Hours</label>
																		<div class="col-sm-6">
																			<input type="number" class="form-control" id="express_pickup_time_1" name="express_pickup_time[]" placeholder="Delivery hours" value="">
																		</div>
																	</div>
																	<div class="form-group">
																		<label for="" class="col-sm-4 control-label">Type Of Cost</label>
																		<div class="col-sm-6">
																			<select class="form-control" id="express_percentage_of_type_1" name="express_percentage_of_type[]" onChange="changeCost('1')"><option value="1" >Percentage of Cost</option><option value="2" >Default Cost</option></select>
																		</div>
																	</div>
																	
																	<span id="hideshowPec_1" style="">
																		<div class="form-group" >
																			<label for="firstname" class="col-sm-4 control-label">Percentage Of Cost</label>
																			<div class="col-sm-6">
																				<input type="number" class="form-control" id="express_percentage_of_cost_1" name="express_percentage_of_cost[]" placeholder="Percentage of cost" value="">
																			</div>
																		</div>
																	</span>
																	<span id="hideshowDefault_1" style="display:none;">
																		<div class="form-group" >
																			<label for="firstname" class="col-sm-4 control-label">Default Cost</label>
																			<div class="col-sm-6">
																				<input type="number" class="form-control" id="express_default_cost_1" name="express_default_cost[]" placeholder="Default cost" value="">
																			</div>
																		</div>
																	</span>
																</div>															
															<?php } ?>
															</span>
														</div>
															<input type="hidden" name="hidExpressVal" id="hidExpressVal" value= <?php if(count($expressList) > 0){ echo count($expressList); }else{ echo 1;} ?> /> 
														<div class="clearfix"></div>
														<div class="box-footer">
															<a class="btn btn-primary btnPrevious pull-left" onClick="previous(4)">Previous</a>
															<span style="color:red;margin-left: 198px;" id="error_express_meg"></span>
															<a class="btn btn-primary btnNext pull-right" onClick="saveStoreDetailes(6)">Next</a>								
														</div>
													</div>
													
													<?php 
													$profile_img = "";
													$commercial_img = "";
														if($vendorInfo->store_profile_pic != ""){
															$profile_img = "<center><img src ='".base_url()."/product_images/".$vendorInfo->store_profile_pic."' height='100' width='100'  ></center><br/>";
														}
														if($vendorInfo->store_commercial_pic != ""){
															$commercial_img = "<center><img src ='".base_url()."/product_images/".$vendorInfo->store_commercial_pic."' height='100' width='100'  ></center><br/>";
														}
													?>
													
													<div class="tab-pane fade" id="tabdefault_6">
														<div class="col-md-9">
															<?php echo $profile_img; ?>
															<div class="form-group">
																<label for="" class="col-sm-4 control-label"> Profile Picture  </label>
																<div class="col-sm-8">
																	<input type="file" class="form-control" id="profile_pic" name="profile_pic" style="height:auto"><span id="error_profile_pic" style="color:red"></span>
																</div>
															</div>
															<?php echo $commercial_img; ?>
															<div class="form-group">
																<label for="" class="col-sm-4 control-label"> Commercial Picture </label>
																<div class="col-sm-8">
																	<input type="file" class="form-control" id="commercial_pic" name="commercial_pic" style="height:auto">
																	<span id="error_normal_pic" style="color:red"></span>
																</div>
																
															</div>
														</div>
														<input type="hidden" name="hid_profile_pic" id="hid_profile_pic" value="<?php echo $vendorInfo->store_profile_pic; ?>" >
														<input type="hidden" name="hid_commercial_pic" id="hid_commercial_pic" value="<?php echo $vendorInfo->store_commercial_pic; ?>">
														<input type="hidden" name="hid_storeid" id="hid_storeid" value="<?php echo $storeId; ?>">
														<div class="clearfix"></div>
														<div class="box-footer">
															<span style="display:none;float:left;" id="addUserSurveyorLoader"><i class="fa fa-refresh fa-spin"></i></span>​
															<span id="success_message"></span>
															<span style="margin-left: 25%;color: green;" id="success_messages"></span>
															<div class="tab-pane active" id="">
																<a class="btn btn-primary btnPrevious pull-left" onClick="previous(5)">Previous</a>
																<button type="button" id="btn" class="btn btn-info pull-right btnNext"  onClick="saveStoreDetailes(7)">Submit </button>
															</div>								
														</div>
													</div>
												</div>
											</div>		
										</form>
									</div>					
								</div>
							</div>
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
<script>

$(document).ready(function() {
	<?php if(!empty($holidaysList)){
		foreach($holidaysList as $key => $holi){
			$keyval = ($key+1);
		?>
		$("#holidaydate_"+'<?php echo $keyval; ?>').datepicker(); 
	<?php } }else{ ?>
		$("#holidaydate_1").datepicker();
	<?php } ?>
});
function saveStoreDetailes(saveType){
	if(saveType == 2){
		var falg = true;
		var storeName = $('#store_name').val();
		var firstName = $('#first_name').val();
		var lastName = $('#last_name').val();
		var email = $('#store_person_email').val();
		var phone = $('#store_phoneid').val();
		$('#error_store_name').html('');
		$('#error_first_name').html('');
		$('#error_last_name').html('');
		$('#error_store_person_email').html('');
		$('#error_store_phoneid').html('');
		
		if(storeName == ""){
			$('#error_store_name').html('Store name is required.');
			falg = false;
		}
		if(firstName == ""){
			$('#error_first_name').html('First name is required.');
			falg = false;
		}
		if(lastName == ""){
			$('#error_last_name').html('Last name is required.');
			falg = false;
		}
		if(email == ""){
			$('#error_store_person_email').html('Store email is required.');
			falg = false;
		}else if( !validateEmail(email)) {
			$('#error_store_person_email').html('Email is not valid.');
			falg = false;
		}
		if(phone == ""){
			$('#error_store_phoneid').html('Store phonenumber is required.');
			falg = false;
		}else if(isNaN(phone)){
			$('#error_store_phoneid').html('Allowed numbers only.');
			falg = false;
		}
		
		if(falg == true){
			$('#rowTab li').each(function() {
				$('#'+this.id).removeClass('active');
			});
			$('div[id ^= tabdefault_]').each(function(){
				$('#'+this.id).removeClass('in active');
			});
			$('#li_'+saveType).addClass('active');
			$('#tabdefault_'+saveType).addClass('in active');
		}
	}else if(saveType == 3){
		var falg = true;
		var postCode = $('#postcode').val();
		var storeAddress = $('#store_address').val();
		var storeLocation = $('#store_location').val();
		
		$('#error_postcode').html('');
		$('#error_store_address').html('');
		$('#error_store_location').html('');
		
		if(postCode == ""){
			$('#error_postcode').html('Post code is required.');
			falg = false;
		}
		if(storeAddress == ""){
			$('#error_store_address').html('Address is required.');
			falg = false;
		}
		if(storeLocation == ""){
			$('#error_store_location').html('Location is required.');
			falg = false;
		}
		
		if(falg == true){
			$('#rowTab li').each(function() {
				$('#'+this.id).removeClass('active');
			});
			$('div[id^= tabdefault_]').each(function(){
				$('#'+this.id).removeClass('in active');
			});
			$('#li_'+saveType).addClass('active');
			$('#tabdefault_'+saveType).addClass('in active');
		}
	}else if(saveType == 4){
		$('#rowTab li').each(function() {
			$('#'+this.id).removeClass('active');
		});
		$('div[id^= tabdefault_]').each(function(){
			$('#'+this.id).removeClass('in active');
		});
		$('#li_'+saveType).addClass('active');
		$('#tabdefault_'+saveType).addClass('in active');
	}else if(saveType == 5){
		$('#error_meg').html('');
		var flag = true;
		var checkvalidation = 0;
		$('input[id^= holidaydate_]').each(function(){
			holVal = $('#'+this.id).val();
			if(holVal == ""){
				 flag = false;
				 checkvalidation = 1;
			}
		});
		$('input[id^= reason_for_holiday_]').each(function(){
			reasonVal = $('#'+this.id).val();
			if(reasonVal == ""){
				 flag = false;
				 checkvalidation = 1;
			}
		});
		if(checkvalidation == 1){
			$('#error_meg').html('Please fill required fields');
			flag = false;
		}
		if(flag == true){
			$('#rowTab li').each(function() {
				$('#'+this.id).removeClass('active');
			});
			$('div[id^= tabdefault_]').each(function(){
				$('#'+this.id).removeClass('in active');
			});
			$('#li_'+saveType).addClass('active');
			$('#tabdefault_'+saveType).addClass('in active');
		}
	}else if(saveType == 6){
		
		var flag = true;
		var normalPickupHours = $('#normal_pickup_hours').val();
		var normalDelDays = $('#normal_delivery_days').val();
		
		$('#error_normal_pickup_hours').html('');
		$('#error_normal_delivery_days').html('');
		
		if(normalPickupHours == ""){
			$('#error_normal_pickup_hours').html('Pickup hours is required.');
			flag = false;
		}
		if(normalDelDays == ""){
			$('#error_normal_delivery_days').html('Days is required.');
			flag = false;
		}
		
		if(flag == true){
			$('#rowTab li').each(function() {
				$('#'+this.id).removeClass('active');
			});
			$('div[id^= tabdefault_]').each(function(){
				$('#'+this.id).removeClass('in active');
			});
			$('#li_'+saveType).addClass('active');
			$('#tabdefault_'+saveType).addClass('in active');
		}
	}else{
		var flag = true;
		var profilePic = $('#profile_pic').val();
		var commPic = $('#commercial_pic').val();
		$('#error_profile_pic').html('');
		$('#error_normal_pic').html('');
		var extention1 = $('#profile_pic').val().substring($('#profile_pic').val().lastIndexOf('.') + 1).toLowerCase();
		var extention2 = $('#commercial_pic').val().substring($('#commercial_pic').val().lastIndexOf('.') + 1).toLowerCase();
		if($('#hid_profile_pic').val() == ""){
			if(profilePic == ""){
				alert();
				$('#error_profile_pic').html('Please upload profile picture');
				flag = false;
			}else {
				if(extention1 != 'png' && extention1 != 'jpg' && extention1 != 'jpeg' && extention1 != 'jpe'){
					$('#error_profile_pic').html('Please upload image');
					flag = false;
				}
			}
		}
		if($('#hid_commercial_pic').val() == ""){
			if(commPic == ""){
				$('#error_normal_pic').html('Please upload commercial picture');
				flag = false;
			}else{
				if(extention2 != 'png' && extention2 != 'jpg' && extention2 != 'jpeg' && extention2 != 'jpe'){
					$('#error_normal_pic').html('Please upload image');
					flag = false;
				}
			}
		}
		if(profilePic != "" || commPic != ""){
			var profile_pic = $("#profile_pic")[0].files[0];
			var commercial_pic = $("#commercial_pic")[0].files[0];
			var form_data = new FormData();	
			form_data.append('profile_pic', profile_pic);
			form_data.append('commercial_pic', commercial_pic);
			if(flag == true){
				$.ajax({
					url: '<?=base_url();?>admin/settings/uploadImage',
					dataType:'json',
					contentType: false,
					processData: false,
					data: form_data,        
					type: 'post',
					success: function(data){
						if(data.output == 'success'){
							$('#hid_profile_pic').val(data.profile_pic);
							$('#hid_commercial_pic').val(data.commercial_pic);
							$.ajax({
								type	: 	"POST",
								cache	:	false,
								url		: 	'<?=base_url();?>admin/settings/saveVendorDetailes',
								data	:	$('#add_vendor').serialize(),
								success	: 	function(resHtml) {
									window.location = '<?=base_url();?>admin/settings/vendors_list';
								},complete: function(e){
									if(e.status == 302){
										location.href=baseUrl;
									}
								}
							});
						}
					},complete: function(e){
						if(e.status == 302){
							location.href=baseUrl;
						}
					}
				});
			}
		}else{
			if(flag == true){
				$.ajax({
					type	: 	"POST",
					cache	:	false,
					url		: 	'<?=base_url();?>admin/settings/saveVendorDetailes',
					data	:	$('#add_vendor').serialize(),
					success	: 	function(resHtml) {
						window.location = '<?=base_url();?>admin/settings/vendors_list';
					},complete: function(e){
						if(e.status == 302){
							location.href=baseUrl;
						}
					}
				});
			}
		}
	}
}

function previous(backType){
	$('#rowTab li').each(function() {
		$('#'+this.id).removeClass('active');
	});
	$('div[id ^= tabdefault_]').each(function(){
		$('#'+this.id).removeClass('in active');
	});
	$('#li_'+backType).addClass('active');
	$('#tabdefault_'+backType).addClass('in active');
}
function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
}
function getPostCodes(){
	var postalCode = $('#postcode').val();
	$.ajax({
		type	: 	"POST",
		cache	:	false,
		url		: 	'<?=base_url();?>admin/settings/getaddresses',
		data	:	{postalCode:postalCode},
		dataType:'json',
		success	: 	function(resHtml) {
			console.log(resHtml.lattitude);
			$('#store_latitude').val(resHtml.lattitude);
			$('#store_longitude').val(resHtml.longitude);
			$('#store_address').html(resHtml.address);
			$('#store_location').val(resHtml.location);
		},complete: function(e){
			if(e.status == 302){
				location.href=baseUrl;
			}
		}
	});
}
function changeTime(open,close){
	
	var sleVal = $('#'+open).val();
	var options = $('#shop_open_time option');
	var geDropDown = "";
	var arr = options.map(function(_, o) { return { t: $(o).text(), v: o.value }; }).get();
	options.each(function(i, o) {
	  opValue = arr[i].v;
	  opText = arr[i].t;
		if(timeToSeconds(opValue) >= timeToSeconds(sleVal)) {
			geDropDown +='<option value="'+opValue+'" >'+opText+'</option>';
		}		
	});
	$('#'+close).html(geDropDown);
}
function timeToSeconds(time) {
    time = time.split(/:/);
    return time[0] * 3600 + time[1] * 60;
}

function addMoreHoliday(){
	var hidMoreValue 	= parseInt($('#hidHolVal').val())+1;
	var addMoreAcq = '<div id="addmore_'+hidMoreValue+'"+><div class="col-md-9"><div class="form-group"><label for="" class="col-sm-4 control-label">Holiday Date <sup style="color:red">*</sup></label><div class="col-sm-6"><input type="text" class="form-control" id="holidaydate_'+hidMoreValue+'" name="holidaydate[]" placeholder="Holiday Date" ></div><div class="col-sm-2">	<a href="javascript:void(0);" onclick="removeHoliday('+hidMoreValue+')" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></a></div></div><div class="form-group"><label for="" class="col-sm-4 control-label">Reason for Holiday <sup style="color:red">*</sup></label><div class="col-sm-6"><input type="text" class="form-control" id="reason_for_holiday_'+hidMoreValue+'" name="reasonforholiday[]" placeholder="Reson for Holiday" ></div></div></div></div>';
	$('#holidays_list_ids').append(addMoreAcq);
	$('#hidHolVal').val(hidMoreValue);
	$("#holidaydate_"+hidMoreValue).datepicker(); 
}
function removeHoliday(addMoreVal){
	$('#addmore_'+addMoreVal).remove();
}

function addMoreExpress(){
	var hidMoreValue 	= parseInt($('#hidExpressVal').val())+1;
	var addMoreAcq = '<div id="express_addmore_'+hidMoreValue+'"><div class="form-group"><label for="" class="col-sm-4 control-label">Pickup Hours  </label><div class="col-sm-6"><input type="number" class="form-control" id="express_minimum_hours_'+hidMoreValue+'" name="express_minimum_hours[]" placeholder="Express Pickup Hours"></div><div class="col-sm-2"><a href="javascript:void(0);" onclick="removeExpress('+hidMoreValue+')" class="btn btn-danger btn-sm"><i class="fa fa-minus"></i></a></div></div><div class="form-group"><label for="" class="col-sm-4 control-label">Delivery Hours</label><div class="col-sm-6"><input type="number" class="form-control" id="express_pickup_time_'+hidMoreValue+'" name="express_pickup_time[]" placeholder="Delivery Hours"></div></div><div class="form-group"><label for="" class="col-sm-4 control-label">Type Of Cost</label><div class="col-sm-6"><select class="form-control" id="express_percentage_of_type_'+hidMoreValue+'" name="express_percentage_of_type[]" onChange="changeCost('+hidMoreValue+')"><option value="1" >Percentage of Cost</option><option value="2" >Default Cost</option></select></div></div><div class="form-group" id="hideshowPec_'+hidMoreValue+'"><label for="" class="col-sm-4 control-label">Percentage Of Cost</label><div class="col-sm-6"><input type="number" class="form-control" id="express_percentage_of_cost_'+hidMoreValue+'" name="express_percentage_of_cost[]" placeholder="Percentage of cost"></div></div><div class="form-group" id="hideshowDefault_'+hidMoreValue+'" style="display:none;"><label for="" class="col-sm-4 control-label">Default Cost</label><div class="col-sm-6"><input type="number" class="form-control" id="express_default_cost_'+hidMoreValue+'" name="express_default_cost[]" placeholder="Default cost"></div></div></div>';
	$('#express_pickup_ids').append(addMoreAcq);
	$('#hidExpressVal').val(hidMoreValue);
	$("#holidaydate_"+hidMoreValue).datepicker(); 
}
function removeExpress(addMoreVal){
	$('#express_addmore_'+addMoreVal).remove();
}

function changeCost(changetype){
	$('#hideshowDefault_'+changetype).hide();
	$('#hideshowPec_'+changetype).hide();
	$('#express_percentage_of_cost_'+changetype).val('');
	$('#express_default_cost_'+changetype).val('');
	if($('#express_percentage_of_type_'+changetype).val() == 1){
		$('#hideshowPec_'+changetype).show();
	}else{
		$('#hideshowDefault_'+changetype).show();
	}
}
function normalChangeCost(changetype){
	$('#hideshowNorDefault_'+changetype).hide();
	$('#hideshowNorPec_'+changetype).hide();
	$('#percentage_of_cost').val('');
	$('#default_cost').val('');
	if($('#normal_type_of_cost').val() == 1){
		$('#hideshowNorPec_'+changetype).show();
	}else{
		$('#hideshowNorDefault_'+changetype).show();
	}
}
</script>