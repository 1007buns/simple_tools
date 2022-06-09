import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/utils/clipboard_tool/clipboard_tool.dart';

import 'controller.dart';

class PaZhanPage extends StatelessWidget {
  const PaZhanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('扒站'),
      ),
      body: GetBuilder<PaZhanController>(
        init: PaZhanController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Text(
                '当前网址: ${_.textEditingController.text}',
                style: _textStyle,
              ),
              Text(
                '您提交的网址: ${_.textEditingController.text}',
                style: _textStyle,
              ),
              const Text('---爬取的网站均打包成 .zip格式---'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    // height: 50,
                    width: 300,
                    child: Text(
                      '打包地址：${_.url.value}',
                      maxLines: 2,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ClipboardTool.setDataToast(_.url.value);
                    },
                    child: const Text('复制'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: TextField(
                  controller: _.textEditingController,
                  decoration: InputDecoration(
                    labelText: '请输入网址',
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
                child: const Text('提交'),
                onPressed: () {
                  _.getPazhan();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
