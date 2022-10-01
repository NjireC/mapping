<?php include_once('../includes/load.php');

page_require_level(2);

if (!empty($current_user)) {

    $staff_id = $current_user['staff_id'];
    $fname = $current_user['fname'];
    $lname = $current_user['lname'];
    $name = $fname . " " . $lname;
}


if (isset($_POST['grant'])) {

    $req_fields = array('pc', 'pn', 'expno');
    validate_fields($req_fields);

    if ($accessst == 1) {
        validate_access($_POST['pid'], $_POST['rsn']);
    }


    $datecreated = make_date();

    $accessst   = remove_junk($db->escape($_POST['accessst']));
    $user   = remove_junk($db->escape($_POST['rsn']));
    $pid = $_POST['pid'];


    if (empty($errors)) {


        $pn   = remove_junk($db->escape($_POST['pn']));
        $pc   = remove_junk($db->escape($_POST['pc']));
        $exp  = remove_junk($db->escape($_POST['expno']));



        switch ($accessst) {
            case 1:

                validate_access($pid, $user);

                if (empty($errors)) {
                    $query = "INSERT INTO grantproject (";
                    $query .= "pid,staff_id, created_by, datecreated";
                    $query .= ") VALUES (";
                    $query .= "'{$pid}','{$user}', '{$staff_id}', '{$datecreated}'";
                    $query .= ")";

                    if ($db->query($query)) {
                        //sucess
                        $session->msg_("s", "Access granted to user");
                        historylog("User {$user} granted access project {$pid} ");
                        redirect('../project_manage.php', false);
                    } else {
                        //failed
                        $session->msg_("d", "Failed to add experiment!");
                        redirect('../project_manage_grantac.php', false);
                    }
                } else {
                    $session->msg_("d", $errors);
                    redirect('../project_manage_grantac.php?id=' . $pid, false);
                }

                break;
            case 2:

                validate_rsn($pc, $exp, $user);

                if (empty($errors)) {

                    $sql = "DELETE FROM grantproject";
                    $sql .= " WHERE  pid=" . $pid;
                    $sql .= " AND  staff_id=" . $user;
                    $result = $db->query($sql);

                    if ($result) {
                        $session->msg_("s", "Access revoked to user");
                        historylog("User {$user} revoked access project {$pid} ");
                        redirect('../project_manage.php', false);
                    } else {
                        $session->msg_("s", "User do not have access");
                        redirect('../project_manage.php', false);
                    }
                } else {
                    $session->msg_("d", $errors);
                    redirect('../project_manage_grantac.php?id=' . $pid, false);
                }

                break;
        }
    } else {
        $session->msg_("d", $errors);
        redirect('../project_manage_grantac.php?id=' . $pid, false);
    }
}
