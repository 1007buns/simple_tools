import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/utils/clipboard_tool/clipboard_tool.dart';

import 'controller.dart';

class MaiJiaXiuPage extends StatelessWidget {
  const MaiJiaXiuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('淘宝买家秀'),
      ),
      body: GetBuilder<MaiJiaXiuController>(
        init: MaiJiaXiuController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              SizedBox(
                height: 400,
                child: Image.network(
                  _.imageUrl.value,
                  fit: BoxFit.cover,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  ClipboardTool.setDataToast(_.imageUrl.value);
                },
                child: const Text('复制图片网址'),
              ),
            ],
          );
        },
      ),
      floatingActionButton: GetBuilder<MaiJiaXiuController>(
        init: MaiJiaXiuController(),
        initState: (_) {},
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              _.getTaoImage();
            },
            child: const Icon(Icons.restart_alt),
          );
        },
      ),
    );
  }
}
