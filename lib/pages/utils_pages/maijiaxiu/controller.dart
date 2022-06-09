import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class MaiJiaXiuController extends GetxController {
  final imageUrl =
      'https://gw3.alicdn.com/tfscom/tuitui/O1CN01dTzybe1acLInNZuQm_!!0-rate.jpg'
          .obs;

  Future<void> getTaoImage() async {
    DioResponse res = await dioUtil.request(maijiaXiu, method: DioMethod.get);

    var data = res.data;
    if (res.code == 0) {
      int start = data.indexOf('=');
      int end = data.lastIndexOf('±');

      String url = data.substring(start + 1, end);
      imageUrl.value = url;
      update();
      print(imageUrl.value);
    }
  }
}
