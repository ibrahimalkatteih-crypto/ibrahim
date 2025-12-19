<?php


include "connect.php";

// include "notifcation/function.php"; // أو المسار الصحيح للملف اللي فيه الدالة

$result = sendGCM(
    "عنوان الإشعار التجريبي",
    "إبراهيم",
    "brro", // اسم الـ Topic
    "",
    ""
);

echo json_encode($result);