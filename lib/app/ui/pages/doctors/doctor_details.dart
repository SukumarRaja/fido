import 'package:fido/app/ui/pages/doctors/appointment.dart';
import 'package:fido/app/ui/widgets/common/button.dart';
import 'package:fido/app/ui/widgets/doctor/detail_card.dart';
import 'package:fido/app/ui/widgets/main_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common/text.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({Key? key}) : super(key: key);

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
                            text: "Doctor Details",
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
              Container(
                // width: Get.width*0.9,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    doctorShortInfo(),
                    SizedBox(height: 20),
                    doctorDetailedInfo(),
                    bookAppointmentButton(),
                    aboutHospital(),
                    upcomingSchedule(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row doctorShortInfo() {
    return Row(
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
            CommonText(
              text: "10 AM to 5 PM",
              style: regularText(),
            ),
          ],
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Container upcomingSchedule() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.18),
            spreadRadius: 0,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Upcoming Schedule",
                style: boldText(fontSize: 14),
              ),
              SizedBox(height: 10),
              CommonText(
                text: "Wednesday\n 1 PM",
                style: regularText(fontSize: 14),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Icon(
              Icons.phone,
              color: AppColors.white,
            ),
          ),
          SizedBox(width: 20),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Icon(
              Icons.message_outlined,
              color: AppColors.white,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Container aboutHospital() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
            text: "About Hospital",
            style: boldText(fontSize: 14),
          ),
          SizedBox(height: 5),
          CommonText(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: regularText(fontSize: 14),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Row doctorDetailedInfo() {
    return Row(
      children: [
        DoctorDetailsCard(
          text: 'Approved by',
          colortext: "AAHA",
        ),
        DoctorDetailsCard(
          text: 'Experience',
          colortext: "5+",
        )
      ],
    );
  }

  Container bookAppointmentButton() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.all(10),
      child: CommonButton(
        text: "Book Appointment",
        onTap: () {
          Get.to(() => AppointmentPage());
        },
      ),
    );
  }
}
