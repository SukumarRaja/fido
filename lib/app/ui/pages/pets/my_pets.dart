import 'package:fido/app/ui/widgets/pets/mypetstile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/text.dart';
import '../../widgets/main_clip_path.dart';
import 'add_pet.dart';

class MyPets extends StatelessWidget {
  const MyPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const MainClipPath(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.white,
                          ),
                          CommonText(
                            text: "My Pets",
                            style:
                                boldText(color: AppColors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return MyPetsTile(
                      petImage:
                          "https://cdn.akc.org/content/article-body-image/golden_puppy_dog_pictures.jpg",
                      petName: "petName",
                      petGender: "Male",
                      petBreed: "Labardor",
                      petAge: "8 Months");
                },
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(5),
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.18),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>InitialPetAdd());
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.black,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
