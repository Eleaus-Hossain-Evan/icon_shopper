class AppStrings {
  static String locale = 'local';

  static String themeData = 'themeData';

  AppStrings._();

  static const String appName = 'Courier Delivery App';
  static const String token = 'token';
  static const String user = 'user';
  static const String firebaseToken = 'firebaseToken';
  static const String onBoard = "onBoard-key";
  static const String cacheBox = 'cacheBox';
  static const String tkSymbol = "\u{09F3}";
  static const String theme = "theme";

  static const String cancel = "Cancel";

  //#----------------  Home ----------------
  static const String home = "Home";
  static String welcome(String user) => "Welcome $user";
  static const String todayDelivery = "Today's Deliveries";
  static const String viewAll = "View all";
  static const String pendingDelivery = "Pending Delivery";
  static const String cancelDelivery = "Cancel Delivery";
  static const String completedDelivery = "Completed Delivery";
  static const String trackingNumber = "Tracking Number";

  //#----------------  Profile ----------------
  static const String profile = "Profile";
  static const String password = "Password";
  static const String changePassword = "Change Password";
  static const String logout = "Logout";
  static const String save = "Save";
  static const String name = "Name";
  static const String email = "Email";
  static const String phoneNumber = "Phone Number";
  static const String gender = "Gender";
  static const String information = "Information";
  static const String address = "Address";
  static const String hubDetail = "Hub Detail";
  static const String phone = "Phone Number";
  static const String support = "Support";
  static const String termCondition = "Terms & Condition";
  static const String privacyPolicy = "Privacy & Policy";
  static const String refundPolicy = "Refund Policy";
  static const String returnPolicy = "Return Policy";
  static const String otherPaymentMethod = "Other Payment Methods";
  static const String choiceImageSource = "Choice Image Source";
  static const String fromCamera = "From Camera";
  static const String fromGallery = "From Gallery";
  static const String currentPassword = "Current Password";
  static const String newPassword = "New Password";

  //#----------------  Notification ----------------
  static const String notifications = "Notifications";

  //#----------------  Auth ----------------
  static const String register = "Register";
  static const String login = "Login";
  static const String toIconShopper = "to Icon Shopper";
  static const String signUpBelowText =
      "Enter the credentials and press the Register button for create a new account";
  static const String rememberMe = "Remember Me";
  static const String forgotPassword = "Forgot Password";
  static const String forgotBelowText1 =
      "Enter you number to get OTP for resetting your password.";
  static const String forgotBelowText2 = "Enter your new password.";
  static const String dontHaveAccount = "Don't have account yet?";
  static const String alreadyHaveAccount = "Already have an Account";
  static const String orSignUpWith = "or Sign up with";
  static const String signUpPrivacyPolicy =
      "By clicking Sign Up, you agree to our Terms of Use and our Privacy Policy.";
  static const String reTypePassword = "Re-Type Password";
  static const String notMatch = "Password doesn't match";
  static const String sendOtp = "Send OTP";

  //#----------------  Profile ----------------
  static const String updateProfile = "Update Profile";

  //#----------------  Checkout ----------------

  static var enterCoupon = "Enter Coupon";
  static var promoCodeEnter = "Please enter the coupon code if you have any";

  static var apply = "Apply";

  static var checkout = "Checkout";

  static var subTotal = "Sub Total";

  static var discount = "Discount";

  static var deliveryCharge = "Delivery Charge";

  static var total = "Total";
}
