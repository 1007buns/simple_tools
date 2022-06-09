import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class ChangYaController extends GetxController {
  final userImage =
      'http://img-cdn.api.singduck.cn/user-img/92cc666fbeb048d19dbecb9140c3aef7.png'
          .obs;
  final nickName = '🐌耳又又'.obs;
  final songUrl =
      'http://audio-cdn.singduck.cn/ugc/f7b111c1b6b1_1360916112.mp3?auth_key=1654926818-0-0-619e8488717d879fb5416d935565825b'
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

  Future<void> getChangYa() async {
    DioResponse res = await dioUtil.request(changYa);
    if (res.code == 0) {
      var data = res.data;
      // print(data.toString());
      int imageStart = data.toString().indexOf('=') + 1;
      int imageEnd = data.toString().lastIndexOf('±');
      userImage.value = data.toString().substring(imageStart, imageEnd);
      print(userImage.value);
      int nickNameStart = data.toString().indexOf('昵') + 3;
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
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }
}
