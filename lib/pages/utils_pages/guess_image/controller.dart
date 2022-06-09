import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class GuessImageController extends GetxController {
  final guessImageData = [].obs;

  var tips = false.obs;

  var image = 'http://api.weijieyue.cn/api/tupian/image/183.jpg'.obs;

  final textEditingController = TextEditingController();

  void changeTips() {
    tips.value = !tips.value;
    update();
    print(tips.value);
  }

  Future<void> getGuessImage() async {
    DioResponse res = await dioUtil.request(
      guessImage,
      method: DioMethod.get,
    );
    if (res.code == 0) {
      var data = jsonDecode(res.data);
      guessImageData.value = data['data'];
      update();
      print(guessImageData.value);
    }
  }

  @override
  void onInit() async {
    await getGuessImage();
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
