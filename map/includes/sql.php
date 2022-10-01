<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 */

require_once('load.php');

function find_all($table)
{
  global $db;
  if (tableExists($table)) {
    return find_by_sql("SELECT * FROM " . $db->escape($table));
  }
}

function find_all_distinct($table, $dfield)
{
  global $db;
  if (tableExists($table)) {
    return find_by_sql("SELECT distinct {$db->escape($dfield)} FROM " . $db->escape($table) . " order by {$db->escape($dfield)} asc");
  }
}

function find_by_sql($sql)
{
  global $db;
  $result = $db->query($sql);
  $result_set = $db->while_loop($result);
  return $result_set;
}

function find_row_count($sql)
{
  global $db;
  $result = $db->query($sql);
  $result_count = $db->num_rows($result);
  return $result_count;
}

function find_by_($table, $field, $id)
{
  global $db;
  $id = (int)$id;
  if (tableExists($table)) {
    $sql = $db->query("SELECT * FROM {$db->escape($table)} WHERE $field='$id' LIMIT 1");
    if ($result = $db->fetch_assoc($sql))
      return $result;
    else
      return null;
  }
}

function find_all_by($table, $field, $key)
{
  global $db;
  $sql  = "SELECT * FROM {$db->escape($table)} ";
  $sql .= " WHERE $field ='{$key}'";
  return find_by_sql($sql);
}

function delete_by_($table, $field, $id)
{
  global $db;
  if (tableExists($table)) {
    $sql = "DELETE FROM " . $db->escape($table);
    $sql .= " WHERE " . $db->escape($field) . "=" . $id;
    $sql .= " LIMIT 1";
    $db->query($sql);
    return ($db->affected_rows() === 1) ? true : false;
  }
}

function delete_all($table)
{
  global $db;
  if (tableExists($table)) {
    $sql = "TRUNCATE TABLE  " . $db->escape($table);
    $result = $db->query($sql);
    return ($result) ? true : false;
  }
}


function count_by_id($table)
{
  global $db;
  if (tableExists($table)) {
    $sql    = "SELECT COUNT(id) AS total FROM " . $db->escape($table);
    $result = $db->query($sql);
    return ($db->fetch_assoc($result));
  }
}

function tableExists($table)
{
  global $db;
  $table_exit = $db->query('SHOW TABLES FROM ' . DB_NAME . ' LIKE "' . $db->escape($table) . '"');
  if ($table_exit) {
    if ($db->num_rows($table_exit) > 0)
      return true;
    else
      return false;
  }
}

function authenticate($username = '', $password = '')
{
  global $db;
  $username = $db->escape($username);
  $password = $db->escape($password);
  $sql  = sprintf("SELECT * FROM staff WHERE email ='%s' LIMIT 1", $username);
  $result = $db->query($sql);
  if ($db->num_rows($result)) {
    $user = $db->fetch_assoc($result);
    if (password_verify($password, $user['password'])) {
      return $user['staff_id'];
    }
  }
  return false;
}


function current_user()
{
  static $current_user;
  global $db;
  if (!$current_user) {
    if (isset($_SESSION['user_id'])) :
      $user_id = intval($_SESSION['user_id']);
      $sql = $db->query("SELECT * FROM staff WHERE staff_id='{$db->escape($user_id)}' LIMIT 1");
      $current_user = $db->fetch_assoc($sql);
    endif;
  }
  return $current_user;
}

function find_all_user()
{
  global $db;
  $results = array();
  $sql = "SELECT u.id,u.name,u.username,u.seculevel,u.status,u.last_login,";
  $sql .= "g.group_name ";
  $sql .= "FROM users u ";
  $sql .= "LEFT JOIN staff_groups g ";
  $sql .= "ON g.group_level=u.seculevel ORDER BY u.name ASC";
  $result = find_by_sql($sql);
  return $result;
}


function updateLastLogIn($user_id)
{
  global $db;
  $date = make_date();
  $sql = "UPDATE staff SET last_login='{$date}' WHERE staff_id ='{$user_id}' LIMIT 1";
  $result = $db->query($sql);
  return ($result && $db->affected_rows() === 1 ? true : false);
}


function find_by_groupName($val)
{
  global $db;
  $sql = "SELECT group_name FROM staff_groups WHERE group_name = '{$db->escape($val)}' LIMIT 1 ";
  $result = $db->query($sql);
  return ($db->num_rows($result) === 0 ? true : false);
}

