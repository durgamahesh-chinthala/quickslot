// ignore_for_file: constant_identifier_names

class ApiConstants {
  const ApiConstants._();

  // Network Messages
  static const String NO_INTERNET_MESSAGE = 'Oops No Internet';
  static const String NO_NETWORK = 'no_network';
  static const String PLEASE_TRY_AGAIN = 'please_try_again';

  // API Response Keys
  static const String MESSAGE = 'message';
  static const String STATUS = 'status';
  static const String ERROR = 'error';
  static const String DATA = 'data';

  // Timeouts
  static const int TIME_DURATION = 55;
  static const int MIN_LOGIN_COUNT = 4;

  // HTTP Headers
  static const String CONTENT_TYPE = 'Content-Type';
  static const String ACCEPT = 'Accept';
  static const String AUTHORIZATION = 'Authorization';
  static const String SET_COOKIE = 'set-cookie';
  static const String S_JWT_TOKEN = 's-jwt-token';
  static const String APPLICATION_JSON = 'application/json';
  static const String KEY_METHOD = 'key-method';
  static const String KEY_VALUE = 'key-value';
  static const String LOGIN_TYPE = 'login-type';
  static const String API = 'API';

  // Storage Keys
  static const String BARRIER_PREFS = 'barrier';
  static const String JWT_TOKEN_PREFS = 'jwtToken';
  static const String COOKIE_PREFS = 'cookie';

  // Environment URLs
  static const String PROD_BASE_URL = 'https://app.salary24x7.com/';
  // Local development default (Android emulator uses 10.0.2.2)
  static const String DEV_BASE_URL = 'http://10.0.2.2:8080/';
  static const String DEMO_BASE_URL = 'https://app.salary247.merusphere.com/';

  static const String LOCAL_HOST_URL = 'localhost';

  // Environment Names
  static const String PROD = 'PROD';
  static const String DEMO = 'DEMO';
  static const String DEV = 'DEV';

  // HTTP Methods
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String PUT = 'PUT';
  static const String PATCH = 'PATCH';
  static const String DELETE = 'DELETE';

  // Error Types
  static const String SESSION_EXPIRED = 'SESSION_EXPIRED_EXCEPTION';
  static const String INVALID_BASE_URL = 'INVALID_BASE_URL';
  static const String LOGIN_ATTEMPTS_TOO_MANY = 'LOGIN_ATTEMPT_TO_MANY_TIMES';

  // HTTP Status Codes
  static const int STATUS_OK = 200;
  static const int STATUS_CREATED = 201;
  static const int STATUS_BAD_REQUEST = 400;
  static const int STATUS_UNAUTHORIZED = 401;
  static const int STATUS_FORBIDDEN = 403;
  static const int STATUS_NOT_FOUND = 404;
  static const int STATUS_SERVER_ERROR = 500;

  // Cache Configuration
  static const int CACHE_MAX_AGE = 3600; // 1 hour in seconds
  static const bool CACHE_FORCE_REFRESH = false;

  static const String VALID_OTP = "valid-otp";

  static const String USER_LANG = "user-lang";
}
