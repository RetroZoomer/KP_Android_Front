import 'package:get/get_connect/connect.dart';
import 'package:kp_android/data/api/api_client.dart';
import 'package:kp_android/models/sign_up_body_model.dart';
import 'package:kp_android/utils/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;

  AuthRepo({
    required this.apiClient
  });

  Future<Response>registration(SignUpBody signUpBody) async{
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  Future<Response>login(String login, String password) async{
    return await apiClient.postData(AppConstants.LOGIN_URI, {"username": login, "password" : password});
  }

  Future<void>saveUserId(int id) async {
    apiClient.id = id;
  }
}