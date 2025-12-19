class APpLink {
  static const String server = "http://192.168.1.102/ecomers";
  static const String test = "$server/test.php";

  //http://localhost/ecomers/uploadImages/categories/
  //http://10.0.2.2/ecomers/uploadImages/Items/mobile.jpg

  static const String imageStatic = "$server/uploadImages";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/Items";

  //auth
  static const String signUp = '$server/auth/sign_up.php';
  static const String virfiycode = '$server/auth/virfiycode.php';
  static const String login = '$server/auth/login.php';
  static const String reSend = '$server/auth/resend.php';

  //http://localhost/ecomers/auth/checkemail.php
  static const String checkEmail = '$server/auth/checkemail.php';
  static const String virfiycodeforgetpass =
      '$server/auth/virfiycodeforgetpass.php';
  static const String resetpassword = '$server/auth/resetpassord.php';

  static const String home = '$server/home.php';

  //http://localhost/ecomers/categories/items/items.php
  //http://localhost/ecomers/items/items.php
  static const String items = "$server/items/items.php";
  static const String serch = "$server/items/serch.php";

  static const String addFavorite = "$server/favorite/add.php";
  static const String removeFavorite = "$server/favorite/delete.php";
  static const String viewFavorite = "$server/favorite/view.php";
  static const String deleteFromFavorite =
      "$server/favorite/deletefromFavorite.php";

  //http://localhost/ecomers/cart/
  //http://localhost/ecomers/cart/add.php
  static const String addCart = "$server/cart/add.php";
  static const String removeCart = "$server/cart/remove.php";
  static const String viewCart = "$server/cart/view.php";
  static const String countItemsCart = "$server/cart/getcountItems.php";

  static const String addAdress = "$server/address/add.php";
  static const String removeAddress = "$server/address/delete.php";
  static const String viewAddress = "$server/address/view.php";
  static const String editAddress = "$server/address/edit.php";

  static const String checkCoupon = "$server/coupon/checkCoupon.php";

  static const String checkout = "$server/order/checkout.php";
  static const String pindingorder = "$server/order/pinding.php";
  static const String archiveorder = "$server/order/archive.php";
  static const String orderDetails = "$server/order/details.php";
  static const String orderDelete = "$server/order/delete.php";

  // http://localhost/ecomers/notifcation/notifyvtionview.php
  static const String notifyction = "$server/notifyvtionview.php";

  static const String offers = "$server/offers.php";
    static const String rating = "$server/rating.php";

}
