// To parse this JSON data, do
//
//     final updateProfileResponse = updateProfileResponseFromMap(jsonString);

import 'dart:convert';

class UpdateProfileDetailsResponse {
  UpdateProfileDetailsResponse({
    required this.error,
    required this.message,
  });

  bool error;
  String message;

  factory UpdateProfileDetailsResponse.fromJson(String str) => UpdateProfileDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateProfileDetailsResponse.fromMap(Map<String, dynamic> json) => UpdateProfileDetailsResponse(
        error: json["error"] == null ? false : json["error"],
        message: json["message"] == null ? "" : json["message"],
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "message": message == null ? null : message,
      };
}
