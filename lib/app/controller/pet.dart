import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PetController extends GetxController {
  static PetController get to => Get.put(PetController());

  final TextEditingController petType = TextEditingController();
  final TextEditingController petName = TextEditingController();
  final TextEditingController petSex = TextEditingController();
  final TextEditingController petAge = TextEditingController();
  final TextEditingController petBreed = TextEditingController();

  final _addPetPageIndex = 0.obs;

  get addPetPageIndex => _addPetPageIndex.value;

  set addPetPageIndex(value) {
    _addPetPageIndex.value = value;
  }

  final _petTypeName = "Pet Type".obs;

  get petTypeName => _petTypeName.value;

  set petTypeName(value) {
    _petTypeName.value = value;
  }

  final _isVaccination = 0.obs;

  get isVaccination => _isVaccination.value;

  set isVaccination(value) {
    _isVaccination.value = value;
  }

  final _mainMenuIndexForDog = 0.obs;

  get mainMenuIndexForDog => _mainMenuIndexForDog.value;

  set mainMenuIndexForDog(value) {
    _mainMenuIndexForDog.value = value;
  }

  final _mainMenuIndexForCat = 0.obs;

  get mainMenuIndexForCat => _mainMenuIndexForCat.value;

  set mainMenuIndexForCat(value) {
    _mainMenuIndexForCat.value = value;
  }

  final _mainMenuIndexForBirds = 0.obs;

  get mainMenuIndexForBirds => _mainMenuIndexForBirds.value;

  set mainMenuIndexForBirds(value) {
    _mainMenuIndexForBirds.value = value;
  }

  final _mainMenuIndexForFishAndAquatics = 0.obs;

  get mainMenuIndexForFishAndAquatics => _mainMenuIndexForFishAndAquatics.value;

  set mainMenuIndexForFishAndAquatics(value) {
    _mainMenuIndexForFishAndAquatics.value = value;
  }

  final _mainMenuIndexForSmallPets = 0.obs;

  get mainMenuIndexForSmallPets => _mainMenuIndexForSmallPets.value;

  set mainMenuIndexForSmallPets(value) {
    _mainMenuIndexForSmallPets.value = value;
  }

  final _petPopMenuIndex = 0.obs;

  get petPopMenuIndex => _petPopMenuIndex.value;

  set petPopMenuIndex(value) {
    _petPopMenuIndex.value = value;
  }

  final _dogFoodCategoriesIndex = 200.obs;

  get dogFoodCategoriesIndex => _dogFoodCategoriesIndex.value;

  set dogFoodCategoriesIndex(value) {
    _dogFoodCategoriesIndex.value = value;
  }
}
