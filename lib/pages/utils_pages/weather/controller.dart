import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class WeatherController extends GetxController {
  final local = ''.obs;
  final localSelect = ''.obs;
  final focusNode = FocusNode();
  TextEditingController localController = TextEditingController(
    text: '洛阳',
  );
  TextEditingController localSelectController = TextEditingController(
    text: '1',
  );
  Future<void> getWeather() async {
    DioResponse res = await dioUtil.request(
      weather + localController.text,
      method: DioMethod.get,
    );

    local.value = res.data;
    update();
  }

  Future<void> getWeather2() async {
    DioResponse res = await dioUtil.request(
      weather + localController.text,
      params: {'b': localSelectController.text},
      method: DioMethod.get,
    );

    localSelect.value = res.data;
    update();
  }

  @override
  void onReady() async {
    await getWeather();
    await getWeather2();
    super.onReady();
  }

  @override
  void dispose() {
    localController.dispose();
    localSelectController.dispose();
    super.dispose();
  }
}
