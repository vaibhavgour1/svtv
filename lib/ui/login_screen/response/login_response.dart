import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.error,
    required this.message,
    this.userData,
  });

  bool error;
  String message;
  UserData? userData;

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        error: json["error"] == null ? null : json["error"],
        message: json["message"] == null ? null : json["message"],
        userData: json["user_id"] == null
            ? UserData(
                id: "0",
                name: "",
                email: "",
                mobileNo: "",
                city: "",
                state: "",
                country: "",
                ageGroup: "",
                dateOfBirth: "",
                profileImage: "")
            : UserData.fromMap(json["user_id"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? false : error,
        "message": message == null ? "" : message,
        "user_id": userData == null ? null : userData!.toMap(),
      };
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.city,
    required this.state,
    required this.country,
    required this.ageGroup,
    required this.dateOfBirth,
    required this.profileImage,
  });

  String id;
  String name;
  String email;
  String mobileNo;
  String city;
  String state;
  String country;
  String ageGroup;
  String dateOfBirth;
  String profileImage;

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        id: json["id"] == null ? "0" : json["id"].toString(),
        name: json["name"] == null ? "" : json["name"].toString(),
        email: json["email"] == null ? "" : json["email"].toString(),
        mobileNo: json["mobile_no"] == null ? "" : json["mobile_no"].toString(),
        city: json["city"] == null ? "" : json["city"].toString(),
        state: json["state"] == null ? "" : json["state"].toString(),
        country: json["country"] == null ? "" : json["country"].toString(),
        ageGroup: json["age_group"] == null ? "" : json["age_group"].toString(),
        dateOfBirth: json["date_of_birth"] == null
            ? ""
            : json["date_of_birth"].toString(),
        profileImage: json["profile_image"] == null
            ? ""
            : json["profile_image"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "city": city,
        "state": state,
        "country": country,
        "age_group": ageGroup,
        "date_of_birth": dateOfBirth,
        "profile_image": profileImage == null ? null : profileImage,
      };
}
