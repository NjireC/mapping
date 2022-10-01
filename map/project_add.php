<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Project | MosquitoDB '; 
page_require_level(2);
include_once('layouts/head.php');
?>




 <!-- Page content -->
 <div class="page-content">

               <?php echo display_msg_popup($msg);  ?>

 	<!-- Page title -->
 	<div class="page-title">
 	       <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php   echo $name;  ?> </small></h5>
 	</div>
 	
 	<!-- Form -->
            <form class="form-horizontal" action="scripts/addproject.php" role="form"  method="post">
                <div class="panel panel-default">
                    <div class="panel-heading"><h6 class="panel-title">Project Add</h6></div>
                    <div class="panel-body">

                       <div class="form-group">
                            <label class="col-sm-2 control-label">Project name : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control"  name="pn" id="pn" required>
                            </div>
                        </div>
                                 
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Project code : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control" name="pc" id="pc"  >
                                <input type="hidden"  name="staffid" id="staffid" value="<?php echo $current_user['username']; ?>" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Experiment number : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control"  name="expno" id="expno"  required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Project site : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                   <select  class="select-full" name="site" id="site" required>   </select>
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Experiment start date : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" datepicker form-control datformat" name="esd" id="esd" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Experiment  end date : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class="datepicker  form-control datformat" name="efd" id="efd"  required>
                            </div>
                        </div>

                       <!-- <div class="form-group">
                            <label class="col-sm-2 control-label">Ethical approval  : </label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control" name="eap" id="eap" required>
                            </div>
                        </div>  -->

            
                         <div class="form-group">
                            <label class="col-sm-2 control-label">Responsible scientist  :</label>
                            <div class="col-sm-10">
                                <select  class=" form-control" name="rsn" id="rsn" required>   </select>
                            </div>
                        </div>

                    <!--<div class="form-group">
                            <label class="col-sm-2 control-label">Principal Investigator  :</label>
                            <div class="col-sm-10">
                                  <select  class="select2_el form-group" name="pin" id="pin" style='width: 100%'; required>   </select>
                            </div>
                        </div> -->
                 
                        <div class="form-actions text-right">
                            <button name="addproj" type="submit" id="addproj" class="btn btn-primary"  > <i class="fa fa-check" aria-hidden="true"></i>Submit</button>
                        </div>

                    </div>
                    
                </div>
            </form>
            <!-- /form  -->

<script type="text/javascript">

 $(document).ready(function(){
    $.ajax({
        type:'POST',
        url:'scripts/getsites.php',
        success:function(html){
            $('#site').html(html);
          
        }
    }); 

      $.ajax({
        type:'POST',
        url:'scripts/getnames.php',
        success:function(html){
            $('#rsn').html(html);
          
        }
    }); 

        $.ajax({
        type:'POST',
        url:'scripts/getnames_all.php',
        success:function(html){
            $('#pin').html(html);
          
        }
    }); 


    $(function(){
	   $('#rsn').prop('disabled', true);
    });


    

});

</script>

<?php include_once('layouts/foot.php'); ?>		
			
	
           