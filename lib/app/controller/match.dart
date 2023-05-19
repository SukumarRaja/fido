import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/widgets/swip_stack.dart';

class MatchingController extends GetxController {
  static MatchingController get to => Get.put(MatchingController());

  final swipeKey = GlobalKey<SwipeStackState>();

  final _usersEmpty = false.obs;

  get usersEmpty => _usersEmpty.value;

  set usersEmpty(value) {
    _usersEmpty.value = value;
  }

  final _exceedFreeSwipe = false.obs;

  get exceedFreeSwipe => _exceedFreeSwipe.value;

  set exceedFreeSwipe(value) {
    _exceedFreeSwipe.value = value;
  }
}
