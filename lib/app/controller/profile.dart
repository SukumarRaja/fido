import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/profile.dart';
import '../data/repository/profile.dart';
import '../ui/widgets/common/toast.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());
  final repository = ProfileRepository();

  final addAddressFormKey = GlobalKey<FormState>();

  final TextEditingController ownerName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController language = TextEditingController();

  //address edit
  final TextEditingController address1 = TextEditingController();
  final TextEditingController address2 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  final TextEditingController state = TextEditingController();

  //address add
  final TextEditingController addPhone = TextEditingController();
  final TextEditingController addName = TextEditingController();
  final TextEditingController addAddress1 = TextEditingController();
  final TextEditingController addAddress2 = TextEditingController();
  final TextEditingController addCity = TextEditingController();
  final TextEditingController addPincode = TextEditingController();
  final TextEditingController addState = TextEditingController();

  final _isProfileDetailsEmpty = false.obs;

  get isProfileDetailsEmpty => _isProfileDetailsEmpty.value;

  set isProfileDetailsEmpty(value) {
    _isProfileDetailsEmpty.value = value;
  }

  final _isProfileDetailsChanged = false.obs;

  get isProfileDetailsChanged => _isProfileDetailsChanged.value;

  set isProfileDetailsChanged(value) {
    _isProfileDetailsChanged.value = value;
  }

  final _getProfileLoading = false.obs;

  get getProfileLoading => _getProfileLoading.value;

  set getProfileLoading(value) {
    _getProfileLoading.value = value;
  }

  final _updateProfileLoading = false.obs;

  get updateProfileLoading => _updateProfileLoading.value;

  set updateProfileLoading(value) {
    _updateProfileLoading.value = value;
  }

  final _getProfileDetails = Data().obs;

  get getProfileDetails => _getProfileDetails.value;

  set getProfileDetails(value) {
    _getProfileDetails.value = value;
  }

  final _typeofAddressIndex = 2.obs;

  get typeofAddressIndex => _typeofAddressIndex.value;

  set typeofAddressIndex(value) {
    _typeofAddressIndex.value = value;
  }

  final _typeofAddress = "".obs;

  get typeofAddress => _typeofAddress.value;

  set typeofAddress(value) {
    _typeofAddress.value = value;
  }

  getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('token');
    print("Token is $id");
    getProfileLoading = true;
    try {
      var res = await repository.getProfile(userId: id);
      if (res.status == "200") {
        getProfileLoading = false;
        debugPrint("Profile got successfully");
        if (res.data == null) {
          debugPrint("Profile empty");
          isProfileDetailsEmpty = true;
        } else {
          debugPrint("Profile got successfully with data");
          isProfileDetailsEmpty = false;
          getProfileDetails = res.data;
        }
      } else if (res.status == "404") {
        getProfileLoading = false;
        debugPrint("Data not found on Profile");
      }
    } catch (e) {
      getProfileLoading = false;
      debugPrint("Error from server on GETPROFILE $e");
    }
  }

  updateProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('token');
    updateProfileLoading = true;
    var body = {
      "user_id": id,
      "name": ownerName.text,
      "email": email.text.trimRight(),
      "phone": phone.text,
      "location": location.text,
      "language": language.text,
    };
    try {
      var res = await repository.updateProfile(body: body);
      if (res.status == "200") {
        updateProfileLoading = false;
        debugPrint("Profile updated successfully");
        commonToast(msg: res.message);
        getProfile();
        isProfileDetailsChanged = false;
        Get.back();
      } else if (res.status == "404") {
        updateProfileLoading = false;
        debugPrint("Data not found on Profile Update");
        commonToast(msg: res.message);
      }
    } catch (e) {
      updateProfileLoading = false;
      debugPrint("Error from server on UPDATE PROFILE $e");
    }
  }

  setProfileData() {
    ownerName.text = getProfileDetails.name;
    email.text = getProfileDetails.email;
    phone.text = getProfileDetails.phone;
    location.text = getProfileDetails.location;
    language.text = getProfileDetails.language;
  }

  clearAddAddressFields() {
    addPincode.text = "";
    addPhone.text = "";
    addName.text = "";
    addAddress1.text = "";
    addAddress2.text = "";
    addCity.text = "";
    addState.text = "";
    typeofAddress = "";
    typeofAddressIndex = 2;
  }
}
