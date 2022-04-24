<?php

$svrname = "localhost":
$uname = "root";
$pswd = "Phantom0812";
$db = "SoftEngDbs";

//create connection with database
$conn = new mysqli($svrname, $uname, $pswd,$db);

//check if connection exist

if($conn->connect_error){
    die("Connection failed: " . $conn->connect_error);
    
}