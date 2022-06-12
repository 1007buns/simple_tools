import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class XingZuoController extends GetxController {
  final msg = ''.obs;
  final pic = ''.obs;
  final selectIndex = 0.obs;
  final xingzuo = ''.obs;
  final isExpanded = false.obs;
  final xingZuoList = <String>[
    '白羊座',
    '金牛座',
    '双子座',
    '巨蟹座',
    '狮子座',
    '处女座',
    '天秤座',
    '天蝎座',
    '射手座',
    '摩羯座',
    '水瓶座',
    '双鱼座',
  ];

  void onSelectedChanged(int index) {
    selectIndex.value = index;
    update();
  }

  void changeIsExpanded() {
    isExpanded.value = !isExpanded.value;
    update();
  }

  Future<void> getXingZuo({String selectXingZuo = '天秤'}) async {
    DioResponse res = await dioUtil.request(
      xingZuo + selectXingZuo,
      method: DioMethod.get,
    );
    xingzuo.value = selectXingZuo;
    var data = res.data;
    int msgStart = data.indexOf('查询星座');
    int msgEnd = data.indexOf('幸运数字') + 6;
    msg.value = data.substring(msgStart, msgEnd);

    int picIndex = data.indexOf('速配星座') + 5;
    print(data.substring(picIndex));
    pic.value = data.substring(picIndex);
    update();
    // print(res.data);
  }

  @override
  void onInit() async {
    await getXingZuo();
    super.onInit();
  }
}
