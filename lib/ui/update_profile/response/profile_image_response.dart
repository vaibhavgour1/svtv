import 'dart:convert';

class ProfileImageResponse {
  ProfileImageResponse({
   required this.error,
    required this.message,
    required this.link,
  });

  bool error;
  String message;
  String link;

  factory ProfileImageResponse.fromJson(String str) => ProfileImageResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileImageResponse.fromMap(Map<String, dynamic> json) => ProfileImageResponse(
    error: json["error"] == null ? false : json["error"],
    message: json["message"] == null ? "" : json["message"],
    link: json["link"] == null ? "" : json["link"],
  );

  Map<String, dynamic> toMap() => {
    "error": error == null ? null : error,
    "message": message == null ? null : message,
    "link": link == null ? null : link,
  };
}
