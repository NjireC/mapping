<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

include_once('includes/load.php');

if (isset($_POST['auditdetail'])) {

	$prefixtable = $_SESSION['expcode'] . "_";
	$audit_trail = $prefixtable . "audit_trail";

	$kid = $_POST['keyid'];


	$ki = explode(':', $kid);
	$kid1 = $ki[0];
	$kid2 = $ki[1];

	$sql = "SELECT auditformtype,audituser,auditdate,auditaction,auditdetail,CONCAT(auditsen,':',auditfr) AS keyid FROM " . $audit_trail . " as audit WHERE auditsen ='{$kid1}' and auditfr='{$kid2}'";

	$audits = find_by_sql($sql);  ?>

	<tr>
		<th>Sen:Fr</th>
		<th>Username</th>
		<th>Date</th>
		<th>Action</th>
		<th>Detail</th>
	</tr>

	<?php foreach ($audits as $audit) : ?>
		<tr>
			<td><?php echo remove_junk(ucfirst($audit['keyid'])); ?></td>
			<td><?php echo remove_junk(ucfirst($audit['audituser'])); ?></td>
			<td><?php echo remove_junk(ucfirst($audit['auditdate'])); ?></td>
			<td><?php echo remove_junk(ucfirst($audit['auditaction'])); ?></td>
			<td><?php echo remove_junk(ucfirst($audit['auditdetail'])); ?></td>
		</tr>
	<?php endforeach; ?>


<?php	}  ?>