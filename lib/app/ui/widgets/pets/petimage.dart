import 'dart:io';

import 'package:fido/app/controller/file.dart';
import 'package:fido/app/ui/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetImageBox extends StatelessWidget {
  const PetImageBox({Key? key, required this.onTap, required this.index})
      : super(key: key);
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FileUploadController.to.petImage1 != "" && index == 0
              ? Image.file(
                  File(FileUploadController.to.petImage1),
                )
              : FileUploadController.to.petImage2 != "" && index == 1
                  ? Image.file(
                      File(FileUploadController.to.petImage2),
                    )
                  : FileUploadController.to.petImage3 != "" && index == 2
                      ? Image.file(
                          File(FileUploadController.to.petImage3),
                        )
                      : FileUploadController.to.petImage4 != "" && index == 3
                          ? Image.file(
                              File(FileUploadController.to.petImage4),
                            )
                          : Icon(
                              Icons.add,
                              color: AppColors.primary,
                            ),
        ),
      ),
    );
  }
}
