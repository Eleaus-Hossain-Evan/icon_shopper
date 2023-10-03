class AppStrings {
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
  static const String address = "Address";
  static const String hubDetail = "Hub Detail";
  static const String phoneNumberOrEmail = "Phone Number or Email";
  static const String contactUs = "Contact Us";
  static const String privacyPolicy = "Privacy & Policy";
  static const String bankDetail = "Bank Detail";
  static const String otherPaymentMethod = "Other Payment Methods";
  static const String bKashNumber = 'BKash Number';
  static const String nahadNumber = 'Nagad Number';
  static const String rocketNumber = 'Rocket Number';
  static const String updateHub = "Update Hub";
  static const String support = "Support";
  static const String choiceImageSource = "Choice Image Source";
  static const String fromCamera = "From Camera";
  static const String fromGallery = "From Gallery";
  static const String bankDetails = "Bank Details";
  static const String accountHolder = "Account Holder";
  static const String bankName = "Bank Name";
  static const String branchCode = "Branch Code";
  static const String routingNumber = "Routing Number";
  static const String accountNumber = "Account Number";
  static const String currentPassword = "Current Password";
  static const String newPassword = "New Password";
  static const String defaultPayment = "Default Payment";
  static const String defaultPaymentProcessForCustomer =
      'Default Payment Process for Customer';
  static const String paymentStyle = "Payment Style";
  static const String pickupStyle = "Pickup Style";
  static const String pickupStyleOptions = "Pickup Style Options";
  static const String paymentOptions = "Payment Options";
  static const String personalInfo = "Personal Info";
  static const String myShop = "My Shop";
  static const String charges = "Charges";

  //#----------------  Notification ----------------
  static const String notifications = "Notifications";

  //#----------------  Auth ----------------
  static const String signUp = "Sign Up";
  static const String login = "Sign In";
  static const String signupBelowText =
      "Press the signup button for create a new account";
  static const String loginBelowText =
      "Press the login button for logged into the app";
  static const String remember = "Remember Me";
  static const String forgotPassword = "Forgot Password";
  static const String forgotBelowText =
      "Enter you number to get OTP for resetting you password";
  static const String dontHaveAccount = "Don't have account yet?";
  static const String alreadyHaveAccount = "Already have an Account";
  static const String createAccount = "Create Account";
  static const String orSignUpWith = "or Sign up with";
  static const String signUpPrivacyPolicy =
      "By clicking Sign Up, you agree to our Terms of Use and our Privacy Policy.";
  static const String reTypePassword = "Re-Type Password";
  static const String notMatch = "Password doesn't match";
  static const String sendOtp = "Send OTP";

  //#----------------  Parcel ----------------
  static const String parcel = "Parcel";
  static const String deliveryInformation = "Delivery Information";
  static const String parcelInformation = "Parcel Information";
  static const String createParcel = "Create Parcel";
  static const String updateParcel = "Update Parcel";
  static const String description = "Description";
  static const String cashCollection = "Cash Collection";
  static const String category = "Category";
  static const String selectCategory = "Select Category";
  static const String materialType = "Material Type";
  static const String selectMaterialType = "Select Material Type";
  static const String productPrice = "Product Price";
  static const String productWeight = "Product Weight";
  static const String selectProductWeight = "Select Product Weight";
  static const String merchantInfo = "Merchant Information";
  static const String shop = "Shop";
  static const String invoiceNo = "Invoice no.";
  static const String selectArea = "Select Area";
  static const String selectDistrict = "Select District";
  static const String addressInformation = "Address Information";
  static const String customerInformation = "Customer Information";
  static const String createNewParcel = 'Create New Parcel';
  static const String search = "Search";
  static const String merchantInformation = "Merchant Information";
  static const String noShopSelected = "No Shop Selected";
  static const String otherInformation = "Other Information";
  static const String deliveryCharge = "Delivery Charge";
  static const String codCharge = "COD Charge";
  static const String weightCharge = "Weight Charge";
  static const String trackParcel = "Track Parcel";
  static const String createAnother = "Create Another";
  static const String yourParcelHasBeenCreatedSuccessfully =
      "Your parcel has been created successfully";
  static String youCanTruckYourParcel(String id) =>
      "You can track your parcel with tracking id: #$id";

  //#----------------  Payment ----------------
  static const String payment = "Payment";
  static const String pendingPayment = "Pending Payment";

  //#----------------  Return ----------------
  static const String returns = "Return";
}
