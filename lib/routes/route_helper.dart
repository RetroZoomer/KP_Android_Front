import 'package:get/get.dart';
import 'package:kp_android/pages/auth/sign_up_page.dart';
import 'package:kp_android/pages/character/character_page.dart';
import 'package:kp_android/pages/home/main_page.dart';

import '../pages/auth/sign_in_page.dart';
import '../pages/character/character_page_editing.dart';

class RouteHelper {
  static const String initial = "/mainPage";
  static const String MyCharacter = "/character";
  static const String EditMyCharacter = "/character/edit";
  static const String SignUp = "/signUp";
  static const String SignIn = "/signIn";

  static String getInitial() => '$initial';
  static String getMyCharacter(int? pageId) => '$MyCharacter?pageId=$pageId';
  static String getEditMyCharacter(int? pageId) => '$EditMyCharacter?pageId=$pageId';


  static String getSignUp() => '$SignUp';
  static String getSignIn() => '$SignIn';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainPage()),

    GetPage(name: MyCharacter, page: (){
      var pageId = Get.parameters['pageId'];
      return CharacterPage(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: EditMyCharacter, page: (){
      var pageId = Get.parameters['pageId'];
      return CharacterPageEditing(pageId: int.parse(pageId!));
    },
        transition: Transition.fadeIn
    ),

    GetPage(name: SignUp, page: () => SignUpPage()),
    GetPage(name: SignIn, page: () => SignInPage())
  ];
}