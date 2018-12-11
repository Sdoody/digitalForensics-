<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.navbar {
    overflow: hidden;
    background-color: #333;
    font-family: Arial, Helvetica, sans-serif;
}

.navbar a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.dropdown {
    float: left;
    overflow: hidden;
}

.dropdown .dropbtn {
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<body>

<div class="navbar">
  <a href="homePage.html">Gregs</a>
  <div class="dropdown">
    <button class="dropbtn">Dropdown 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="show_employees.php">List Employees</a>
      <a href="search_employee.html">Search Employee</a>
      <a href="new_employees.html">Add Employees</a>
    </div>
  </div> 
</div>

</head>

<body>
    <main role="main" class="container-fluid">
	<h1>Remove Employee</h1>
<?php
    $EmployeeID=$_GET["EmployeeID"];
   
    //connect to the database
    
    @$db = new mysqli('localhost', 'Teacher', 'password', 'grocery');


    if ($db->connect_error) {
        die('Connect Error ' . $db->connect_errno . ': ' . $db->connect_error);
    }


    $query = "Delete from employee where EmployeeID=?";
    $stmt = $db->prepare($query);
    $stmt->bind_param("s", $EmployeeID);
    $stmt->execute();
    echo $stmt->affected_rows." Employee deleted from database";

    $db->close();
?>

    <br/
    ><a href="show_employees.php">Show Employee</a>
    
    
</main>
</body>

</html>
