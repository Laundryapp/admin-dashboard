
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
                        <th>Email</th>
                        <th>Mobile Number</th>
                        <!-- <th>DOB</th>
                        <th>Gender</th> -->
                        <th>OTP</th>
                        <th>Manage</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php $s=0; foreach ($users as $row){ ?>
                            <tr>
                                <td><?=++$s;?></td>
                                <td><?=$row->email;?></td>
                                <td><?=$row->mobile_number;?></td>
                                <!-- <td><?=$row->dob;?></td>
                                <td><?=$row->gender;?></td> -->
                               <td><?php if($row->otp == 0){ echo "<span style='color:green'>OTP Verified</span>";}else {echo $row->otp;}?></td>
                                
                                <td>
                                    <button type="button" class="btn btn-xs btn-danger delete_item" value="<?=$row->id?>"><i class="fa fa-trash"></i> Delete</button>
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
        
<?php 
$this->load->view('admin/includes/footer');
?>
<script type="text/javascript">

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
        window.location= "<?=base_url()?>admin/common/deactive/" + sliders_deactive +"/users";
    });
});

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
        window.location= "<?=base_url()?>admin/common/delete_data/" + del_id +"/users";
    });
});
</script>