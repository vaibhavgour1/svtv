import 'dart:convert';

class SignupResponse {
  SignupResponse({required this.error, required this.message, this.info});

  bool error;
  String message;
  Info? info;

  factory SignupResponse.fromJson(String str) =>
      SignupResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignupResponse.fromMap(Map<String, dynamic> json) => SignupResponse(
        error: json["error"] == null ? false : json["error"],
        message: json["message"] == null ? "" : json["message"],
        info: json["info"] == null
            ? Info(
                city: '',
                email: '',
                id: '0',
                profileImage: '',
                state: '',
                dateOfBirth: '',
                ageGroup: '',
                name: '',
                country: '',
                ss: '',
                mobileNo: '')
            : Info.fromMap(json["info"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "message": message == null ? null : message,
        "info": info == null ? null : info!.toMap(),
      };
}

class Info {
  Info({
    required this.id,
    required this.name,
    required this.email,
    required this.ageGroup,
    required this.city,
    required this.state,
    required this.country,
    required this.mobileNo,
    required this.dateOfBirth,
    required this.profileImage,
    required this.ss,
  });

  String id;
  String name;
  String email;
  String ageGroup;
  String city;
  String state;
  String country;
  String mobileNo;
  String dateOfBirth;
  String profileImage;
  String ss;

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        id: json["id"] == null ? "0" : json["id"].toString(),
        name: json["name"] == null ? "" : json["name"].toString(),
        email: json["email"] == null ? "" : json["email"].toString(),
        ageGroup: json["age_group"].toString(),
        city: json["city"] == null ? "" : json["city"].toString(),
        state: json["state"] == null ? "" : json["state"].toString(),
        country: json["country"] == null ? "" : json["country"].toString(),
        mobileNo: json["mobile_no"] == null ? "" : json["mobile_no"].toString(),
        dateOfBirth: json["date_of_birth"],
        profileImage: json["profile_image"] == null
            ? ""
            : json["profile_image"].toString(),
        ss: json["ss"] == null ? "" : json["ss"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "age_group": ageGroup,
        "city": city,
        "state": state,
        "country": country,
        "mobile_no": mobileNo,
        "date_of_birth": dateOfBirth,
        "profile_image": profileImage,
        "ss": ss,
      };
}
