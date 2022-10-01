 <?php $settings = find_by_('settings','id',1); ?>

 <!-- Page header -->
  <div class="container-fluid">
      <div class="page-header">
          <div class="logo animate__animated animate__fadeIn">
           <a href="home.php" title=""><img src="assets/images/logo0.png" alt="logo" ></a>
            <div class="bottom-align-text text-center"> <h5><?php echo $settings['organization_name']; ?></h5> </div>
          </div>

          <ul class="middle-nav nav-pills">
                <li   id="home" <?php echo (basename($_SERVER['SCRIPT_FILENAME'])=='home.php' ? 'class="active"' : ''); ?>><a href="home.php"><i class="fa fa-home"></i> Home </a></li>
               <li class="dropdown 
                    <?php 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formed1.php' ? 'active' : '');
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formed2.php' ? 'active' : '');
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formss1.php' ? 'active' : '');  
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formss2.php' ? 'active' : '');  
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formss3.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formss4.php' ? 'active' : '');  
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formso1.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formso2.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formst1.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='formst2.php' ? 'active' : ''); 
                    ?>">
                    <a  class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-file-text"></i>Forms <b class="caret"></b>
                    </a>
                   
                     <ul class="dropdown-menu">
                        <li class="dropdown-submenu"><a tabindex="-1" href="#"><b class="caret-right"></b>Experimental Design</a>
                              <ul class="dropdown-menu">
                                <li class="<?php echo $disableed1; ?>"><a tabindex="-1" href="formed1.php">Experimental Design 1</a></li>
                                <li class="<?php echo $disableed2; ?>"><a tabindex="-1" href="formed2.php">Experimental Design 2</a></li>

                            </ul>
                        </li>
                        <li class="dropdown-submenu"><a tabindex="-1" href="#"><b class="caret-right"></b>Sample Sorting</a>
                              <ul class="dropdown-menu">
                                <li class="<?php echo $disabless1; ?>"><a tabindex="-1" href="formss1.php">Sample Sorting 1</a></li>
                                <li class="<?php echo $disabless2; ?>"><a tabindex="-1" href="formss2.php">Sample Sorting 2</a></li>
                                <li class="<?php echo $disabless3; ?>"><a tabindex="-1" href="formss3.php">Sample Sorting 3</a></li>
                                <li class="<?php echo $disabless4; ?>"><a tabindex="-1" href="formss4.php">Sample Sorting 4</a></li>
                                
                            </ul>
                        </li>
                        <li class="dropdown-submenu"><a tabindex="-1" href="#"><b class="caret-right"></b>Sample Observation</a>
                              <ul class="dropdown-menu">
                                <li class="<?php echo $disableso1; ?>"><a tabindex="-1" href="formso1.php">Sample Observation 1</a></li>
                                <li class="<?php echo $disableso2; ?>"><a tabindex="-1" href="formso2.php">Sample Observation 2</a></li>
                                
                            </ul>
                        </li>
                         <li class="dropdown-submenu"><a tabindex="-1" href="#"><b class="caret-right"></b>Sample Storage</a>
                              <ul class="dropdown-menu">
                                <li class="<?php echo $disablest1; ?>"><a tabindex="-1" href="formst1.php">Sample Storage 1</a></li>
                                <li class="<?php echo $disablest2; ?>"><a tabindex="-1" href="formst2.php">Sample Storage 2</a></li>
                                
                            </ul>
                        </li>
                        
                    </ul>

                </li>

                  <li class="dropdown 
                    <?php 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatableed1.php' ? 'active' : '');
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatableed2.php' ? 'active' : '');
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatabless1.php' ? 'active' : '');  
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatabless2.php' ? 'active' : '');  
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatabless3.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatabless4.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatableso1.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatableso2.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatablest1.php' ? 'active' : ''); 
                    echo (basename($_SERVER['SCRIPT_FILENAME'])=='datatablest2.php' ? 'active' : ''); 
                    ?>">
                    <a  class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-table"></i> Tables <b class="caret"></b>
                    </a>
                   
                     <ul class="dropdown-menu">
                        <li class="dropdown-submenu"><a tabindex="-1" href="#"><b class="caret-right"></b>Experimental Design</a>
                              <ul class="dropdown-menu">
                                <li class="<?php echo $disableed1; ?>"><a tabindex="-1" href="datatableed1.php">Experimental Design 1</a></li>
                                <li class="<?php echo $disableed2; ?>"><a tabindex="-1" href="datatableed2.php">Experimental Design 2</a></li>

                            </ul>
                        </li>
                        <li class="dropdown-submenu"><a tabindex="-1" href="#"><b class="caret-right"></b>Sample Sorting</a>
                              <ul class="dropdown-menu">
                                <li class="<?php echo $disabless1; ?>"><a tabindex="-1" href="datatabless1.php">Sample Sorting 1</a></li>
                                <li class="<?php echo $disabless2; ?>"><a tabindex="-1" href="datatabless2.php">Sample Sorting 2</a></li>
                                <li class="<?php echo $disabless3; ?>"><a tabindex="-1" href="datatabless3.php">Sample Sorting 3</a></li>
                                <li class="<?php echo $disabless4; ?>"><a tabindex="-1" href="datatabless4.php">Sample Sorting 4</a></li>
                            
                            </ul>
                        </li>
                        <li class="dropdown-submenu"><a tabindex="-1" href="#"><b class="caret-right"></b>Sample Observation</a>
                              <ul class="dropdown-menu">
                                <li class="<?php echo $disableso1; ?>"><a tabindex="-1" href="datatableso1.php">Sample Observation 1</a></li>
                                <li class="<?php echo $disableso2; ?>"><a tabindex="-1" href="datatableso2.php">Sample Observation 2</a></li>
                                
                            </ul>
                        </li>
                         <li class="dropdown-submenu"><a tabindex="-1" href="#"><b class="caret-right"></b>Sample Storage</a>
                              <ul class="dropdown-menu">
                              
                                <li class="<?php echo $disablest1; ?>"><a tabindex="-1" href="datatablest1.php">Sample Storage 1</a></li>
                                <li class="<?php echo $disablest2; ?>"><a tabindex="-1" href="datatablest2.php">Sample Storage 2</a></li>
                                
                            </ul>
                        </li>
                        
                    </ul>

                </li>

                 <li  id="summary" <?php echo (basename($_SERVER['SCRIPT_FILENAME'])=='summary.php' ? 'class="active"' : ''); ?> ><a href="summary.php"><i class="fa fa-bar-chart-o"></i>Summary</a></li>

                 <li   id="dataset" <?php echo (basename($_SERVER['SCRIPT_FILENAME'])=='dataset.php' ? 'class="active"' : ''); ?>><a href="dataset.php"><i class="fa fa-archive"></i>Datasets</a></li>              
            </ul>
      </div>
  </div>


  <!-- /page header -->
