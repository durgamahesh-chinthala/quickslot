// ignore_for_file: constant_identifier_names

class ApiEndPoints {
  const ApiEndPoints._();

  // API Version
  static const String API_VERSION = '1';
  static const String API_PREFIX = 'api';
  static const String API_BASE_PATH = '$API_PREFIX/$API_VERSION';
  // static const String LOAN_BASE_PATH = "$API_BASE_PATH/LoanProduct";
  static const String LOAN_BASE_PATH = "$API_BASE_PATH/LoanData";
  static const String LEDGER_BASE_PATH = "$API_BASE_PATH/Ledger";

  // Common Path Components
  static const String USER_PATH = '$API_BASE_PATH/User';
  static const String BORROWER_PATH = '$API_BASE_PATH/Borrower';

  // Enach base path
  static const String ENACH_BASE_PATH = '$API_BASE_PATH/Enach';

  // Authentication Endpoints
  static const String LOGIN = '$API_PREFIX/login';
  static const String LOGOUT = '$API_PREFIX/logout';
  static const String USERNAME_API_LOGIN = "api/username/auth";
  static const String USERNAME_API_LOGIN_OTP = "api/username/auth/otp";

  // Context Endpoints
  static const String CONTEXT = '$API_BASE_PATH/CtxDto';
  static const String USER_SESSION_READ = '$API_BASE_PATH/UserSessionDto';

  // Captcha
  static const String CAPTCHA_URL = "apu/captcha.jpg";

  // Sing Up Endpoints
  static const String BORROWER_KYC = "$BORROWER_PATH/signup";

  // Login Endpoints
  static const String MOBILE_API_LOGIN = "/apu/mobile/auth";
  // Home Endpoints
  static const String URI_HOME_SUMMARY_ENUMS =
      "$API_BASE_PATH/DashboardSummary/enums";
  static const String URI_HOME_SUMMARY = "$API_BASE_PATH/DashboardSummary";

  // Loan
  static const String LOAN_PRODUCT_LIST = "$API_BASE_PATH/LoanProduct/list";
  static const String URI_LOAN_DATA_CREATE_SALARY_247 =
      "$LOAN_BASE_PATH/create/salary247";
  static const String URI_LOAN_DATA_UPDATE_SALARY_247 =
      "$LOAN_BASE_PATH/update/salary247";
  static const String URI_LOAN_APPROVE_SALARY_247_GEN_OTP =
      "$LOAN_BASE_PATH/approve/salary247/otp";
  static const String URI_LOAN_APPROVE_SALARY_247_VERIFY_OTP =
      "$LOAN_BASE_PATH/approve/salary247/verofyOtp";
  static const String URI_LOAN_DATA_READ = LOAN_BASE_PATH;
  static const String URI_API_LOAN_AGREEMENT_READ = "$LOAN_BASE_PATH/agreement";
  static const String URI_API_LOAN_DENY_REQUEST = "$LOAN_BASE_PATH/cancel";

  static const String URI_INITIALIZE_DIGI_LOCKER =
      "$API_BASE_PATH/Digilocker/initialize";

  static const String URI_BORROWER_KYC_CREATE = "$API_BASE_PATH/Borrower/kyc";
  static const String URI_BORROWER_KYC_STATUS =
      "$API_BASE_PATH/Borrower/kyc/status";
  static const String URI_LOAN_DOCUMENT_READ = "$LOAN_BASE_PATH/document";
  static const String URI_BORROWER_LOAN_DOC_READ =
      "$API_BASE_PATH/Borrower/loandoc";

  // Language Endpoint
  static const String URI_USER_LANGUAGE_UPDATE = "$API_BASE_PATH/User/language";

  static const String URI_BORROWER_EMPLOYMENT_STATUS =
      "$API_BASE_PATH/Borrower/employment/status";

  static const String URI_BORROWER_KYC_BANK_DETAILS =
      "$API_BASE_PATH/Borrower/kyc/bank/details";

  static const String URI_BORROWER_KYC_READ = "$API_BASE_PATH/Borrower/kyc";
  static const String URI_BORROWER_READ_PIC = "$API_BASE_PATH/Borrower/pic";