function find_by_groupLevel($level)
{
  global $db;
  $sql = "SELECT group_level FROM staff_groups WHERE group_level = '{$db->escape($level)}' LIMIT 1 ";
  $result = $db->query($sql);
  return ($db->num_rows($result) === 0 ? true : false);
}

function page_require_level($require_level)
{
  global $session;
  $current_user = current_user();
  $login_level = find_by_groupLevel($current_user['seculevel']);
  if (!$session->isUserLoggedIn(true)) :
    $session->msg_('d', 'Please login...');
    redirect('login.php', false);
  elseif ($current_user['seculevel'] <= (int)$require_level) :
    return true;
  else :
    redirect(URL . '/error.php', false);
  endif;
}


function validate_email($var1)
{
  global $errors;
  global $db;

  $sql = "SELECT * FROM staff WHERE email = '{$db->escape($var1)}' LIMIT 1 ";
  $result = $db->query($sql);

  $snum = $db->num_rows($result);

  if ($snum === 1) {
    $errors = "Email is already used";
    return $errors;
  }
}

function validate_status($var1)
{
  global $errors;
  global $db;

  $sql = "SELECT * FROM staff WHERE email = '{$db->escape($var1)}' LIMIT 1 ";
  $result = $db->query($sql);

  $staff = $db->fetch_assoc($result);

  if ($staff['valid'] == 0) {
    $errors = "Activate Your account to Login";
    return $errors;
  } else if ($staff['status'] == 2) {
    $errors = "Your account is disabled";
    return $errors;
  }
}

function validate_captcha($var1)
{
  global $errors;

  $url = ' https://www.google.com/recaptcha/api/siteverify ';
  $pk = '6LdAa3EUAAAAAKwXqFVnn89rNvIlWvL8ibMjvWWi';

  $response = file_get_contents($url . "?secret=" . $pk . "&response=" . $var1 . "&remoteip=" . $_SERVER['REMOTE_ADDR']);

  if (!empty($var1)) {

    if ($response . success == false) {
      $errors = "Captcha Validation Failed!";
      return $errors;
    }
  } else {

    $errors = "Captcha Validation Required!";
    return $errors;
  }
}

function validate_pc($var1)
{
  global $errors;
  global $db;

  $sql = "SELECT pc FROM projectreg WHERE pc = '{$db->escape($var1)}' LIMIT 1 ";
  $result = $db->query($sql);

  if ($db->num_rows($result) === 1) {
    $errors = "Project code is already used";
    return $errors;
  }
}

function validate_exp($var1, $var2)
{
  global $errors;
  global $db;

  $sql = "SELECT * FROM projectreg WHERE pc = '{$db->escape($var1)}' and expno = '{$db->escape($var2)}' ";
  $result = $db->query($sql);

  if ($db->num_rows($result) === 1) {
    $errors = "Project code/Experiment is already used";
    return $errors;
  }
}

function validate_access($var1, $var2)
{
  global $errors;
  global $db;

  $sql = "SELECT * FROM grantproject WHERE pid = '{$db->escape($var1)}' and staff_id = '{$db->escape($var2)}' LIMIT 1 ";
  $result = $db->query($sql);

  if ($db->num_rows($result) === 1) {
    $errors = "User already has access";
    return $errors;
  }
}

function validate_rsn($var1, $var2, $var3)
{
  global $errors;
  global $db;

  $sql = "SELECT * FROM projectreg WHERE pc = '{$db->escape($var1)}' and expno = '{$db->escape($var2)}' ";
  $result = $db->query($sql);
  $staff = $db->fetch_assoc($result);

  if ($staff['rsn'] === $var3) {
    $errors = "User cant be revoked";
    return $errors;
  }
}

function gen_id()
{
  global $db;

  $sql = "SELECT staff_id FROM staff ORDER BY staff_id DESC LIMIT 1  ";
  $result = $db->query($sql);
  $result2 = $db->fetch_assoc($result);
  return ++$result2['staff_id'];
}

function gen_pro_id()
{
  global $db;
  $sql = "SELECT id FROM projectreg ORDER BY id DESC LIMIT 1  ";
  $result = $db->query($sql);
  $result2 = $db->fetch_assoc($result);
  return ++$result2['id'];
}


