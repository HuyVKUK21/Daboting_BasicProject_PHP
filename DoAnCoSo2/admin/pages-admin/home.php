<?php
include '../database/config.php';
?>
<!-- Sale & Revenue Start -->
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <?php
        $weekRevenue = 0;
        $queryWeekRevennue = "SELECT SUM(total_money) AS total FROM `orders` WHERE WEEK(order_date) = WEEK(CURRENT_DATE)";
        $resultWeekRevenue = mysqli_query($conn, $queryWeekRevennue);
        $rowWeekRevenue = mysqli_fetch_array($resultWeekRevenue);
        if ($rowWeekRevenue['total'] != NULL) {
            $WeekRevenue = $rowWeekRevenue['total'];
        }
        ?>
        <div class="col-sm-6 col-xl-3">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-line fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Doanh thu trong tuần</p>
                    <h6 class="mb-0"><?= number_format($WeekRevenue, 0, '.', '.') ?>đ</h6>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Tổng doanh thu giảm giá</p>
                    <h6 class="mb-0">$1234</h6>
                </div>
            </div>
        </div>
        <?php
        $todayRevenue = 0;
        $queryTodayRevennue = "SELECT SUM(total_money) AS total FROM `orders` WHERE DAY(order_date) = DAY(CURRENT_DATE) AND MONTH(order_date) = MONTH(CURRENT_DATE) AND YEAR(order_date) = YEAR(CURRENT_DATE)";
        $resultTodayRevenue = mysqli_query($conn, $queryTodayRevennue);
        $rowTodayRevenue = mysqli_fetch_array($resultTodayRevenue);
        if ($rowTodayRevenue['total'] != NULL) {
            $todayRevenue = $rowTodayRevenue['total'];
        }
        ?>
        <div class="col-sm-6 col-xl-3">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-area fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Doanh thu hôm nay</p>
                    <h6 class="mb-0"><?= number_format($todayRevenue, 0, '.', '.') ?>đ</h6>
                </div>
            </div>
        </div>
        <?php
        $totalRevenue = 0;
        $queryTotalRevennue = "SELECT SUM(total_money) AS total FROM `orders`";
        $resultTotalRevenue = mysqli_query($conn, $queryTotalRevennue);
        $rowTotalRevenue = mysqli_fetch_array($resultTotalRevenue);
        if ($rowTotalRevenue['total'] != NULL) {
            $totalRevenue = $rowTotalRevenue['total'];
        }
        ?>
        <div class="col-sm-6 col-xl-3">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-pie fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Tổng doanh thu .</p>
                    <h6 class="mb-0"><?= number_format($totalRevenue, 0, '.', '.') ?>đ</h6>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Sale & Revenue End -->

<?php

?>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-sm-12 col-xl-6">
            <div class="bg-light text-center rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">Biểu đồ danh mục</h6>
    </div>
                <div id="chart"></div>
            </div>
        </div>
        <div class="col-sm-12 col-xl-6">
            <div class="bg-light text-center rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">Biểu đồ giày bán trong 1 tuần</h6>
                </div>
                <div id="chart"></div>
            </div>
        </div>
    </div>
</div>