<?php
    $servernameConn = "localhost";
    $usernameConn = "root";
    $passwordConn = "";
    $dbnameConn = "doancoso2";
    $conn = mysqli_connect($servernameConn, $usernameConn, $passwordConn, $dbnameConn);
    mysqli_set_charset($conn, 'utf8');
?>