class AppLink {
  static const String server = "http://10.0.2.2/ecomers";

  // http://localhost/ecomers/delivery/auth/dilvery_login.php
  static const String login = "$server/delivery/auth/dilvery_login.php";
  // http://localhost/ecomers/delivery/auth/checkEmail.php
  static const String checkEmail = "$server/delivery/auth/checkEmail.php";

  static const String resend = "$server/delivery/auth/resend.php";

  static const String resetPassord = "$server/delivery/auth/reset_password.php";
  static const String virfyCode = "$server/delivery/auth/virfycode.php";

  static const String pindingorder = "$server/delivery/order/pindind.php";
  static const String archiveorder = "$server/delivery/order/archive.php";
  static const String orderDetails = "$server/delivery/order/details.php";
  static const String orderaccepted = "$server/delivery/order/accepted.php";
  static const String approveOrder = "$server/delivery/order/approve.php";
  static const String doneOrder = "$server/delivery/order/done.php";
}
