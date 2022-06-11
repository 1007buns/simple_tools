import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class HDPictureController extends GetxController {
  final pic = ''.obs;
  final lx = '动漫'.obs;
  final isExpanded = false.obs;

  final list = [
    '美女',
    '风景',
    '动漫',
    '游戏',
    '文字',
    '情感',
  ];
  void changeIsExpanded() {
    isExpanded.value = !isExpanded.value;
    update();
  }

  Future<void> getHDPicture() async {
    DioResponse res = await dioUtil.request(
      '$hdPicture$lx',
      params: {'type': 'js'},
      method: DioMethod.get,
    );

    if (res.code == 0) {
      var data = jsonDecode(res.data);
      pic.value = data['pic'];
      print(data);
      update();
    } else {
      getHDPicture();
    }
  }

  @override
  void onReady() async {
    await getHDPicture();
    super.onReady();
  }
}
