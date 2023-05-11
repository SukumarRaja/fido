import 'package:get/get.dart';

class ShoppingController extends GetxController {
  static ShoppingController get to => Get.put(ShoppingController());

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

  final _shoppingPopMenuIndex = 0.obs;

  get shoppingPopMenuIndex => _shoppingPopMenuIndex.value;

  set shoppingPopMenuIndex(value) {
    _shoppingPopMenuIndex.value = value;
  }

  final _dogFoodCategoriesIndex = 200.obs;

  get dogFoodCategoriesIndex => _dogFoodCategoriesIndex.value;

  set dogFoodCategoriesIndex(value) {
    _dogFoodCategoriesIndex.value = value;
  }
}
