import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../ui/themes/colors.dart';

class FileUploadController extends GetxController {
  static FileUploadController get to => Get.put(FileUploadController());

  dynamic profileImage;
  dynamic chequeLeafImage;
  var _petImage1 = "".obs;

  get petImage1 => _petImage1.value;

  set petImage1(value) {
    _petImage1.value = value;
  }

  var _petImage2 = "".obs;

  get petImage2 => _petImage2.value;

  set petImage2(value) {
    _petImage2.value = value;
  }

  var _petImage3 = "".obs;

  get petImage3 => _petImage3.value;

  set petImage3(value) {
    _petImage3.value = value;
  }

  var _petImage4 = "".obs;

  get petImage4 => _petImage4.value;

  set petImage4(value) {
    _petImage4.value = value;
  }

  bool updateMode = false;

  changeUpdateMode(data) {
    updateMode = true;
    update();
  }

  final _isProfilePage = false.obs;

  get isProfilePage => _isProfilePage.value;

  set isProfilePage(value) {
    _isProfilePage.value = value;
  }

  Future<void> showSelectionDialog({required bool profileMode}) {
    return Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Please choose!",
              style: TextStyle(),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              InkWell(
                splashColor: AppColors.secondary,
                child: Row(
                  children: [
                    Icon(
                      Icons.photo,
                      color: AppColors.primary,
                      size: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text("Gallery"),
                  ],
                ),
                onTap: () {
                  getFromGallery(profileMode: profileMode);
                },
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              InkWell(
                splashColor: AppColors.secondary,
                child: Row(
                  children: [
                    Icon(
                      Icons.camera,
                      color: AppColors.primary,
                      size: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text("Camera"),
                  ],
                ),
                onTap: () {
                  openCamera(profileMode: profileMode);
                },
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary,
                      ),
                      child: const Center(
                          child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }

  Future<void> showSelectionDialogPet1and2({required bool oneOrTwo}) {
    return Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Please choose!",
              style: TextStyle(),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              InkWell(
                splashColor: AppColors.secondary,
                child: Row(
                  children: [
                    Icon(
                      Icons.photo,
                      color: AppColors.primary,
                      size: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text("Gallery"),
                  ],
                ),
                onTap: () {
                  getFromGalleryPet1and2(oneOrTwo: oneOrTwo);
                },
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              InkWell(
                splashColor: AppColors.secondary,
                child: Row(
                  children: [
                    Icon(
                      Icons.camera,
                      color: AppColors.primary,
                      size: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text("Camera"),
                  ],
                ),
                onTap: () {
                  openCameraPet1and2(oneOrTwo: oneOrTwo);
                },
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary,
                      ),
                      child: const Center(
                          child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }

  Future<void> showSelectionDialogPet3and4({required bool threeOrfour}) {
    return Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Please choose!",
              style: TextStyle(),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              InkWell(
                splashColor: AppColors.secondary,
                child: Row(
                  children: [
                    Icon(
                      Icons.photo,
                      color: AppColors.primary,
                      size: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text("Gallery"),
                  ],
                ),
                onTap: () {
                  getFromPet3and4(threeOrfour: threeOrfour);
                },
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              InkWell(
                splashColor: AppColors.secondary,
                child: Row(
                  children: [
                    Icon(
                      Icons.camera,
                      color: AppColors.primary,
                      size: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text("Camera"),
                  ],
                ),
                onTap: () {
                  openCameraPet3and4(threeOrfour: threeOrfour);
                },
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary,
                      ),
                      child: const Center(
                          child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }

  getFromGallery({required bool profileMode}) async {
    Get.back();
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    cropImage(pickedFile?.path, profileMode: profileMode);
  }

  getFromGalleryPet1and2({required bool oneOrTwo}) async {
    Get.back();
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    cropImagePet1and2(pickedFile?.path, oneOrTwo: oneOrTwo);
  }

  getFromPet3and4({required bool threeOrfour}) async {
    Get.back();
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    cropImagePet3and4(pickedFile?.path, threeOrfour: threeOrfour);
  }

  openCamera({required bool profileMode}) async {
    Get.back();
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    cropImage(pickedFile?.path, profileMode: profileMode);
  }

  openCameraPet1and2({required bool oneOrTwo}) async {
    Get.back();
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    cropImagePet1and2(pickedFile?.path, oneOrTwo: oneOrTwo);
  }

  openCameraPet3and4({required bool threeOrfour}) async {
    Get.back();
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    cropImagePet3and4(pickedFile?.path, threeOrfour: threeOrfour);
  }

  cropImage(filePath, {required bool profileMode}) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop image ',
            toolbarColor: AppColors.primary,
            toolbarWidgetColor: Colors.white,
            statusBarColor: AppColors.primary,
            activeControlsWidgetColor: AppColors.primary,
            cropFrameColor: AppColors.primary,
            backgroundColor: AppColors.primary,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
      ],
    );
    if (croppedImage != null) {
      // await uploadLogo(croppedImage.path);
      print("test image ${croppedImage.path}");
      profileMode == true
          ? profileImage = croppedImage
          : chequeLeafImage = croppedImage;
      update();
    }
  }

  cropImagePet1and2(filePath, {required bool oneOrTwo}) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop s image ',
            toolbarColor: AppColors.primary,
            toolbarWidgetColor: Colors.white,
            statusBarColor: AppColors.primary,
            activeControlsWidgetColor: AppColors.primary,
            cropFrameColor: AppColors.primary,
            backgroundColor: AppColors.primary,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
      ],
    );
    if (croppedImage != null) {
      // await uploadLogo(croppedImage.path);
      print("test image ${croppedImage.path}");
      oneOrTwo == true
          ? petImage1 = croppedImage.path
          : petImage2 = croppedImage.path;
      update();
    }
  }

  cropImagePet3and4(filePath, {required bool threeOrfour}) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop image ',
            toolbarColor: AppColors.primary,
            toolbarWidgetColor: Colors.white,
            statusBarColor: AppColors.primary,
            activeControlsWidgetColor: AppColors.primary,
            cropFrameColor: AppColors.primary,
            backgroundColor: AppColors.primary,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
      ],
    );
    if (croppedImage != null) {
      // await uploadLogo(croppedImage.path);
      print("test image ${croppedImage.path}");
      threeOrfour == true
          ? petImage3 = croppedImage.path
          : petImage4 = croppedImage.path;
      update();
    }
  }
}
