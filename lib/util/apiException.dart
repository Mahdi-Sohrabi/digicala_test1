// ignore_for_file: file_names

// ignore: camel_case_types
class ApiException implements Exception {
  int? code;
  String? message;

  ApiException(this.code, this.message);
}
