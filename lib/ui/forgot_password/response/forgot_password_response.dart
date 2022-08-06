import 'dart:convert';

class ForgotPasswordResponse {
  ForgotPasswordResponse({
    required this.error,
    required this.message,
  });

  bool error;
  String message;

  factory ForgotPasswordResponse.fromJson(String str) => ForgotPasswordResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForgotPasswordResponse.fromMap(Map<String, dynamic> json) => ForgotPasswordResponse(
        error: json["error"] == null ? false : json["error"],
        message: json["message"] == null ? "" : json["message"],
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "message": message == null ? null : message,
      };
}
