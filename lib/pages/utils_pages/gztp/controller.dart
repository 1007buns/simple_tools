import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class GztpController extends GetxController {
  final selectIndex = 4.obs;
  final index = 0.obs;
  final classImage = ''.obs;

  void onSelectedChanged(int index) {
    selectIndex.value = index;
    update();
  }

  final msgList = [
    '美女',
    '爱情',
    '风景',
    '清新',
    '动漫',
    '明星',
    '萌宠',
    '游戏',
    '汽车',
    '时尚',
    '日历',
    '影视',
    '军事',
    '体育',
    '萌娃',
    '格言',
  ];

  Future<void> getGztp({required String classif}) async {
    classImage.value = '';
    DioResponse res = await dioUtil.request(
      gztp + classif,
      method: DioMethod.get,
    );
    if (res.code == 0) {
      String imageUrl = res.data;
      classImage.value = imageUrl;
      update();
      // print(res.data);
    }
  }

  @override
  void onInit() async {
    await getGztp(classif: msgList[selectIndex.value]);
    super.onInit();
  }
}
