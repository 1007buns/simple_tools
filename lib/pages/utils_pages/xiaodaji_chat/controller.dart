import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';
import 'package:simple_tools/common/utils/dio_util/dio_response.dart';
import 'package:simple_tools/common/utils/dio_util/dio_util.dart';

class XiaodajiChatController extends GetxController {
  final msg = '王者小妲己'.obs;
  final xiaodajiMsg = '你好我是小妲己'.obs;
  final xiaodajiVoice =
      'https://speech.ai.xiaomi.com/speech/1.0/tts_token?token=eyJ2IjoiVjAiLCJuIjoiZW0ifQ.AAAXUkp9P1QAFgBdFAwbUVkVTkoaRRsPG2AFFhgAQgBIRxQYRw4PfR9GGBh0UkRNG10SWEFdCxVMT0ZPFgJDNwFEHkMMEAlAUwgSTUgAWgBZTTJVQQ4YTE9KEUdBAAkUSRNMGBh0XUdeQRtQQ31cWEFEGUZOEgIWYFZHGhtcQVwWAF5GTkIXQBMLG2FTEXMWDUBbRwReFB5NE0QVWRBiVRpKRAsWDhoDWhcfTRRARBRPJgMAAAAHQ04AX1wUSE8UQBECF2McAElaHgAAE1NYFkVIFEAXD18.lcF9Df_pVbMSNOghiEJY3g'
          .obs;

  TextEditingController textEditingController = TextEditingController();

  AudioPlayer audioPlayer = AudioPlayer();

  void sendMsg() async {
    msg.value = textEditingController.text;
    getXiaodaji();
    textEditingController.clear();
    update();
  }

  void play() async {
    print('播放音频:${xiaodajiMsg.value}');
    try {
      int result = await audioPlayer.play(xiaodajiVoice.value);
      if (result == 1) {
        // success
        print('播放音频成功');
      }
    } catch (e) {
      print('播放音频失败:$e');
    }
  }

  @override
  void onReady() {
    // play();
    super.onReady();
  }

  Future<void> getXiaodaji() async {
    DioResponse res = await dioUtil.request(xiaoDaji + msg.value);
    if (res.code == 0) {
      var data = jsonDecode(res.data);
      xiaodajiMsg.value = data['text'];
      xiaodajiVoice.value = data['mp3'];
      print(data);
      play();
      update();
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
