class apiException implements Exception {
  int? code;
  String? message;

  apiException(this.code, this.message);
}


//implements
//extends