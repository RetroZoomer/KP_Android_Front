import 'package:get/get.dart';
import 'package:kp_android/data/rep/auth_repo.dart';
import 'package:kp_android/models/response_model.dart';
import 'package:kp_android/models/sign_up_body_model.dart';

import '../models/user_model.dart';
import '../utils/app_constants.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void>registration(SignUpBody signUpBody) async{
    _isLoading = true;
    Response response = await authRepo.registration(signUpBody);
    if (response.statusCode == 200) {

    } else {

    }
    _isLoading = true;
    update();
  }

  Future<ResponseModel>login(String login, String password) async{
    _isLoading = true;
    Response response = await authRepo.login(login, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserId(response.body["id"]);
      responseModel = ResponseModel(true, response.body["token"]);
      print(response.body);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = true;
    update();
    return responseModel;
  }
}