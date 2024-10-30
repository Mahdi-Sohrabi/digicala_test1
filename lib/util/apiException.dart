// ignore_for_file: file_names

// ignore: camel_case_types
class apiException implements Exception {
  int? code;
  String? message;

  apiException(this.code, this.message);
}
