<!-- Sidebar: System manager-->
<div class="sidebar collapse">
    <ul class="navigation animate__animated animate__fadeInLeft">
        <li <?php echo (basename($_SERVER['SCRIPT_FILENAME']) == 'home.php' ? 'class="active"' : ''); ?>>
            <a href="home.php"><i class="fa fa-home"></i> Home</a>
        </li>
        <li>
            <a href="#" class="expand" <?php
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_ed1.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_ed2.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_ss1.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_ss2.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_ss3.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_ss4.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_so1.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_so2.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_st1.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'form_st2.php' ? 'id="second-level"' : '');
                                        ?>> <i class="fa  fa-file-text"></i> Forms </a>
            <ul>
                <li class="<?php echo $disableed1; ?>"><a href="formed1.php">Experimental Design 1</a></li>
                <li class="<?php echo $disableed2; ?>"><a href="formed2.php">Experimental Design 2</a></li>
                <li class="<?php echo $disabless1; ?>"><a href="formss1.php">Sample Sorting 1</a></li>
                <li class="<?php echo $disabless2; ?>"><a href="formss2.php">Sample Sorting 2</a></li>
                <li class="<?php echo $disabless3; ?>"><a href="formss3.php">Sample Sorting 3</a></li>
                <li class="<?php echo $disabless4; ?>"><a href="formss4.php">Sample Sorting 4</a></li>
                <li class="<?php echo $disableso1; ?>"><a href="formso1.php">Sample Observation 1</a></li>
                <li class="<?php echo $disableso2; ?>"><a href="formso2.php">Sample Observation 2</a></li>
                <li class="<?php echo $disablest1; ?>"><a href="formst1.php">Sample Storage 1</a></li>
                <li class="<?php echo $disablest2; ?>"><a href="formst2.php">Sample Storage 2</a></li>
            </ul>
        </li>

        <li>
            <a href="#" class="expand" <?php

                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesed1.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesed2.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesss1.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesss2.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesss3.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesss4.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesso1.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesso2.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesst1.php' ? 'id="second-level"' : '');
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'datatablesst2.php' ? 'id="second-level"' : '');
                                        ?>> <i class="fa  fa-table"></i>Tables </a>
            <ul>

                <li class="<?php echo $disableed1; ?>"><a href="datatableed1.php">Experimental Design 1</a></li>
                <li class="<?php echo $disableed2; ?>"><a href="datatableed2.php">Experimental Design 2</a></li>
                <li class="<?php echo $disabless1; ?>"><a href="datatabless1.php">Sample Sorting 1</a></li>
                <li class="<?php echo $disabless2; ?>"><a href="datatabless2.php">Sample Sorting 2</a></li>
                <li class="<?php echo $disabless3; ?>"><a href="datatabless3.php">Sample Sorting 3</a></li>
                <li class="<?php echo $disabless4; ?>"><a href="datatabless4.php">Sample Sorting 4</a></li>
                <li class="<?php echo $disableso1; ?>"><a href="datatableso1.php">Sample Observation 1</a></li>
                <li class="<?php echo $disableso2; ?>"><a href="datatableso2.php">Sample Observation 2</a></li>
                <li class="<?php echo $disablest1; ?>"><a href="datatablest1.php">Sample Storage 1</a></li>
                <li class="<?php echo $disablest2; ?>"><a href="datatablest2.php">Sample Storage 2</a></li>

            </ul>
        </li>

        <li <?php echo (basename($_SERVER['SCRIPT_FILENAME']) == 'summary.php' ? 'class="active"' : ''); ?>>
            <a href="summary.php"><i class="fa fa-bar-chart-o"></i>Summary</a>
        </li>

        <li <?php echo (basename($_SERVER['SCRIPT_FILENAME']) == 'dataset.php' ? 'class="active"' : ''); ?>>
            <a href="dataset.php"><i class="fa fa-archive"></i> Dataset</a>
        </li>

        <li class="">
            <a href="#" class="expand" <?php
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'user_manage.php' ? 'id="second-level"' : '');
                                        ?>><i class="fa fa-user"></i> Users </a>
            <ul>
                <li><a href="user_manage.php">Manage Users</a></li>

            </ul>
        </li>

        <li class="">
            <a href="#" class="expand" <?php
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'project_manage.php' ? 'id="second-level"' : '');
                                        ?>><i class="fa fa-file"></i> Projects </a>
            <ul>
                <li><a href="project_manage.php"> Manage Project</a></li>
                <!--  <li><a href="project_repo.php">Project Repository</a></li> -->

            </ul>
        </li>

        <li><a href="#" class="expand" <?php
                                        echo (basename($_SERVER['SCRIPT_FILENAME']) == 'settings.php' ? 'id="second-level"' : '');
                                        ?>><i class="fa fa-cogs"></i> System Administration </a>
            <ul>

                <li><a href="settings.php">Customization</a></li>

            </ul>
        </li>
    </ul>


</div>
<!-- /sidebar -->