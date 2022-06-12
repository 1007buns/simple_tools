import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class XiaoShuoController extends GetxController {
  final title = ''.obs;
  final url = ''.obs;
  final imageUrl = ''.obs;
  final msg = ''.obs;

  TextEditingController textEditingController =
      TextEditingController(text: '北派盗墓笔记');
  Future<void> getXiaoShuo() async {
    DioResponse res = await dioUtil.request(
      xiaoShuo + textEditingController.text,
      params: {'b': 1},
      method: DioMethod.get,
    );
    if (res.code == 0) {
      var data = res.data;
      int imageUrlStart = data.indexOf('=') + 1;
      int imageUrlEnd = data.toString().lastIndexOf('±');
      imageUrl.value = data.substring(imageUrlStart, imageUrlEnd);
      print(imageUrl.value);
      int titleStart = data.indexOf('小说名') + 4;
      int titleEnd = data.indexOf('作者') - 2;
      title.value = data.substring(titleStart, titleEnd);
      // print(title.value);
      int urlStart = data.indexOf('小说链接') + 5;
      url.value = data.substring(urlStart);
      // print(data.substring(urlStart));
      int msgStart = data.indexOf('小说名');
      msg.value = data.substring(msgStart);
      update();
      print(res.data);
    }
  }
}
