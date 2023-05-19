import 'package:fido/app/ui/widgets/common/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/profile.dart';
import '../data/repository/profile.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());
  final repository = ProfileRepository();

  final TextEditingController ownerName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController language = TextEditingController();

  //address
  final TextEditingController address1 = TextEditingController();
  final TextEditingController address2 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  final TextEditingController state = TextEditingController();

  var _isProfileDetailsEmpty = false.obs;

  get isProfileDetailsEmpty => _isProfileDetailsEmpty.value;

  set isProfileDetailsEmpty(value) {
    _isProfileDetailsEmpty.value = value;
  }

  var _isProfileDetailsChanged = false.obs;

  get isProfileDetailsChanged => _isProfileDetailsChanged.value;

  set isProfileDetailsChanged(value) {
    _isProfileDetailsChanged.value = value;
  }

  var _getProfileLoading = false.obs;

  get getProfileLoading => _getProfileLoading.value;

  set getProfileLoading(value) {
    _getProfileLoading.value = value;
  }

  var _updateProfileLoading = false.obs;

  get updateProfileLoading => _updateProfileLoading.value;

  set updateProfileLoading(value) {
    _updateProfileLoading.value = value;
  }

  var _getProfileDetails = Data().obs;

  get getProfileDetails => _getProfileDetails.value;

  set getProfileDetails(value) {
    _getProfileDetails.value = value;
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
}
