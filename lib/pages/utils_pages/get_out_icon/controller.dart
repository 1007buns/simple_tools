import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetOutIconPageController extends GetxController {
  var getOutQid = '2508824401'.obs;

  TextEditingController textEditingController = TextEditingController();

  void changeQid() {
    getOutQid.value = textEditingController.text;
    update();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
