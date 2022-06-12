import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class YiYanController extends GetxController {
  final msg = ''.obs;

  Future<void> getYiYan() async {
    DioResponse res = await dioUtil.request(
      yiYan,
      method: DioMethod.get,
    );
    if (res.code == 0) {
      var data = res.data;
      msg.value = res.data.toString();
      update();
    }
  }

  @override
  void onReady() async {
    await getYiYan();
    super.onReady();
  }
}