function historylog($action_)
{
  global $db;
  $date = make_date();
  $current_user = current_user();
  if (!empty($current_user)) {
    $id = $current_user['staff_id'];
    $name = $current_user['username'];
    $sql = "INSERT INTO history_log(user_id,user_name,action,date) VALUES('$id','$name','$action_','$date')";
    $result = $db->query($sql);
    return ($result && $db->affected_rows() === 1 ? true : false);
  }
}

function join_users_table()
{
  global $db;
  $sql  = " SELECT st.staff_id,st.fname,st.mname,st.lname,st.username,st.status,st.seculevel,st.mobinum,st.email,st.staff_group,c.name";
  $sql  .= " AS category,g.group_name AS groupname";
  $sql  .= " FROM staff st";
  $sql  .= " LEFT JOIN staffcategory c ON c.id = st.staff_group";
  $sql  .= " LEFT JOIN staff_groups g ON g.id = st.seculevel";
  $sql  .= " ORDER BY st.staff_id ASC";
  return find_by_sql($sql);
}

function join_project_table()
{
  global $db;
  $sql  = " SELECT proj.id,proj.pc,proj.expno,proj.pn,proj.esd,proj.efd,psite.site_id";
  $sql  .= " FROM projectreg proj";
  $sql  .= " LEFT JOIN projectregsite psite ON psite.projectreg_id = proj.id";
  $sql .= " WHERE proj.id > 0";
  $sql  .= " ORDER BY proj.id ASC";
  return find_by_sql($sql);
}

function join_project_table_granted($id)
{
  global $db;
  $sql  = " SELECT proj.id,proj.pc,proj.expno,proj.pn,proj.esd,proj.efd,psite.site_id";
  $sql  .= " FROM grantproject granted";
  $sql  .= " LEFT JOIN projectreg proj ON proj.id = granted.pid";
  $sql  .= " LEFT JOIN projectregsite psite ON psite.projectreg_id = proj.id";
  $sql .= " WHERE proj.id > 0 and granted.staff_id=" . $id;
  $sql  .= " ORDER BY proj.id ASC";
  return find_by_sql($sql);
}



function findsitename($val)
{
  global $db;
  $sql = "SELECT site_name FROM site WHERE site_id = '{$db->escape($val)}' LIMIT 1 ";
  $result = $db->query($sql);
  $result2 = $db->fetch_array($result);
  return $result2['site_name'];
}

function findstaffname($val)
{
  global $db;
  $sql = "SELECT username FROM staff WHERE staff_id = '{$db->escape($val)}' LIMIT 1 ";
  $result = $db->query($sql);
  $result2 = $db->fetch_array($result);
  return $result2['username'];
}

function findsiteid($val)
{
  global $db;
  $sql = "SELECT site_id FROM projectregsite WHERE projectreg_id = '{$db->escape($val)}' LIMIT 1 ";
  $result = $db->query($sql);
  $result2 = $db->fetch_array($result);
  return $result2['site_id'];
}

function getcolumnname($projectcode, $table, $table2)
{
  global $db;
  $col = "";
  $query = "SELECT * FROM " . $table . " WHERE pc='" . $projectcode . "' AND ft='" . $table2 . "'";
  $result = $db->query($query);
  $num_row = mysqli_num_rows($result);
  if ($num_row == 1) {
    //fetch data from query executed above
    $row = mysqli_fetch_array($result);

    $_SESSION["SESS_P_ATTRI"] = $row["p_attri"];
    $col =   $row["p_attri"];
  }
  return $col;
}

function getcolumnname2($projectcode, $table, $table2)
{
  global $db;
  $col = "";
  $query = "SELECT * FROM " . $table . " WHERE pc='" . $projectcode . "' AND ft='" . $table2 . "'";
  $result = $db->query($query);
  $num_row = mysqli_num_rows($result);
  if ($num_row == 1) {
    //fetch data from query executed above
    $row = mysqli_fetch_array($result);
    $_SESSION["SESS_P_ATTRI"] = $row["p_attri"];
    $col =   $row["p_attri2"];
  }
  return $col;
}


function cust_formtype($table, $projectcode)
{
  global $db;

  $query = "SELECT * FROM {$db->escape($table)} WHERE pc='" . $projectcode . "' LIMIT 3";
  $result = $db->query($query);

  $ft = array();
  while ($row = $result->fetch_assoc()) {
    $ft[] = $row['ft'];
  }
  return $ft;
}
