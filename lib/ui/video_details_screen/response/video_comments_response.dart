import 'dart:convert';

class VideoCommentsResponse {
  VideoCommentsResponse({
  required this.error,
  required this.message,
    this.list,
  });

  bool error;
  String message;
  List<VideoCommentList>? list;

  factory VideoCommentsResponse.fromJson(String str) => VideoCommentsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoCommentsResponse.fromMap(Map<String, dynamic> json) => VideoCommentsResponse(
    error: json["error"] == null ? null : json["error"],
    message: json["message"] == null ? null : json["message"],
    list: json["list"] == null ? null : List<VideoCommentList>.from(json["list"].map((x) => VideoCommentList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "error": error == null ? null : error,
    "message": message == null ? null : message,
    "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toMap())),
  };
}

class VideoCommentList {
  VideoCommentList({
   required this.id,
   required this.videoId,
   required this.commentedBy,
   required this.comment,
   required this.commentDate,
   required this.publishDuration,
  });

  String id;
  String videoId;
  String commentedBy;
  String comment;
  String commentDate;
  String publishDuration;

  factory VideoCommentList.fromJson(String str) => VideoCommentList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoCommentList.fromMap(Map<String, dynamic> json) => VideoCommentList(
    id: json["id"] == null ? "" : json["id"].toString(),
    videoId: json["video_id"] == null ? "" : json["video_id"].toString(),
    commentedBy: json["commented_by"] == null ? "" : json["commented_by"].toString(),
    comment: json["comment"] == null ? "" : json["comment"].toString(),
    commentDate: json["comment_date"] == null ? "" : json["comment_date"].toString(),
    publishDuration: json["publish_duration"] == null ? "" : json["publish_duration"].toString(),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "video_id": videoId == null ? null : videoId,
    "commented_by": commentedBy == null ? null : commentedBy,
    "comment": comment == null ? null : comment,
    "comment_date": commentDate == null ? null : commentDate,
    "publish_duration": publishDuration == null ? null : publishDuration,
  };
}
