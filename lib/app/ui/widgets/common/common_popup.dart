import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/shopping.dart';
import '../../themes/colors.dart';

shoppingPopupMenu(BuildContext context) {
  showMenu(
    color: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    context: context,
    position: const RelativeRect.fromLTRB(25.0, 120.0, 10.0, 0.0),
    items: [
      PopupMenuItem(
        child: buildShoppingText(text: "Dog", index: 0),
        onTap: () {
          ShoppingController.to.shoppingPopMenuIndex = 0;
          ShoppingController.to.mainMenuIndexForDog = 0;
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildShoppingText(text: "Cat", index: 1),
        onTap: () {
          ShoppingController.to.shoppingPopMenuIndex = 1;
          ShoppingController.to.mainMenuIndexForCat = 0;

          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildShoppingText(text: "Birds", index: 2),
        onTap: () {
          ShoppingController.to.shoppingPopMenuIndex = 2;
          ShoppingController.to.mainMenuIndexForBirds = 0;

          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildShoppingText(text: "Fish & Aquatics", index: 3),
        onTap: () {
          ShoppingController.to.shoppingPopMenuIndex = 3;
          ShoppingController.to.mainMenuIndexForFishAndAquatics = 0;

          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildShoppingText(text: "Small Pets", index: 4),
        onTap: () {
          ShoppingController.to.shoppingPopMenuIndex = 4;
          ShoppingController.to.mainMenuIndexForSmallPets = 0;

          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
    ],
    elevation: 2.0,
  );
}
//
// notificationPopupMenu(BuildContext context) {
//   showMenu(
//     color: AppColors.white,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(8.0),
//       ),
//     ),
//     context: context,
//     position: const RelativeRect.fromLTRB(25.0, 90.0, 10.0, 0.0),
//     items: [
//       PopupMenuItem(
//         child: buildShoppingText(text: "Read"),
//         onTap: () {
//           // DriverController.to.rideStatus = "progress";
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//       PopupMenuItem(
//         child: buildShoppingText(text: "Unread"),
//         onTap: () {
//           // DriverController.to.rideStatus = "close";
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//       PopupMenuItem(
//         child: buildShoppingText(text: "All"),
//         onTap: () {
//           // DriverController.to.rideStatus = "close";
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//     ],
//     elevation: 2.0,
//   );
// }
//
// appointmentPopupMenu(BuildContext context) {
//   showMenu(
//     color: AppColors.white,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(8.0),
//       ),
//     ),
//     context: context,
//     position: const RelativeRect.fromLTRB(25.0, 90.0, 10.0, 0.0),
//     items: [
//       PopupMenuItem(
//         child: buildShoppingText(text: "Morning"),
//         onTap: () {
//           // DriverController.to.rideStatus = "progress";
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//       PopupMenuItem(
//         child: buildShoppingText(text: "Afternoon"),
//         onTap: () {
//           // DriverController.to.rideStatus = "close";
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//       PopupMenuItem(
//         child: buildShoppingText(text: "All"),
//         onTap: () {
//           // DriverController.to.rideStatus = "close";
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//     ],
//     elevation: 2.0,
//   );
// }

Center buildShoppingText({required String text, required index}) {
  return Center(
    child: Obx(() => Container(
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ShoppingController.to.shoppingPopMenuIndex == index
                  ? AppColors.primary
                  : AppColors.grey.withOpacity(.3)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: ShoppingController.to.shoppingPopMenuIndex == index
                      ? AppColors.white
                      : AppColors.black),
            ),
          ),
        )),
  );
}

// commonHistoryPopupMenu(BuildContext context) {
//   showMenu(
//     color: AppColors.white,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(20.0),
//       ),
//     ),
//     context: context,
//     position: const RelativeRect.fromLTRB(25.0, 105.0, 10.0, 0.0),
//     items: [
//       PopupMenuItem(
//         child: buildText(text: "7 days"),
//         onTap: () {
//           // DriverController.to.rideStatus = "close";
//           // DriverController.to.isInitialHistory = false;
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//       PopupMenuItem(
//         child: buildText(text: "1 month"),
//         onTap: () {
//           // DriverController.to.rideStatus = "reject";
//           // DriverController.to.isInitialHistory = false;
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//       PopupMenuItem(
//         child: buildText(text: "All"),
//         onTap: () {
//           // DriverController.to.rideStatus = "reject";
//           // DriverController.to.isInitialHistory = false;
//           //
//           // DriverController.to.getRideHistory();
//         },
//       ),
//     ],
//     elevation: 2.0,
//   );
// }
