// ignore_for_file: constant_identifier_names

class APIRouteEndpoint {
  static const String DUMMY_PERSON = 'https://i.pravatar.cc/300';
  static const String WEB_URL = "";

  // static const String BASE_URL = "http://192.168.0.249:8000/";
  // static const String BASE_URL = "https://apilife.iconshopper.com.bd/";
  static const String BASE_URL = "https://iconshopper.demoff.xyz/";
  // static const String IMAGE_BASE_URL = "https://life.iconshopper.com.bd/";
  static const String IMAGE_BASE_URL = "https://iconshopper.demoff.xyz/";
  static const String API_V1 = "api/";
  static const String IMAGE_SUBSTRING = "storage/";
  static const String PRODUCT_IMAGE = "${IMAGE_SUBSTRING}product/";

  //#<<---------------- AUTH ------------------>>
  static const String SIGN_UP = "${API_V1}registration";
  static const String VERIFY_OTP = "${API_V1}otp/verify";
  static const String LOGIN = "${API_V1}login";
  static const String PROFILE_VIEW = "${API_V1}my-profile";
  static const String PROFILE_UPDATE = "${API_V1}update-profile";
  static const String PASSWORD_CHANGE = "${API_V1}change-password";

  //#<<---------------- IconShopper ------------------>>

  static const String CONTACT_INFO = "${API_V1}contact-info";
  static const String TERMS_CONDITION = "${API_V1}terms-condition";
  static const String PRIVACY_POLICY = "${API_V1}privacy-policy";
  static const String REFUND_POLICY = "${API_V1}refund-policy";
  static const String RETURN_POLICY = "${API_V1}return-policy";

  static const String HOME = "${API_V1}get-categories";
  static const String SEARCH = "${API_V1}search/";

  //#<<---------------- Product ------------------>>
  static const String PRODUCT_DETAILS = "${API_V1}get-product-details/";
  static const String CATEGORY_WISE_PRODUCT = "${API_V1}category-wise-product/";
  static const String SIMILAR_PRODUCT = "${API_V1}similar-products/";
  static const String PRODUCT_STOCK = "${API_V1}product/showrooms-stock/";

  //#<<---------------- Order ------------------>>
  static const PLACE_ORDER = "${API_V1}checkout";
  static const COUPON_CHECK = "${API_V1}coupon-code-check";
  static const DELIVERY_CHARGE = "${API_V1}delivery-charge";
  static const ORDER_LIST = "${API_V1}ecom-order-list?page=";
}
