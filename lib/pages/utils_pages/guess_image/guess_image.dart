import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class GuessImagePage extends StatelessWidget {
  const GuessImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('看图猜成语'),
      ),
      body: GetBuilder<GuessImageController>(
        init: GuessImageController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              _.guessImageData.isEmpty
                  ? const Center(child: Text('加载中...'))
                  : Image.network(_.guessImageData[0]['image']),
              _.guessImageData.isEmpty
                  ? const Center(child: Text('加载中...'))
                  : Center(
                      child: _.tips.value
                          ? Text('tips:  ${_.guessImageData[0]['interpret']}')
                          : Text('tips:  ${_.guessImageData[0]['provenance']}'),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: TextField(
                  controller: _.textEditingController,
                  decoration: InputDecoration(
                    labelText: '请输入成语',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _.textEditingController.text = '';
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_.textEditingController.text ==
                      _.guessImageData[0]['name']) {
                    Get.snackbar('提示', '正确！');
                  } else {
                    Get.snackbar('提示', '请重试');
                  }
                },
                child: const Text("试试"),
              ),
              ElevatedButton(
                onPressed: () {
                  _.getGuessImage();
                },
                child: const Text("下一个"),
              ),
            ],
          );
        },
      ),
      floatingActionButton: GetBuilder<GuessImageController>(
        init: GuessImageController(),
        initState: (_) {},
        builder: (_) {
          return FloatingActionButton(
            tooltip: '提示',
            onPressed: () {
              _.changeTips();
            },
            child: const Icon(Icons.lightbulb_outline),
          );
        },
      ),
    );
  }
}
