import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class TgrjController extends GetxController {
  final msg = ''.obs;
  Future<void> getTgrj() async {
    DioResponse res = await dioUtil.request(tgrj, method: DioMethod.get);

    msg.value = res.data.toString().substring(5);
    update();
  }

  @override
  void onInit() {
    getTgrj();
    super.onInit();
  }
}
