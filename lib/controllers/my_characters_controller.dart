import 'package:get/get.dart';
import 'package:kp_android/data/rep/my_characters_repo.dart';
import 'package:kp_android/models/user_model.dart';

class MyCharacterController extends GetxController {
  final MyCharactersRepo myCharactersRepo;

  MyCharacterController({required this.myCharactersRepo});
  List<CharacterModel> _myCharacterList = [];
  List<CharacterModel> get myCharacterList => _myCharacterList;

  Future<void> getMyCharactersList() async {
    Response response = await myCharactersRepo.getMyCharactersList();
    // print(response.body);
    if (response.statusCode == 200) {
      _myCharacterList = [];
      _myCharacterList.addAll(User.fromJson(response.body).characters);
      update();
    } else {

    }
  }

  // Future<void> addMyCharacter() async {
  //   Response response = await myCharactersRepo.getMyCharactersList();
  //   // print(response.body);
  //   if (response.statusCode == 200) {
  //     _myCharacterList = [];
  //     _myCharacterList.addAll(User.fromJson(response.body).characters);
  //     print(myCharacterList);
  //     update();
  //   } else {
  //
  //   }
  // }
}