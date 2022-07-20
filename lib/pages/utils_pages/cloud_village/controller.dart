import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_method.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';
import 'package:video_player/video_player.dart';

class CloudVillageController extends GetxController {
  final nickname = ''.obs;
  final title = ''.obs;
  final avatarurl = ''.obs;
  final coverurl =
      'http://p4.qhimg.com/bdm/1280_1024_85/t015b4d2e1b681ad032.jpg'.obs;
  final videourl = ''.obs;
  final isInitialized = false.obs;
  late VideoPlayerController videoPlayerController;

  Future<void> getCloudVillage() async {
    isInitialized.value = false;
    DioResponse res = await dioUtil.request(
      cloudVillage + '推荐',
      method: DioMethod.get,
    );
    if (res.code == 0) {
      var data = jsonDecode(res.data);
      // print(data);
      debugPrint(data.toString());
      nickname.value = data['nickname'];
      title.value = data['titel'];
      avatarurl.value = data['avatarurl'];
      coverurl.value = data['coverurl'];
      videourl.value = data['videourl'];
      videoPlayerController = VideoPlayerController.network(videourl.value)
        ..initialize().then((value) {
          isInitialized.value = true;
          videoPlayerController.play();
          update();
        });
      update();
    } else {
      debugPrint('获取云村失败');
    }
  }

  final url =
      'http://vodkgeyttp9.vod.126.net/cloudmusic/obj/w5zDkcKQw6LDiWzDgcK2/7266527827/65de/44ab/8930/de45e7c8d27758a9984959f27277bc2f.mp4?wsSecret=4fa75fecded0eea3f3c5f12a15bfb9c2&wsTime=1655110393';

  @override
  void onInit() async {
    await getCloudVillage();

    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
