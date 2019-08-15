<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon"  href="<?=base_url();?>logo_icon_150x150_RZ4_icon.ico">
    <title><?php echo $page_title;?> | Vclean4u - Dashboard</title>
    <link rel="shortcut icon" href="<?=base_url();?>assets/images/small_logo.jpg" />
    <link href="<?=base_url();?>admin_assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?=base_url();?>admin_assets/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<?= base_url() ?>admin_assets/js/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<?= base_url() ?>admin_assets/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="<?= base_url() ?>admin_assets/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">    
    <link href="<?=base_url();?>admin_assets/css/animate.css" rel="stylesheet">
    <link href="<?=base_url();?>admin_assets/css/style.css" rel="stylesheet">
    <link href="<?=base_url();?>admin_assets/css/plugins/chosen/bootstrap-chosen.css" rel="stylesheet">
    <link href="<?=base_url();?>admin_assets/css/fSelect.css" rel="stylesheet">
</head>
<body>
    <div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav metismenu" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element" >
							<span>
								<img alt="image" class="img-responsive" src="<?php echo base_url();?>assets/images/logo-icon-150x150.png"  style="margin: 0 auto;display: block;"/>
							</span>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear text-center"> 
									<span class="block m-t-xs"> 
										<strong class="font-bold"><?=$this->session->userdata('username')?> <b class="caret"></b></strong>
									</span>  
								</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a href="<?=base_url();?>admin/settings/admin_settings">Admin Settings</a></li>
								<li><a href="<?=base_url();?>admin/common/backup">DB Backup</a></li>
								<li class="divider"></li>
								<li><a href="<?=base_url();?>admin/login/logout">Logout</a></li>
							</ul>
						</div>
						<div class="logo-element">
							<img alt="image" class="img-circle img-md img-responsive" src="<?php echo base_url();?>assets/images/logo-icon-150x150.png" />
						</div>
					</li>
					<li class="<?php if ($page == 'dashboard') {echo 'active';} ?>">
						<a href="<?=base_url();?>admin/dashboard"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span></a>
					</li>
					<li class="<?php if ( $page == 'admin_setting'  || $page=='categories_list' || $page == 'edit_category' || $page == 'add_category' || $page == 'product_lists' || $page == 'add_product' || $page == 'edit_product' || $page == 'terms_conditions' || $page == 'subcategory' ) {echo 'active';} ?>">
						<a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">Masters</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse <?php if ( $page == 'admin_setting'  || $page == 'terms_conditions') {echo 'in';} ?>">
							<li><a href="<?=base_url();?>admin/common/backup">DB Backup</a></li>                        
							<li class="<?php if ($page == 'admin_setting') {echo 'active';} ?>"><a href="<?=base_url();?>admin/settings/admin_settings">Admin Settings</a></li>
							<li class="<?php if ($page == 'categories_list' || $page == 'edit_category' || $page == 'add_category') {echo 'active';} ?>"><a href="<?=base_url();?>admin/settings/categories_list">Categories</a></li>
							<li class="<?php if ($page == 'product_lists' || $page == 'edit_product' || $page == 'add_product') {echo 'active';} ?>"><a href="<?=base_url();?>admin/settings/product_lists">Product Items</a></li>  
							<li class="<?php if ($page == 'terms_conditions') {echo 'active';} ?>"><a href="<?=base_url();?>admin/common/terms_conditions">Terms and Conditions</a></li>
						</ul>
					</li>
					<li class="<?php if ( $page == 'vendors_list'  || $page == 'add_vendor' || $page == 'edit_vendor'  || $page=='drivers_list' || $page=='add_driver' || $page=='edit_driver' || $page == 'customers_list') { echo 'active';} ?>">
						<a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">Users</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse <?php if ( $page == 'vendors_list') {echo 'in';} ?>">
							<li class="<?php if ($page == 'vendors_list' || $page == 'add_vendor' || $page == 'edit_vendor') {echo 'active';} ?>"><a href="<?=base_url();?>admin/settings/vendors_list">Vendors</a></li>
							<li class="<?php if ($page == 'drivers_list' || $page=='add_driver' || $page=='edit_driver') { echo 'active';} ?>"><a href="<?=base_url();?>admin/settings/drivers_list">Drivers</a></li>
							<li class="<?php if ($page == 'customers_list') {echo 'active';} ?>"><a href="<?=base_url();?>admin/settings/customers_list">Customers</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            		</div>
					<ul class="nav navbar-top-links navbar-right">
                        <li><a href="<?=base_url();?>admin/login/logout"><i class="fa fa-sign-out"></i> Log out</a></li>
           			</ul>
				</nav>
			</div>