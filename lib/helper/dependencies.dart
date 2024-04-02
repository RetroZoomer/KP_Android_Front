import 'package:get/get.dart';
import 'package:kp_android/controllers/auth_controller.dart';
import 'package:kp_android/controllers/my_characters_controller.dart';
import 'package:kp_android/data/api/api_client.dart';
import 'package:kp_android/data/rep/auth_repo.dart';
import 'package:kp_android/data/rep/my_characters_repo.dart';
import 'package:kp_android/utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => MyCharactersRepo(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => MyCharacterController(myCharactersRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}