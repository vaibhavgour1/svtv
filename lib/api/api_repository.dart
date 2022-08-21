import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:svtvs/api/endpoint.dart';
import 'package:svtvs/api/server_error.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/category_dashboard/response/category_response.dart';
import 'package:svtvs/ui/catrgory_screen/response/video_list_response.dart';
import 'package:svtvs/ui/forgot_password/response/forgot_password_response.dart';
import 'package:svtvs/ui/login_screen/response/login_response.dart';
import 'package:svtvs/ui/signup_screen/response/signup_response.dart';
import 'package:svtvs/ui/update_profile/response/profile_details_response.dart';
import 'package:svtvs/ui/update_profile/response/profile_details_update_response.dart';
import 'package:svtvs/ui/video_details_screen/response/add_comment_response.dart';
import 'package:svtvs/ui/video_details_screen/response/video_comments_response.dart';
import 'package:svtvs/ui/video_details_screen/response/video_details_response.dart';
import 'package:svtvs/ui/video_details_screen/response/video_like_response.dart';
import 'package:svtvs/utility/constants.dart';
import 'package:svtvs/utility/shared_prefernce.dart';

class ApiRepository {
  static final ApiRepository repository = ApiRepository.internal();

  factory ApiRepository() {
    return repository;
  }

  ApiRepository.internal();

  Future<SignupResponse> signupUser(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.register, data: formData);
      SignupResponse response = SignupResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return SignupResponse(error: false, message: message);
    }
  }

  Future<LoginResponse> loginUser(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.login, data: formData);
      LoginResponse response = LoginResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return LoginResponse(error: false, message: message);
    }
  }

  Future<ForgotPasswordResponse> forgotPassword(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.forgotPassword, data: formData);
      ForgotPasswordResponse response = ForgotPasswordResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return ForgotPasswordResponse(error: false, message: message);
    }
  }

  Future<CategoryResponse> getCategories() async {
    try {
      Response res = await dio.get(EndPoint.getCategories);
      CategoryResponse response = CategoryResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return CategoryResponse(error: false, message: message);
    }
  }

  Future<VideoListResponse> getVideoList(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.getVideoList, data: formData);
      VideoListResponse response = VideoListResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return VideoListResponse(error: false, message: message);
    }
  }

  Future<VideoDetailsResponse> getVideoDetails(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.getVideoDetails, data: formData);
      VideoDetailsResponse response = VideoDetailsResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return VideoDetailsResponse(error: false, message: message);
    }
  }

  Future<VideoLikesResponse> likeVideo(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.likeVideo, data: formData);
      VideoLikesResponse response = VideoLikesResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return VideoLikesResponse(error: false, message: message, info: "");
    }
  }

  Future<VideoCommentsResponse> getComments(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.getCommentList, data: formData);
      VideoCommentsResponse response = VideoCommentsResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return VideoCommentsResponse(error: false, message: message);
    }
  }

  Future<AddCommentResponse> addComments(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.addComment, data: formData);
      AddCommentResponse response = AddCommentResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return AddCommentResponse(error: false, message: message);
    }
  }

  Future<UserDetailsResponse> getUserDetails() async {
    try {
      String token = await SharedPref.getStringPreference(Constant.authKey);
      Response res = await dio.post(EndPoint.userDetails, data: "Bearer $token");
      UserDetailsResponse response = UserDetailsResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return UserDetailsResponse(error: false, message: message);
    }
  }

  Future<UpdateProfileDetailsResponse> updateUserProfile(Map input) async {
    try {
      FormData formData = FormData.fromMap(input as Map<String, dynamic>);
      Response res = await dio.post(EndPoint.updateProfileDetails, data: formData);
      UpdateProfileDetailsResponse response = UpdateProfileDetailsResponse.fromJson(res.toString());
      return response;
    } catch (error) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return UpdateProfileDetailsResponse(error: false, message: message);
    }
  }
}
