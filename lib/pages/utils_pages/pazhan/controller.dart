import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class PaZhanController extends GetxController {
  final url = ''.obs;
  TextEditingController textEditingController = TextEditingController();

  Future<void> getPazhan() async {
    DioResponse res = await dioUtil.request(
      paZhan + textEditingController.text,
      method: DioMethod.get,
    );
    if (res.code == 0) {
      var data = jsonDecode(res.data);
      url.value = data['url'];
      // textEditingController.text = '';
      update();
      print(url.value);
    }
  }
}
