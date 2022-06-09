import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class PingController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final ip = ''.obs;
  final maxDelay = ''.obs;
  final minDelay = ''.obs;
  final local = ''.obs;
  final nowTime = ''.obs;

  Future<void> getPing() async {
    DioResponse res = await dioUtil.request(
      ping + textEditingController.text,
      method: DioMethod.get,
    );
    var data = res.data;

    /// ip
    int ipStart = data.indexOf('址') + 2;
    int ipEnd = data.indexOf('最') - 1;

    /// 地理位置
    int localStart = data.indexOf('置') + 2;
    int localEnd = data.indexOf('当') - 1;
    local.value = data.substring(localStart, localEnd);

    /// 最大延迟

    int maxDelayStart = data.indexOf('大') - 1;
    int maxDelayEnd = data.indexOf('小') - 2;
    maxDelay.value = data.substring(maxDelayStart, maxDelayEnd);

    /// 最小延迟
    int minDelayStart = data.indexOf('小') - 1;
    int minDelayEnd = data.indexOf('理') - 1;
    minDelay.value = data.substring(minDelayStart, minDelayEnd);

    /// 当前时间
    int timeStart = data.indexOf('间') + 2;
    // int timeEnd = data.indexOf('理') - 1;
    print(data.substring(timeStart));
    nowTime.value = data.substring(timeStart);

    update();
  }
}
