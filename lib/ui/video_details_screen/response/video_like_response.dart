// To parse this JSON data, do
//
//     final videoLikesResponse = videoLikesResponseFromMap(jsonString);

import 'dart:convert';

class VideoLikesResponse {
  VideoLikesResponse({
    required this.error,
    required this.message,
    required this.info,
  });

  bool error;
  String message;
  String info;

  factory VideoLikesResponse.fromJson(String str) => VideoLikesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoLikesResponse.fromMap(Map<String, dynamic> json) => VideoLikesResponse(
        error: json["error"] == null ? false : json["error"],
        message: json["message"] == null ? "" : json["message"].toString(),
        info: json["info"] == null ? "" : json["info"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "message": message == null ? null : message,
        "info": info == null ? null : info,
      };
}
