import 'dart:convert';

class VideoDetailsResponse {
  VideoDetailsResponse({
    required this.error,
    required this.message,
    this.videoDetails,
  });

  bool error;
  String message;
  VideoDetails? videoDetails;

  factory VideoDetailsResponse.fromJson(String str) => VideoDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoDetailsResponse.fromMap(Map<String, dynamic> json) => VideoDetailsResponse(
        error: json["error"] == null ? false : json["error"],
        message: json["message"] == null ? "" : json["message"],
        videoDetails: json["list"] == null ? null : VideoDetails.fromMap(json["list"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "message": message == null ? null : message,
        "list": videoDetails == null ? null : videoDetails!.toMap(),
      };
}

class VideoDetails {
  VideoDetails({
    required this.id,
    required this.videoType,
    required this.title,
    required this.link,
    required this.description,
    required this.publishDate,
    required this.publishDuration,
    required this.likes,
    required this.userLikes,
  });

  String id;
  String videoType;
  String title;
  String link;
  String description;
  String publishDate;
  String publishDuration;
  String likes;
  String userLikes;

  factory VideoDetails.fromJson(String str) => VideoDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoDetails.fromMap(Map<String, dynamic> json) => VideoDetails(
        id: json["id"] == null ? "" : json["id"].toString(),
        videoType: json["video_type"] == null ? "" : json["video_type"].toString(),
        title: json["title"] == null ? "" : json["title"].toString(),
        link: json["link"] == null ? "" : json["link"].toString(),
        description: json["description"] == null ? "" : json["description"].toString(),
        publishDate: json["publish_date"] == null ? "" : json["publish_date"].toString(),
        publishDuration: json["publish_duration"] == null ? "" : json["publish_duration"].toString(),
        likes: json["likes"] == null ? "" : json["likes"].toString(),
        userLikes: json["user_likes"] == null ? "" : json["user_likes"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "video_type": videoType == null ? null : videoType,
        "title": title == null ? null : title,
        "link": link == null ? null : link,
        "description": description == null ? null : description,
        "publish_date": publishDate == null ? null : publishDate,
        "publish_duration": publishDuration == null ? null : publishDuration,
        "likes": likes == null ? null : likes,
        "user_likes": userLikes == null ? null : userLikes,
      };
}
