
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
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><?=$page_title;?></h5>
                        
                    </div>
                    <div class="ibox-content">

                        <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover dataTables" >
                    <thead>
                    <tr>
                        <th>Sr No.</th>
                        <th>Menu</th>
                        <th>Sub Menu</th>
                        <th>Status</th>
                        <th>Manage</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php $s=0; foreach ($details as $row){ ?>
                            <tr>
                                <td><?=++$s;?></td>
                                <td><?=$row->menu;?></td>
                                <td><?=$row->sub_menu;?></td>
                                <td><?php if($row->status == 1){echo "<button class='btn btn-primary btn-xs'>Active</button>";}else{echo "<button class='btn btn-danger btn-xs'>Inactive</button>";}?></td>
                                <td><a href="<?=base_url();?>admin/Common/edit_sub_menu?id=<?=$row->id;?>" class="btn btn-success btn-xs"><i class="fa fa-pencil-square-o"></i> Edit</a></td>
                            </tr>
                        <?php } ?>
                    
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