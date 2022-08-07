import 'dart:convert';

class UserDetailsResponse {
  UserDetailsResponse({
    required this.error,
    required this.message,
    this.info,
  });

  bool error;
  String message;
  UserInfo? info;

  factory UserDetailsResponse.fromJson(String str) => UserDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetailsResponse.fromMap(Map<String, dynamic> json) => UserDetailsResponse(
        error: json["error"] == null ? false : json["error"],
        message: json["message"] == null ? "" : json["message"],
        info: json["info"] == null ? null : UserInfo.fromMap(json["info"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "message": message == null ? null : message,
        "info": info == null ? null : info!.toMap(),
      };
}

class UserInfo {
  UserInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.ageGroup,
    required this.city,
    required this.state,
    required this.country,
    required this.mobileNo,
    required this.profileImage,
  });

  String id;
  String name;
  String email;
  String ageGroup;
  String city;
  String state;
  String country;
  String mobileNo;
  String profileImage;

  factory UserInfo.fromJson(String str) => UserInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserInfo.fromMap(Map<String, dynamic> json) => UserInfo(
        id: json["id"] == null ? "" : json["id"].toString(),
        name: json["name"] == null ? "" : json["name"].toString(),
        email: json["email"] == null ? "" : json["email"].toString(),
        ageGroup: json["age_group"] == null ? "" : json["age_group"].toString(),
        city: json["city"] == null ? "" : json["city"].toString(),
        state: json["state"] == null ? "" : json["state"].toString(),
        country: json["country"] == null ? "" : json["country"].toString(),
        mobileNo: json["mobile_no"] == null ? "" : json["mobile_no"].toString(),
        profileImage: json["profile_image"] == null ? "" : json["profile_image"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "age_group": ageGroup == null ? null : ageGroup,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "profile_image": profileImage == null ? null : profileImage,
      };
}
