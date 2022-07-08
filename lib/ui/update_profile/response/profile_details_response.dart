import 'dart:convert';

class ProfileDetailsResponse {
  ProfileDetailsResponse({
  required this.error,
  required this.message,
  required this.userId,
  });

  bool error;
  String message;
  String userId;

  factory ProfileDetailsResponse.fromJson(String str) => ProfileDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileDetailsResponse.fromMap(Map<String, dynamic> json) => ProfileDetailsResponse(
    error: json["error"] == null ? false : json["error"],
    message: json["message"] == null ? "" : json["message"],
    userId: json["user_id"] == null ? "0" : json["user_id"].toString(),
  );

  Map<String, dynamic> toMap() => {
    "error": error == null ? "" : error,
    "message": message == null ? "" : message,
    "user_id": userId == null ? "" : userId,
  };
}
