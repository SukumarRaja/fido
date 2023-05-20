import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import '../../../controller/match.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../common/text.dart';
import '../swip_stack.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: AppColors.white),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            child: Stack(
              children: [
                AbsorbPointer(
                  absorbing: MatchingController.to.exceedFreeSwipe,
                  child: Stack(
                    children: [
                      Obx(() => Container(
                          height: MediaQuery.of(context).size.height * .78,
                          width: MediaQuery.of(context).size.width,
                          decoration:
                              const BoxDecoration(color: AppColors.white),
                          child: MatchingController.to.usersEmpty == true
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: AppColors.secondary,
                                          radius: 40,
                                        ),
                                      ),
                                      CommonText(
                                          text:
                                              "There's no one new around you.",
                                          textAlign: TextAlign.center,
                                          style: regularText(fontSize: 18))
                                    ],
                                  ),
                                )
                              : SwipeStack(
                                  key: MatchingController.to.swipeKey,
                                  children: [
                                    SwiperItem(builder:
                                        (SwiperPosition position,
                                            double progress) {
                                      return Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                        child: Container(
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(30)),
                                                child: Swiper(
                                                  customLayoutOption:
                                                      CustomLayoutOption(
                                                    stateCount: 0,
                                                    startIndex: 0,
                                                  ),
                                                  key: UniqueKey(),
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index2) {
                                                    return SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .78,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child:

                                                          // CachedNetworkImage(
                                                          //   // imageUrl: index.imageUrl![index2] ?? "",
                                                          //   imageUrl: "https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg?w=1380&t=st=1684501686~exp=1684502286~hmac=5cbff2d1dc8685cab3ef187043d65854959f8b7341c29cfe30e109463201d61b",
                                                          //   fit: BoxFit.cover,
                                                          //   useOldImageOnUrlChange:
                                                          //       true,
                                                          //   placeholder: (context,
                                                          //           url) =>
                                                          //       const CupertinoActivityIndicator(
                                                          //     radius: 20,
                                                          //   ),
                                                          //   errorWidget: (context,
                                                          //           url, error) =>
                                                          //       const Icon(
                                                          //           Icons.error),
                                                          // ),
                                                          Image.network(
                                                        "https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg?w=1380&t=st=1684501686~exp=1684502286~hmac=5cbff2d1dc8685cab3ef187043d65854959f8b7341c29cfe30e109463201d61b",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  },
                                                  // itemCount: index.imageUrl!.length,
                                                  itemCount: 2,
                                                  pagination: const SwiperPagination(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      builder:
                                                          DotSwiperPaginationBuilder(
                                                              activeSize: 13,
                                                              color: AppColors
                                                                  .secondary,
                                                              activeColor:
                                                                  AppColors
                                                                      .primary)),
                                                  control: const SwiperControl(
                                                    color: AppColors.primary,
                                                    disableColor:
                                                        AppColors.secondary,
                                                  ),
                                                  loop: false,
                                                ),
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.all(
                                                      48.0),
                                                  child: position.toString() ==
                                                          "SwiperPosition.Left"
                                                      ? Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child:
                                                              Transform.rotate(
                                                            angle: pi / 8,
                                                            child: Container(
                                                              height: 40,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  border: Border.all(
                                                                      width: 2,
                                                                      color: Colors
                                                                          .red)),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                    "NOPE",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            32)),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : position.toString() ==
                                                              "SwiperPosition.Right"
                                                          ? Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Transform
                                                                  .rotate(
                                                                angle: -pi / 8,
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  width: 100,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border: Border.all(
                                                                          width:
                                                                              2,
                                                                          color:
                                                                              Colors.lightBlueAccent)),
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                        "LIKE",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.lightBlueAccent,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 32)),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : Container()),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: ListTile(
                                                        onTap: () {
                                                          // _loadInterstitialAd();
                                                          //
                                                          // // _ads.myInterstitial()
                                                          // //   ..load()
                                                          // //   ..show();
                                                          //
                                                          // //  if (_isBannerAdReady)
                                                          // _interstitialAd
                                                          //     ?.show();
                                                          //
                                                          // showDialog(
                                                          //     barrierDismissible:
                                                          //     false,
                                                          //     context:
                                                          //     context,
                                                          //     builder:
                                                          //         (context) {
                                                          //       return Info(
                                                          //           index,
                                                          //           widget
                                                          //               .currentUser,
                                                          //           swipeKey);
                                                          //     });
                                                        },
                                                        title: Text(
                                                          // "${index.name}, ${index.editInfo!['showMyAge'] != null ? !index.editInfo!['showMyAge'] ? index.age : "" : index.age}",
                                                          "25",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        subtitle: Text(
                                                          // "${index.address}",
                                                          "address",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                          ),
                                                        ))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                  threshold: 30,
                                  maxAngle: 100,
                                  //animationDuration: Duration(milliseconds: 400),
                                  visibleCount: 5,
                                  historyCount: 1,
                                  stackFrom: StackFrom.Right,
                                  translationInterval: 5,
                                  scaleInterval: 0.08,
                                  onSwipe: (int index,
                                      SwiperPosition position) async {
                                    // _adsCheck(countswipe);
                                    // print(position);
                                    // print(widget.users[index].name);
                                    // CollectionReference docRef =
                                    // FirebaseFirestore.instance
                                    //     .collection("Users");
                                    // if (position == SwiperPosition.Left) {
                                    //   await docRef
                                    //       .doc(widget.currentUser.id)
                                    //       .collection("CheckedUser")
                                    //       .doc(widget.users[index].id)
                                    //       .set({
                                    //     'DislikedUser': widget.users[index].id,
                                    //     'timestamp': DateTime.now(),
                                    //   }, SetOptions(merge: true));
                                    //
                                    //   if (index < widget.users.length) {
                                    //     userRemoved.clear();
                                    //     setState(() {
                                    //       userRemoved.add(widget.users[index]);
                                    //       widget.users.removeAt(index);
                                    //     });
                                    //   }
                                    // } else if (position ==
                                    //     SwiperPosition.Right) {
                                    //   if (likedByList
                                    //       .contains(widget.users[index].id)) {
                                    //     showDialog(
                                    //         context: context,
                                    //         builder: (ctx) {
                                    //           Future.delayed(
                                    //               Duration(milliseconds: 1700),
                                    //                   () {
                                    //                 Navigator.pop(ctx);
                                    //               });
                                    //           return Padding(
                                    //             padding: const EdgeInsets.only(
                                    //                 top: 80),
                                    //             child: Align(
                                    //               alignment:
                                    //               Alignment.topCenter,
                                    //               child: Card(
                                    //                 child: Container(
                                    //                   height: 100,
                                    //                   width: 300,
                                    //                   child: Center(
                                    //                     child: Text(
                                    //                       "It's a match\n With ",
                                    //                       textAlign:
                                    //                       TextAlign.center,
                                    //                       style: TextStyle(
                                    //                           color:
                                    //                           primaryColor,
                                    //                           fontSize: 30,
                                    //                           decoration:
                                    //                           TextDecoration
                                    //                               .none),
                                    //                     ).tr(args: [
                                    //                       '${widget.users[index].name}'
                                    //                     ]),
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           );
                                    //         });
                                    //     await docRef
                                    //         .doc(widget.currentUser.id)
                                    //         .collection("Matches")
                                    //         .doc(widget.users[index].id)
                                    //         .set({
                                    //       'Matches': widget.users[index].id,
                                    //       'isRead': false,
                                    //       'userName': widget.users[index].name,
                                    //       'pictureUrl':
                                    //       widget.users[index].imageUrl![0],
                                    //       'timestamp':
                                    //       FieldValue.serverTimestamp()
                                    //     }, SetOptions(merge: true));
                                    //     await docRef
                                    //         .doc(widget.users[index].id)
                                    //         .collection("Matches")
                                    //         .doc(widget.currentUser.id)
                                    //         .set({
                                    //       'Matches': widget.currentUser.id,
                                    //       'userName': widget.currentUser.name,
                                    //       'pictureUrl':
                                    //       widget.currentUser.imageUrl![0],
                                    //       'isRead': false,
                                    //       'timestamp':
                                    //       FieldValue.serverTimestamp()
                                    //     }, SetOptions(merge: true));
                                    //   }
                                    //
                                    //   await docRef
                                    //       .doc(widget.currentUser.id)
                                    //       .collection("CheckedUser")
                                    //       .doc(widget.users[index].id)
                                    //       .set({
                                    //     'LikedUser': widget.users[index].id,
                                    //     'timestamp':
                                    //     FieldValue.serverTimestamp(),
                                    //   }, SetOptions(merge: true));
                                    //   await docRef
                                    //       .doc(widget.users[index].id)
                                    //       .collection("LikedBy")
                                    //       .doc(widget.currentUser.id)
                                    //       .set({
                                    //     'LikedBy': widget.currentUser.id,
                                    //     'timestamp':
                                    //     FieldValue.serverTimestamp()
                                    //   }, SetOptions(merge: true));
                                    //   if (index < widget.users.length) {
                                    //     userRemoved.clear();
                                    //     setState(() {
                                    //       userRemoved.add(widget.users[index]);
                                    //       widget.users.removeAt(index);
                                    //     });
                                    //   }
                                    // } else
                                    //   debugPrint("onSwipe $index $position");
                                  },
                                  onRewind:
                                      (int index, SwiperPosition position) {
                                    // swipeKey.currentContext!
                                    //     .dependOnInheritedWidgetOfExactType();
                                    // widget.users.insert(index, userRemoved[0]);
                                    // setState(() {
                                    //   userRemoved.clear();
                                    // });
                                    // debugPrint("onRewind $index $position");
                                    // print(widget.users[index].id);
                                  },
                                ))),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              // widget.users.length != 0
                              Obx(
                                () => MatchingController.to.usersEmpty == true
                                    ? FloatingActionButton(
                                        heroTag: UniqueKey(),
                                        backgroundColor: Colors.white,
                                        child: const Icon(
                                          // userRemoved.length > 0
                                          //     ? Icons.replay
                                          //     : Icons.not_interested,
                                          Icons.replay,
                                          // color: userRemoved.length > 0
                                          //     ? Colors.amber
                                          //     : AppColors.secondary,
                                          color: AppColors.secondary,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          // if (userRemoved.length > 0) {
                                          //   swipeKey.currentState!.rewind();
                                          // }
                                        })
                                    : FloatingActionButton(
                                        heroTag: UniqueKey(),
                                        backgroundColor: Colors.white,
                                        child: const Icon(
                                          Icons.refresh,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                        onPressed: () {},
                                      ),
                              ),
                              FloatingActionButton(
                                  heroTag: UniqueKey(),
                                  backgroundColor: Colors.white,
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    // if (widget.users.length > 0) {
                                    //   print("object");
                                    //   swipeKey.currentState!.swipeLeft();
                                    // }
                                  }),
                              FloatingActionButton(
                                  heroTag: UniqueKey(),
                                  backgroundColor: Colors.white,
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.lightBlueAccent,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    // if (widget.users.length > 0) {
                                    //   swipeKey.currentState!.swipeRight();
                                    // }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => MatchingController.to.exceedFreeSwipe == true
                    ? Align(
                        alignment: Alignment.center,
                        child: InkWell(
                            child: Container(
                              color: Colors.white.withOpacity(.3),
                              child: Dialog(
                                insetAnimationCurve: Curves.bounceInOut,
                                insetAnimationDuration: Duration(seconds: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.white,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .55,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        size: 50,
                                        color: AppColors.primary,
                                      ),
                                      Text(
                                        "you have already used the maximum number of free available swipes for 24 hrs.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 16),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.lock_outline,
                                          size: 120,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      Text(
                                        "For swipe more users just subscribe our premium plans.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             Subscription(null, null, widget.items)));
                            }),
                      )
                    : const SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
