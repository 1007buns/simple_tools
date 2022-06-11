import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class LzyController extends GetxController {
  final msg = ''.obs;
  final url = ''.obs;
  final file = ''.obs;
  TextEditingController textEditingController =
      TextEditingController(text: 'https://wws.lanzout.com/iJAtU03p0d3a');
  Future<void> getLzyUrl() async {
    DioResponse res = await dioUtil.request(
      lanzouyun + textEditingController.text,
      method: DioMethod.get,
    );
    if (res.code == 0) {
      var data = jsonDecode(res.data);
      msg.value = data['msg'];
      url.value = data['url'];
      file.value = data['file'];
      update();
      print(data);
    }
  }

  @override
  void onInit() {
    getLzyUrl();
    super.onInit();
  }
}
