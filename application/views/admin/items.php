
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
                
                        <div class="col-md-12" <?php if(!isset($_GET['id']))echo 'style="display: none;"'; ?>  id="open">
                            <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Add <?=$page_title;?></h5>
                    </div>
                            <div class="ibox-content">
                            
                            <form method="post" class="form-horizontal" action="" enctype="multipart/form-data" id="form">
                                <div class="col-md-6">

                                <div class="form-group"><label class="col-sm-4 control-label">Product / Category</label>
                                    <div class="col-sm-8">
                                    <select name="product" class="form-control chosen-select required" required>
                                        <?php foreach($products as $item){ ?>
                                                <option <?php if(isset($item_details) && $item_details->product_id == $item->id){echo 'Selected';} ?> value="<?=$item->id;?>"><?=$item->product;?></option>
                                        <?php } ?>
                                    </select>
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group"><label class="col-sm-4 control-label">Item / Sub-Category</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control required" name="item" required value="<?php if(isset($item_details)){echo $item_details->item;} ?>">
                                    </div>
                                </div>
                                </div>
                                
                            
                                
                                <div class="form-group">
                                    <div class="col-sm-6 col-sm-offset-6">
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
                        <a class="btn btn-primary btn-sm open pull-right" href="#" type="button" style="margin-top: -5px;"><i class="fa fa-plus"></i> Add</a>
                    </div>
                        <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover dataTables" >
                    <thead>
                    <tr>
                        <th>Sr No.</th>
                        <th>Product / Category</th>
                        <th>Item / Sub-Category</th>
                        <th>Manage</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php  $s=0; foreach ($items as $row){ ?>
                            <tr>
                                <td><?=++$s;?></td>
                                <td><?=$row->product;?></td>
                                <td><?=$row->item;?></td>
                                <td>
                                    <a href="<?=base_url();?>admin/common/edit_item?id=<?=$row->id;?>"><button type="button" class="btn btn-xs btn-success delete_item" value="<?=$row->id?>"><i class="fa fa-edit"></i> Edit</button></a>
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

    $(document).ready(function() {
        $("#form").validate({
            
        });
    });


</script>
