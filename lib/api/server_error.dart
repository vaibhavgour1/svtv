import 'package:dio/dio.dart';

class ServerError implements Exception {
  int? _errorCode = 200;
  String _errorMessage = "";

  ServerError.withError({required DioError? error}) {
    _handleError(error!);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) async {
    _errorCode = error.response!.statusCode!;

    print(error.message);
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.other:
        _errorMessage = "Connection failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.response:
        _errorMessage = "Internal server error";
        if (error.response!.statusCode == 401) {
          // logout();
        }

        break;

      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
    }
    return _errorMessage;
  }

// void logout() async {
//   showDialog(
//       context: navigationService.navigatorKey.currentContext!,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         content: Text("Your session has been expired! Please login again"),
//         contentPadding: EdgeInsets.all(15),
//         actions: [
//           TextButton(
//               onPressed: () async {
//                 if (await googleSignIn.isSignedIn()) {
//                   await googleSignIn.signOut();
//                 }
//
//                 String data = await Utility.getStringPreference(Constant.LANGUAGE_CODE);
//                 await Utility.clearSharedPreference(context);
//                 Utility.setStringPreference(Constant.LANGUAGE_CODE, data);
//
//                 navigationService.navigateToUntil(Routs.LOGIN_SCREEN);
//               },
//               child: Text("Ok"))
//         ],
//       ));
//
//   // EasyLoading.showError("Your session has been expired! Please login again",);
// }
}
