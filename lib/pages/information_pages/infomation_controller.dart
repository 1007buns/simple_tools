import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class InfomationController extends GetxController {
  final name = ''.obs;
  final last_update = ''.obs;
  final infoList = [].obs;

  final selectIndex = 4.obs;
  final typeInfoList = [
    'zhihu',
    'weibo',
    'weixin',
    'baidu',
    'toutiao',
    '163',
    'xl',
    '36k',
    'hitory',
    'sspai',
    'csdn',
    'juejin',
    'bilibili',
    'douyin',
    '52pojie',
    'v2ex',
    'hostloc',
  ];
  final info = [
    '知乎',
    '微博',
    '微信',
    '百度',
    '头条',
    '网易',
    '新浪网',
    '36氪',
    '历史上的今天',
    '少数派',
    'csdn',
    '掘金',
    '哔哩哔哩',
    '抖音',
    '吾爱破解',
    'v2ex热帖',
    '全球主机论坛热帖',
  ];

  void onSelectedChanged(int index) {
    selectIndex.value = index;
    update();
  }

  Future<void> getInfo({required String info}) async {
    debugPrint('获取资讯$info');
    infoList.clear();
    DioResponse res = await dioUtil.request(
      'https://v2.alapi.cn/api/tophub/get',
      params: {'type': info},
      method: DioMethod.get,
    );

    if (res.code == 0) {
      var data = json.decode(res.data);
      data = data['data'];
      name.value = data['name'];
      last_update.value = data['last_update'];
      infoList.value = data['list'];
      debugPrint(data.toString());
      update();
    }
  }

  @override
  void onInit() async {
    await getInfo(info: typeInfoList[selectIndex.value]);
    super.onInit();
  }
}
