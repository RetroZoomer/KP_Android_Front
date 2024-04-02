import 'package:get/get.dart';
import 'package:kp_android/data/rep/my_characters_repo.dart';
import 'package:kp_android/models/user_model.dart';

class MyCharacterController extends GetxController {
  final MyCharactersRepo myCharactersRepo;

  MyCharacterController({required this.myCharactersRepo});
  List<CharacterModel> _myCharacterList = [];
  List<CharacterModel> get myCharacterList => _myCharacterList;

  bool _isLoad = false;
  bool get isLoad => _isLoad;

  Future<void> getMyCharactersList() async {
    Response response = await myCharactersRepo.getMyCharactersList();
    // print(response.body);
    if (response.statusCode == 200) {
      _myCharacterList = [];
      _myCharacterList.addAll(User.fromJson(response.body).characters);
      _isLoad = true;
      update();
    } else {

    }
  }

  Future<void> addNewCharacter() async{
    Response response = await myCharactersRepo.addNewCharacter();
    if (response.statusCode == 200) {
      _isLoad = true;
      update();
    } else {

    }
  }

  Future<void> deleteCharacter(int id) async{
    Response response = await myCharactersRepo.deleteCharacter(id);
    print(id);
    if (response.statusCode == 200) {

      _isLoad = true;
      update();
    } else {

    }
  }

  Future<void> editCharacter(CharacterModel characterModel) async{
    Response response = await myCharactersRepo.editCharacter(characterModel);
    print(characterModel.name);
    if (response.statusCode == 200) {
      _isLoad = true;
      update();
    } else {

    }
  }
}