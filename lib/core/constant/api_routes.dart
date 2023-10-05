// ignore_for_file: constant_identifier_names

class APIRoute {
  static const String DUMMY_PERSON = 'https://i.pravatar.cc/300';
  static const String WEB_URL = "";

  static const String BASE_URL = "https://iconshopper.demoff.xyz/";
  // static const String BASE_URL = "https://api.senaiyah.com/";
  // static const String BASE_URL_LOCAL = "http://192.168.68.118:3697/";
  static const String API_V1 = "api/";

  //#<<---------------- AUTH ------------------>>
  static const String SIGN_UP = "${API_V1}registration";
  static const String VERIFY_OTP = "${API_V1}otp/verify";
  static const String LOGIN = "${API_V1}login";
  static const String PROFILE_VIEW = "${API_V1}my-profile";
  static const String PROFILE_UPDATE = "${API_V1}update-profile";
  static const String PASSWORD_CHANGE = "${API_V1}change-password";

  //#<<---------------- IconShopper ------------------>>

  static const String HOME = "${API_V1}setting/home";
}
