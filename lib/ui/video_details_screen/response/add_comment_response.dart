import 'dart:convert';

class AddCommentResponse {
  AddCommentResponse({
   required this.error,
   required this.message,
  });

  bool error;
  String message;

  factory AddCommentResponse.fromJson(String str) => AddCommentResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddCommentResponse.fromMap(Map<String, dynamic> json) => AddCommentResponse(
    error: json["error"] == null ? "" : json["error"],
    message: json["message"] == null ? "" : json["message"],
  );

  Map<String, dynamic> toMap() => {
    "error": error == null ? null : error,
    "message": message == null ? null : message,
  };
}
