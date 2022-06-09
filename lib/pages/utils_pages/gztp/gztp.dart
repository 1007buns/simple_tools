import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/utils/clipboard_tool/clipboard_tool.dart';

import 'controller.dart';

class GztpPage extends StatelessWidget {
  const GztpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('各种图片'),
      ),
      body: GetBuilder<GztpController>(
        init: GztpController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Wrap(
                spacing: 15,
                children: List.generate(
                  10,
                  (index) {
                    return ChoiceChip(
                      label: Text(_.msgList[index]),
                      selected: _.selectIndex.value == index,
                      onSelected: (v) {
                        _.onSelectedChanged(index);
                        _.getGztp(classif: _.msgList[_.selectIndex.value]);
                      },
                    );
                  },
                ).toList(),
              ),
              SizedBox(
                height: 300,
                child: Image.network(_.classImage.value),
              ),
              ElevatedButton(
                onPressed: () {
                  ClipboardTool.setDataToast(_.classImage.value);
                },
                child: const Text('复制图片网址'),
              ),
            ],
          );
        },
      ),
      floatingActionButton: GetBuilder<GztpController>(
        init: GztpController(),
        initState: (_) {},
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              _.getGztp(classif: _.msgList[_.selectIndex.value]);
            },
            child: const Icon(Icons.last_page),
          );
        },
      ),
    );
  }
}
