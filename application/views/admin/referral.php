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
                <th>Referrer (Sender)</th>
                <th>Referee (Receiver)</th>
                <th>Referred Date</th>
                <th>Registered Date</th>
                <th>Amount</th>
                <!-- <th>Status</th> -->
            </tr>
            </thead>
            <tbody>
                <?php  $s=0; foreach ($users as $row){ ?>
                    <tr>
                        <td><?=++$s;?></td>
                        <td><?=$row->name;?><br><?=$row->mobile;?></td>
                        <td><?=$row->referee_name;?><br><?=$row->mobile_number;?></td>
                        <td><?=date('d M Y',strtotime($row->sent_date));?></td>
                       <td><?=date('d M Y',strtotime($row->registered_date));?></td>
                       <td><?php if($row->refer_amount == ''){?>
                       <button type="button" class="btn btn-primary" onclick="set_refer_amount('<?=$row->id;?>')">Add Amount</button>
                   <?php }else {  ?>
                    <i class="fa fa-inr"></i><?=$row->amount_history;?>/-
                    <?php } ?>
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

<div class="modal inmodal fade" id="myModal" tabindex="-1" role="dialog"  aria-hidden="true">
<div class="modal-dialog modal-md">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">Referral Amount</h4>
        </div>
        <form method="post" autocomplete="off">
        <div class="modal-body">
                <div class="form-group"><label class="col-sm-2 control-label">Amount</label>
                    <div class="col-sm-10"><input type="text" name="amount" class="form-control number"></div>
                </div>
                <div class="clearfix"></div>
                <input type="hidden" name="refer_id" id="refer_id">
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

function set_refer_amount(id){
    $('#refer_id').val(id);
    $('#myModal').modal();
}
</script>