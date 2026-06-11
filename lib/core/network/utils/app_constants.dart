/// Application-wide constants
library;
// ignore_for_file: non_constant_identifier_names

class AppConstants {
  const AppConstants._(); // Prevent instantiation

  /// Language and localization constants
  static String LOCALE = "locale_language";
  static const String FLUTTER_FLAVOR = "FLUTTER_FLAVOR";
  static const String PROD = "PROD";
  static String COMPANY_CODE = "SAL247";

  /// Application name
  static String APP_NAME = 'Salary 24x7';

  /// Authentication related preferences
  static String AUTHORIZATION_PREFS = "authorization";
  static String SET_COOKIE_PREFS = "set-cookie";
  static String S_JWT_TOKEN_PREFS = "s-jwt-token";
  static String KEY_METHOD_PREFS = "key-method";
  static String KEY_VALUE_PREFS = "key-value";

  static String AADHAAR_NUMBER_PREFS = "aadhaarNumber";
  static String USER_NAME_PREFS = "userName";
  static String USER_ID_PREFS = "userId"; // UUID from user session
  static String PASSWORD_PREFS = "password";

  //context prefs constants
  static String POD_ID_PREFS = "podId";
  static String COMPANY_ID_PREFS = "companyId";
  static String ZONE_ID_PREFS = "zoneId";
  static String BRANCH_ID_PREFS = "branchId";
  static String TELLER_ID_PREFS = "tellerId";
  static String LINER_ID_PREFS = "linerId";

  static String POD_NAME_PREFS = "podName";
  static String COMPANY_NAME_PREFS = "companyName";
  static String ZONE_NAME_PREFS = "zoneName";
  static String BRANCH_NAME_PREFS = "branchName";
  static String TELLER_NAME_PREFS = "tellerName";
  static String LINER_NAME_PREFS = "linerName";

  static String PROJECT_ID_PREFS = "projectId";
  static String PROJECT_NAME_PREFS = "projectName";

  //teamId constants
  static String TEAM_ID_PREFS = "teamId";

  /// Permission types
  static String VIEW = "VIEW";
  static String REMOVE = "REMOVE";
  static String ACTIVATE = "ACTIVATE";
  static String VIEW_AND_UPDATE = "VIEW_AND_UPDATE";
  static String CREATE = "CREATE";
  static String SESSION_ORG_TYPE = "SESSION_ORG_TYPE";
  static String CTX_ORG_TYPE = "CTX_ORG_TYPE";

  //cache preferences....
  static String CRUD_TYPE = "crudTypePrefs";
  static String FEATURE_ID = "featureIDPrefs";

  //API RESPONSE CONSTANTS
  static String SUCCESS_EXCEPTION = "SuccessException"; //200 Error code

  static String BAD_REQUEST_EXCEPTION = "BadRequestException"; //400 Error code
  static String UNAUTHORISED_EXCEPTION = "UnauthorisedException";

  //401 Error code
  static String FORBIDDEN_EXCEPTION = "ForbiddenException"; //403 Error code
  static String NOTFOUND_EXCEPTION = "NotFoundException"; //404 Error code
  static String METHOD_NOT_ALLOWED_EXCEPTION =
      "MethodNotAllowedException"; //405 Error code
  static String TEMPORARY_REDIRECT_EXCEPTION =
      "TemporaryRedirectException"; //307 Error code
  static String INTERNAL_SERVER_EXCEPTION =
      "InternalServerException"; //500 Error code
  static String GATEWAY_TIME_EXCEPTION =
      "GateWayTimeException"; //504 Error code

  static int MAX_PAYSLIPS_UPLOAD = 3;
  static int MAX_BANK_STATEMENTS_UPLOAD = 3;
  static int MAX_ADDRESS_PROOF_UPLOAD = 1;

  static String MPIN_PREFS = "mpin";
  static int MPIN_LENGTH = 6;

  static String APP_LANGUAGE_CODE_PREFS = "appLanguageCode";
  static String APP_LANGUAGE_COUNTRY_CODE_PREFS = "appLanguageCountryCode";

  static String DIGI_LOCKER_CLIENT_ID_PREFS = "client_id";
  static String DIGI_LOCKER_TOKEN_PREFS = "token";
  static String DIGI_LOCKER_URL_PREFS = "digilocker_url";
  static String CLIENT_ID_ISSUED_TIME_PREFS = "client_id_issued_time";
  static String KYC_TYPE_PREFS = "kyc_type";

  static String WALKTHROUGH_PREFS = "walkthrough_prefs";
  static String PERMISSION_PREFS = "permission_prefs";

  static String DEVICE_TOKEN_PREFS = "device_token_prefs";
  static String OS_TYPE_PREFS = "os_type_prefs";
  static String OS_VERSION_PREFS = "os_version_prefs";

  static String LATITUDE_PREFS = "latitude_prefs";
  static String LONGITUDE_PREFS = "longitude_prefs";

  static String EMP_LATITUDE_PREFS = "emp_latitude_prefs";
  static String EMP_LONGITUDE_PREFS = "emp_longitude_prefs";

  static String CURRENT_LOAN_ID_FOR_ENACH_WEB_PREFS =
      "current_loan_id_for_enach_web_prefs";

  static String COMPANY_CONFIG_TYPE_PREFS = "company_config_type_prefs";

  // Enach
  static String MERCHANT_CODE_PREFS = "merchant_code_prefs";
  static String CONSUMER_ID_PREFS = "consumer_id_prefs";
  static String TXN_ID_PREFS = "txn_id_prefs";
  static String ENACH_TOKEN_PREFS = "enach_token_prefs";

  static const String JPG = "JPG";
  static const String JPEG = "JPEG";
  static const String PNG = "PNG";
  static const String GIF = "GIF";
  static const String PDF = "PDF";
}

class Currency {
  static String RUPEE = "\u20B9"; // ₹
  static String DOLLAR = "\u0024"; // $
  static String POUND = "\u00A3"; // £
  static String APP_CURRENCY = RUPEE;
}
