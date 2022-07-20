import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/alapi.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class CheckAreasAtRiskController extends GetxController {
  final end_update_time = ''.obs;
  final high_count = 0.obs;
  final middle_count = 0.obs;
  final high_list = [].obs;
  final middle_list = [].obs;

  final communitys = [
    "北疆社区"
        "东城社区"
        "额仁社区"
        "呼和社区"
        "南苑社区"
        "乌兰社区"
        "西城社区"
        "锡林社区"
        "格日勒敖都苏木"
  ];
  Future<void> getCheckAreasAtRisk() async {
    DioResponse res = await dioUtil.request(
      CHECK_AREAS_AT_RISK,
      method: DioMethod.get,
    );

    if (res.code == 0) {
      var data = jsonDecode(res.data);
      high_count.value = data['data']['high_count'];
      middle_count.value = data['data']['middle_count'];
      end_update_time.value = data['data']['end_update_time'];
      high_list.value = data['data']['high_list'];
      middle_list.value = data['data']['middle_list'];

      update();
      debugPrint(high_list.toString());
      debugPrint(middle_list.toString());
    }
  }

  @override
  void onReady() async {
    await getCheckAreasAtRisk();
    super.onReady();
  }
}
