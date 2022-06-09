import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class ChangBaController extends GetxController {
  final userImage =
      'http://aliimg.changba.com/cache/photo/9083ba83-407c-452d-8788-9b11ca7bb476_0_0.jpg'
          .obs;
  final nickName = '陈奕迅'.obs;
  final songUrl =
      'https://authqiniuuwmp3.changba.com/1225009453.mp3?sign=96779923e9efce9ac75bcc13a6592f23&t=62a45d62'
          .obs;

  final isPlay = false.obs;

  void changePlay() {
    isPlay.value = !isPlay.value;
    isPlay.value ? audioPlayer.play(songUrl.value) : audioPlayer.pause();
    update();
  }

  void nextPlay() async {
    if (isPlay.value) {
      await audioPlayer.stop();
      await audioPlayer.play(songUrl.value);
      isPlay.value = true;
      update();
    } else {
      await audioPlayer.stop();
      await audioPlayer.play(songUrl.value);
      isPlay.value = true;
      update();
    }
  }

  AudioPlayer audioPlayer = AudioPlayer();
  void play() async {
    print('播放音频:${songUrl.value}');
    try {
      int result = await audioPlayer.play(songUrl.value);
      if (result == 1) {
        // success
        isPlay.value = true;
        print('播放音频成功');
      }
    } catch (e) {
      isPlay.value = false;
      print('播放音频失败:$e');
    }
  }

  Future<void> getChangBa() async {
    DioResponse res = await dioUtil.request(changBa);
    if (res.code == 0) {
      var data = res.data;
      print(data.toString());
      int imageStart = data.toString().indexOf('=') + 1;
      int imageEnd = data.toString().lastIndexOf('±');
      userImage.value = data.toString().substring(imageStart, imageEnd);
      print(userImage.value);
      int nickNameStart = data.toString().indexOf('原') + 3;
      int nickNameEnd = data.toString().lastIndexOf('歌');
      nickName.value = data.toString().substring(nickNameStart, nickNameEnd);
      print(nickName.value);
      int songUrlEnd = data.toString().indexOf('接') + 2;
      songUrl.value = data.toString().substring(songUrlEnd);
      print(songUrl.value);
      update();
    }
  }

  @override
  void onInit() {
    changePlay();
    super.onInit();
  }

  @override
  void onClose() {
    audioPlayer.stop();
    super.onClose();
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }
}
