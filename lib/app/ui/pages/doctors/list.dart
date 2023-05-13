import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/common_search.dart';
import '../../widgets/common/text.dart';
import '../../widgets/main_clip_path.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const MainClipPath(),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: CommonText(
                          text: "Find Your Doctor",
                          style:
                              headText(color: AppColors.white, fontSize: 20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 110.0, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CommonText(
                                text: "Location",
                                style: mediumText(color: AppColors.primary)),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: AppColors.primary,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primary,
                              size: 16,
                            ),
                            CommonText(
                                text: "720, Ram Nagar, Rs Puram",
                                style: mediumText(
                                    color: AppColors.grey, fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 165, left: 15.0),
                    child: Row(
                      children: [
                        Flexible(
                            child: CommonSearch(
                          controller: HomeController.to.searchController,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list,
                            color: AppColors.secondary,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: Get.height / 1.7,
                child: GridView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (context, int index) {
                      return Container(
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grey.withOpacity(.3),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: AppColors.white,
                              backgroundImage: NetworkImage(
                                  "https://www.reddogbetty.com/wp-content/uploads/2016/07/Veterinarians-For-The-Pet.jpg"),
                            ),
                            CommonText(
                                text: "Jane Andrews",
                                style: boldText(fontSize: 16)),
                            CommonText(
                                text: "Rao Hospital, Rs Puram",
                                style: regularText(
                                    fontSize: 9, color: AppColors.grey)),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                                height: 35,
                                alignment: Alignment.center,
                                child: CommonButton(
                                    text: "Appointment", onTap: () {})),
                            SizedBox(
                              height: 10.0,
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
