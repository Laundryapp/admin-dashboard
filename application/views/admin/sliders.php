
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
                        <h5>Add <?=$page_title;?></h5>
                    </div>
                            <div class="ibox-content">
                            
                            <form method="post" class="form-horizontal" action="" enctype="multipart/form-data">
                                <div class="col-md-6">
                                <div class="form-group"><label class="col-sm-2 control-label">Slider</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="form-control" id="file" name="slider" required="" onchange="check_file_size(this.id)">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group"><label class="col-sm-2 control-label">Text 1</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="text1" required>
                                    </div>
                                </div>
                                </div>
                                
                                <div class="col-md-12">
                                <div class="form-group"><label class="col-sm-1 control-label">Text 2</label>
                                    <div class="col-sm-11">
                                        <textarea class="form-control" name="text2" required></textarea>
                                        
                                    </div>
                                </div>
                                </div>
                                <div class="col-md-6">
                                <div class="form-group"><label class="col-sm-2 control-label">Status</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="status">
                                            <option value="1">Active</option>
                                            <option value="0">Inactive</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <input type="submit" name="submit" class="btn btn-primary" value="Save">
                                    </div>
                                </div>
                            </form>
                        </div>
                        </div>
                </div>

                    
                    <div class="col-md-12">
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
                        <th>Slider</th>
                        <th>Text 1</th>
                        <th>Text 2</th>
                        <th>Status</th>
                        <th>Manage</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php $s=0; foreach ($details as $row){ ?>
                            <tr>
                                <td><?=++$s;?></td>
                                <td width="150px">
                                    <img src="<?=base_url();?><?=$row->slider;?>" class="img-responsive ">
                                </td>
                                <td><?=$row->text1;?></td>
                                <td><?=$row->text2;?></td>
                                <td><?php if($row->status == 1){echo "<button class='btn btn-primary btn-xs change_status' value='".$row->id."'>Active</button>";}else{echo "<button class='btn btn-danger btn-xs change_status' value='".$row->id."'>Inactive</button>";}?></td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-danger delete_item" value="<?=$row->id?>"><i class="fa fa-trash"></i> Delete</button>
                                </td>
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
        </div>
        
<?php 
$this->load->view('admin/includes/footer');
?>
<script type="text/javascript">
    $(document).on("click",'.delete_item',function(){
            var del_id = $(this).val();
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
                window.location= "<?=base_url()?>admin/common/sliders_delete/" + del_id;
            });
        });

       $(document).on("click",'.change_status',function(){
            var sliders_deactive = $(this).val();
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
                window.location= "<?=base_url()?>admin/common/sliders_deactive/" + sliders_deactive;
            });
        });
</script>
<script>
        CKEDITOR.replace( 'text2' );
</script>