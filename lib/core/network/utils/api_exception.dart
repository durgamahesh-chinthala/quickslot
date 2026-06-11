// Exceptions
import 'package:quickslot/core/network/utils/app_constants.dart';

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);
  @override
  String toString() => '${AppConstants.BAD_REQUEST_EXCEPTION}: $message';
}

class UnauthorisedException implements Exception {
  final String message;
  UnauthorisedException(this.message);
  @override
  String toString() => '${AppConstants.UNAUTHORISED_EXCEPTION}: $message';
}

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);
  @override
  String toString() => '${AppConstants.FORBIDDEN_EXCEPTION}: $message';
}

class NotFounException implements Exception {
  final String message;
  NotFounException(this.message);
  @override
  String toString() => '${AppConstants.NOTFOUND_EXCEPTION}: $message';
}

class MethodNotAllowedException implements Exception {
  final String message;
  MethodNotAllowedException(this.message);
  @override
  String toString() => '${AppConstants.METHOD_NOT_ALLOWED_EXCEPTION}: $message';
}

class InternalServerException implements Exception {
  final String message;
  InternalServerException(this.message);
  @override
  String toString() => '${AppConstants.INTERNAL_SERVER_EXCEPTION}: $message';
}

class GateWayTimeException implements Exception {
  final String message;
  GateWayTimeException(this.message);
  @override
  String toString() => '${AppConstants.GATEWAY_TIME_EXCEPTION}: $message';
}

class TemporaryRedirectException implements Exception {
  final String message;
  TemporaryRedirectException(this.message);
  @override
  String toString() => '${AppConstants.TEMPORARY_REDIRECT_EXCEPTION}: $message';
}

class SuccessException implements Exception {
  final String message;
  SuccessException(this.message);
  @override
  String toString() => '${AppConstants.SUCCESS_EXCEPTION}: $message';
}
