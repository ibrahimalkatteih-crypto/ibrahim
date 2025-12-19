class AppLink {
  static const String server = "http://10.0.2.2/ecomers";

  // http://localhost/ecomers/delivery/auth/dilvery_login.php
  static const String login = "$server/admin/auth/admin_login.php";
  // http://localhost/ecomers/delivery/auth/checkEmail.php
  static const String checkEmail = "$server/admin/auth/checkEmail.php";

  static const String resend = "$server/admin/auth/resend.php";

  static const String resetPassord = "$server/admin/auth/reset_password.php";
  static const String virfyCode = "$server/admin/auth/virfycode.php";

  static const String approveOrder = "$server/admin/orders/approve.php";
  static const String archiveorder = "$server/admin/orders/archive.php";
  static const String prepperOrder = "$server/admin/orders/preper.php";
  static const String pindingorder = "$server/admin/orders/pinding.php";
  static const String orderaccepted = "$server/admin/orders/accepted.php";
  static const String orderDetails = "$server/admin/orders/details.php";


    static const String notifyction = "$server/notifyvtionview.php";


  static const String addCatigories = "$server/admin/catigories/add.php";
  static const String deletCatigories = "$server/admin/catigories/delete.php";
  static const String editCatigories = "$server/admin/catigories/edit.php";
  static const String viewCatigories = "$server/admin/catigories/view.php";

  static const String addItems = "$server/admin/items/add.php";
  static const String deletItems = "$server/admin/items/delete.php";
  static const String editItems = "$server/admin/items/edit.php";
  static const String viewItems = "$server/admin/items/view.php";

  static const String imageStatic = "$server/uploadImages";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/Items";




    static const String allUsers = "$server/allusers.php";

}