  // Support Data Endpoints
  static const String SUPPORT_DATA_PATH = '$API_BASE_PATH/SupportData';

  static const String URI_SUPPORT_DATA_DATA_LEVEL_LIST =
      '$SUPPORT_DATA_PATH/level/list';

  static const String URI_SUPPORT_DATA_LIST_BY_ID =
      "$SUPPORT_DATA_PATH/list/id";
  static const String URI_SUPPORT_CREATE = "$API_BASE_PATH/Support";

  //Support Ticket Endpoints

  static const String URI_SUPPORT_LIST_ALL = "$API_BASE_PATH/Support/list/all";
  static const String URI_SUPPORT_READ = "$API_BASE_PATH/Support";
  static const String URI_SUPPORT_SEARCH = "$API_BASE_PATH/Support/search";

  // FAQ Endpoints
  static const String URI_FAQ_LIST = '$API_BASE_PATH/Faq/list';
  static const String URI_FAQ_READ = '$API_BASE_PATH/Faq';
  static const String URI_FAQ_SEARCH = '$API_BASE_PATH/Faq/search';

  //Notification Endpoints

  static const String URI_API_NOTIFICATION_LIST =
      "$API_BASE_PATH/Notification/list";
  static const String URI_API_NOTIFICATION_COUNT =
      "$API_BASE_PATH/Notification/count";
  static const String URI_API_NOTIFICATION = "$API_BASE_PATH/Notification";

  //Credit Report

  static const String URI_CREDIT_REPORT_READ = "$API_BASE_PATH/CreditReport";

  // Promo cards
  static const String API_GET_PICTURE = "$API_PREFIX/pic";

  // Enach
  static const String URI_ENACH_META_DATA_READ = "$ENACH_BASE_PATH/metadata";
  static const String URI_ENACH_CREATE = "$ENACH_BASE_PATH/create";
  static const String URI_ENACH_VIEW = ENACH_BASE_PATH;

  // Transactions
  static const String TRANSACTION_LIST_READ = "$LEDGER_BASE_PATH/list/borrower";
  static const String URI_LEDGER_READ = LEDGER_BASE_PATH;

  static const String URI_READ_EMP_INFO = "$API_BASE_PATH/Borrower/empInfo";
  static const String URI_LOAN_DATA_LIST_SALARY_247 =
      "$LOAN_BASE_PATH/list/salary247";
  static const String URI_BORROWER_KYC_STEP_READ =
      "$API_BASE_PATH/Borrower/kyc/step";
  static const String URI_ELIGIBLE_LOAN_AMOUNT_READ =
      "$LOAN_BASE_PATH/eligibleAmt";

  static const String URI_COMPANY_CONFIG_READ_BY_BORROWER =
      "$API_BASE_PATH/CompanyConfig/borrower";

  static const String URI_LOAN_DOCUMENT_REJECTED_LIST =
      "$LOAN_BASE_PATH/document/rejected";

  static const String URI_ADDR_DATA_READ = "$API_BASE_PATH/AddrData";

  static const String URI_BORROWER_KYC_BANK_VERIFY =
      "$BORROWER_PATH/kyc/bank/verify";

  // eNACH Return URL Endpoint
  static const String URI_ENACH_RESPONSE = "ape/Enach/response";

  static const String URI_BORROWER_KYC_GST_CIN = "$BORROWER_PATH/Gst/Cin";

  static const String URI_PARTNER_LIST = "$API_BASE_PATH/Partner/list/all";

  static const String URI_PARTNER_READ = "$API_BASE_PATH/Partner";

  static const String URI_BORROWER_LOAN_ID_READ = "$BORROWER_PATH/loanid/list";

  static const String URI_LEDGER_SEARCH = "$API_BASE_PATH/Ledger/search";

  static const String URI_BORROWER_LOCATION_VERIFY =
      "$API_BASE_PATH/Borrower/loc/verify";

  // Quickslot app endpoints
  static const String URI_VENUES = '/api/venues';
  static const String URI_API_SLOTS = '/api/slots';
}
