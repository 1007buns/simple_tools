import 'package:flutter/services.dart';
import 'package:get/get.dart';

//复制粘贴
class ClipboardTool {
  //复制内容
  static setData(String data) {
    if (data != '') {
      Clipboard.setData(ClipboardData(text: data));
    }
  }

  //复制内容
  static setDataToast(String data) {
    if (data != '') {
      Clipboard.setData(ClipboardData(text: data));
      Get.snackbar('提示', '复制成功');
      print('复制成功');
    }
  }

  //复制内容
  static setDataToastMsg(String data, {String toastMsg = '复制成功'}) {
    if (data != '') {
      Clipboard.setData(ClipboardData(text: data));
      print(toastMsg);
    }
  }

  //获取内容
  static Future<ClipboardData?> getData() {
    return Clipboard.getData(Clipboard.kTextPlain);
  }

//将内容复制系统
//   ClipboardUtil.setData('123');
//从系统获取内容
//   ClipboardUtil.getData().then((data){}).catchError((e){});

}
