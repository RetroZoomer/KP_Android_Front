import 'package:get/get.dart';
import 'package:kp_android/data/api/api_client.dart';
import 'package:kp_android/utils/app_constants.dart';

class MyCharactersRepo extends GetxService {
  final ApiClient apiClient;
  MyCharactersRepo({required this.apiClient});

  Future<Response> getMyCharactersList() async {
    return await apiClient.getData(AppConstants.FIND_USER_2_URI);
  }
}