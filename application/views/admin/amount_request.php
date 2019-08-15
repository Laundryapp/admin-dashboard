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
                    <th>User Name</th>
                    <th>Amount</th>
                    <th>Request Date</th>
                    <th>A/C Holder Name</th>
                    <th>A/C No.</th>
                    <th>IFSC Code</th>
                    <th>Transaction ID</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                    <?php  $s=0; foreach ($amount_request as $row){ ?>
                        <tr>
                            <td><?=++$s;?></td>
                            <td><?=$row->name;?><br><?=$row->mobile;?></td>
                            <td><?=$row->amount;?></td>
                            <td><?=date('d M Y',strtotime($row->date));?></td>
                            <td><?=$row->holder_name;?></td>
                            <td><?=$row->ac_no;?></td>
                            <td><?=$row->ifsc;?></td>
                            <td><?=$row->transaction_id;?></td>
                            <td><?php if($row->status == 0){?>
                                <button class="btn btn-sm btn-warning" onclick="set_amount(<?=$row->id;?>)">Transfer</button>
                            <?php }else{ ?>
                                <button class="btn btn-sm btn-primary">Transfered</button>
                            <?php } ?>
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
   
<div class="modal inmodal fade" id="myModal" tabindex="-1" role="dialog"  aria-hidden="true">
<div class="modal-dialog modal-md">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">Transaction Details</h4>
        </div>
        <form method="post">
        <div class="modal-body">
                <div class="form-group"><label class="col-sm-3 control-label">Transaction ID</label>
                    <div class="col-sm-9"><input type="text" name="transaction_id" class="form-control"></div>
                </div>
                <div class="clearfix"></div>
                <input type="hidden" name="id" id="refer_id">
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
            <input type="submit" name="submit" class="btn btn-primary" value="Submit">
        </div>
        </form>
    </div>
</div>
</div>

<?php 
$this->load->view('admin/includes/footer');
?>
<script type="text/javascript">
    function set_amount(id){
        $('#refer_id').val(id);
        $('#myModal').modal();
    }
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
    window.location= "<?=base_url()?>admin/common/deactive/" + sliders_deactive +"/products";
});
});
</script>