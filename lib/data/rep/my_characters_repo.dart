import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kp_android/data/api/api_client.dart';
import 'package:kp_android/models/user_model.dart';
import 'package:kp_android/utils/app_constants.dart';

class MyCharactersRepo extends GetxService {
  final ApiClient apiClient;
  MyCharactersRepo({required this.apiClient});

  Future<Response> getMyCharactersList() async {
    return await apiClient.getData(AppConstants.FIND_USER_URI + apiClient.id.toString());
  }

  Future<Response> addNewCharacter() async {
    return await apiClient.postData(AppConstants.ADD_CHARACTER_URI + apiClient.id.toString(),
          {
            'name': "Новый персонаж",
            "race": "Расса",
            "nameClass": "Класс",
            "img": "string",
            "level": 1,
            "speed": 0,
            "initiative": 0,
            "inspiration": false,
            "proficiency": 0,
            "realHP": 10,
            "maxHP": 10,
            "bonusHP": 0,
            "strength": 10,
            "dexterity": 10,
            "constitution": 10,
            "intelligence": 10,
            "wisdom": 10,
            "charisma": 10,
            "strengthSav": false,
            "dexteritySav": false,
            "constitutionSav": false,
            "intelligenceSav": false,
            "wisdomSav": false,
            "charismaSav": false,
            "acrobatics": false,
            "animalHandling": false,
            "arcana": false,
            "athletics": false,
            "deception": false,
            "history": false,
            "insight": false,
            "intimidation": false,
            "investigation": false,
            "medicine": false,
            "nature": false,
            "perception": false,
            "performance": false,
            "persuasion": false,
            "religion": false,
            "sleightOfHand": false,
            "stealth": false,
            "survival": false,
            "attacksAndSpells": " ",
            "skillsAndAbilities": " ",
            "spellCharacteristic": " ",
            "spell_1L": " ",
            "spell_2L": " ",
            "spell_3L": " ",
            "spell_4L": " ",
            "spell_5L": " ",
            "spell_6L": " ",
            "spell_7L": " ",
            "spell_8L": " ",
            "spell_9L": " ",
            "additionalAbilities": " ",
            "gold": 0,
            "equipment": " ",
            "treasures": " ",
            "additionalProficiencyAndLanguages": " ",
            "background": " ",
            "personality": " ",
            "notes_1": " ",
            "notes_2": " ",
            "notes_3": " ",
            "notes_4": " ",
            "notes_5": " ",
            "xp": 0,
            "ac": 10
          }
    );
  }

  Future<Response> deleteCharacter(int id) async {
          return await apiClient.postData(AppConstants.DELETE_CHARACTER_URI + id.toString(),
              {
                      'name': "Новый персонаж",
                      "race": "Расса",
                      "nameClass": "Класс",
                      "img": "string",
                      "level": 1,
                      "speed": 0,
                      "initiative": 0,
                      "inspiration": false,
                      "proficiency": 0,
                      "realHP": 10,
                      "maxHP": 10,
                      "bonusHP": 0,
                      "strength": 10,
                      "dexterity": 10,
                      "constitution": 10,
                      "intelligence": 10,
                      "wisdom": 10,
                      "charisma": 10,
                      "strengthSav": false,
                      "dexteritySav": false,
                      "constitutionSav": false,
                      "intelligenceSav": false,
                      "wisdomSav": false,
                      "charismaSav": false,
                      "acrobatics": false,
                      "animalHandling": false,
                      "arcana": false,
                      "athletics": false,
                      "deception": false,
                      "history": false,
                      "insight": false,
                      "intimidation": false,
                      "investigation": false,
                      "medicine": false,
                      "nature": false,
                      "perception": false,
                      "performance": false,
                      "persuasion": false,
                      "religion": false,
                      "sleightOfHand": false,
                      "stealth": false,
                      "survival": false,
                      "attacksAndSpells": " ",
                      "skillsAndAbilities": " ",
                      "spellCharacteristic": " ",
                      "spell_1L": " ",
                      "spell_2L": " ",
                      "spell_3L": " ",
                      "spell_4L": " ",
                      "spell_5L": " ",
                      "spell_6L": " ",
                      "spell_7L": " ",
                      "spell_8L": " ",
                      "spell_9L": " ",
                      "additionalAbilities": " ",
                      "gold": 0,
                      "equipment": " ",
                      "treasures": " ",
                      "additionalProficiencyAndLanguages": " ",
                      "background": " ",
                      "personality": " ",
                      "notes_1": " ",
                      "notes_2": " ",
                      "notes_3": " ",
                      "notes_4": " ",
                      "notes_5": " ",
                      "xp": 0,
                      "ac": 10
              }
          );
  }

  Future<Response> editCharacter(CharacterModel characterModel) async {
    print(characterModel);
    return await apiClient.postData(AppConstants.UPDATE_CHARACTER_URI, characterModel.toJson());
  }


}