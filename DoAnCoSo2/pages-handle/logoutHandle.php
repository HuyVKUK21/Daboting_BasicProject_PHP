<?php
    session_start();

    session_unset();

    session_destroy();

    header("location: ../user/index.php?page=Login");
?>