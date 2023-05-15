import 'package:fido/app/controller/doctor.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/doctor/appointment_timing.dart';
import 'package:fido/app/ui/widgets/main_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/text.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);

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
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                          CommonText(
                            text: "Appointment",
                            style: headText(
                              color: AppColors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                    "https://img.freepik.com/free-photo/veterinarian-checking-dog-medium-shot_23-2149143871.jpg"),
                              )),
                        ),
                        Column(
                          children: [
                            CommonText(
                              text: "Christina Fraizer",
                              style: boldText(
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),
                            CommonText(
                              text: "Veterinarian, Rao Hospital",
                              style: regularText(),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 10),
                    appointmentCalendar(),
                    SizedBox(height: 10),
                    CommonText(
                      text: "Time Slots",
                      style: boldText(fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    TimeSlotGrid(),
                    // SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: Get.width * 0.65,
                        margin: EdgeInsets.all(5),
                        child: CommonButton(
                          text: "Confirm Booking",
                          onTap: () {},
                        ),
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox TimeSlotGrid() {
    return SizedBox(
      height: 180,
      width: Get.width,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 4,
        ),
        itemCount: 6,
        itemBuilder: (context, int index) {
          return AppointmentTimeCard(
            timetext: "10 AM - 11 AM",
            onTap: () {
              DoctorController.to.timeIndex = index;
            },
            index: index,
          );
        },
      ),
    );
  }

  Container appointmentCalendar() {
    return Container(
      padding: EdgeInsets.all(8),
      height: Get.height * 0.30,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.18),
            spreadRadius: 0,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "Choose date",
            style: boldText(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
