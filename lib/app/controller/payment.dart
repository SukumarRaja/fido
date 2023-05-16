import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get to => Get.put(PaymentController());

  final _paymentmethodIndex = 0.obs;

  get paymentmethodIndex => _paymentmethodIndex.value;

  set paymentmethodIndex(value) {
    _paymentmethodIndex.value = value;
  }
}
