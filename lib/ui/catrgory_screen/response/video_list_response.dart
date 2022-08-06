// To parse this JSON data, do
//
//     final forgotPasswordResponse = forgotPasswordResponseFromMap(jsonString);

import 'dart:convert';

class VideoListResponse {
  VideoListResponse({
    required this.error,
    required this.message,
    this.list,
  });

  bool error;
  String message;
  List<VideoDetails>? list;

  factory VideoListResponse.fromJson(String str) => VideoListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoListResponse.fromMap(Map<String, dynamic> json) => VideoListResponse(
        error: json["error"] == null ? null : json["error"],
        message: json["message"] == null ? null : json["message"],
        list: json["list"] == null ? [] : List<VideoDetails>.from(json["list"].map((x) => VideoDetails.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "message": message == null ? null : message,
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toMap())),
      };
}

class VideoDetails {
  VideoDetails({
    required this.id,
    required this.videoType,
    required this.tabType,
    required this.title,
    required this.link,
    required this.publishDate,
    required this.publishDuration,
    required this.likes,
  });

  String id;
  String videoType;
  String tabType;
  String title;
  String link;
  String publishDate;
  String publishDuration;
  String likes;

  factory VideoDetails.fromJson(String str) => VideoDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoDetails.fromMap(Map<String, dynamic> json) => VideoDetails(
        id: json["id"] == null ? "" : json["id"].toString(),
        videoType: json["video_type"] == null ? "" : json["video_type"].toString(),
        tabType: json["tab_type"] == null ? "" : json["tab_type"].toString(),
        title: json["title"] == null ? "" : json["title"].toString(),
        link: json["link"] == null ? "" : json["link"].toString(),
        publishDate: json["publish_date"] == null ? "" : json["publish_date"].toString(),
        publishDuration: json["publish_duration"] == null ? "" : json["publish_duration"].toString(),
        likes: json["likes"] == null ? "" : json["likes"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "video_type": videoType == null ? null : videoType,
        "tab_type": tabType == null ? null : tabType,
        "title": title == null ? null : title,
        "link": link == null ? null : link,
        "publish_date": publishDate == null ? null : publishDate,
        "publish_duration": publishDuration == null ? null : publishDuration,
        "likes": likes == null ? null : likes,
      };
}
