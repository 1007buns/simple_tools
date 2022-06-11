import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/utils/clipboard_tool/clipboard_tool.dart';

import 'controller.dart';

class LzyPage extends StatelessWidget {
  const LzyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('蓝奏云解析'),
      ),
      body: GetBuilder<LzyController>(
        init: LzyController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Text('解析结果: ${_.msg.value}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('file: '),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        _.file.value,
                        maxLines: 4,
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ClipboardTool.setDataToast(_.file.value);
                    },
                    child: const Text('复制'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('url:'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        _.url.value,
                        maxLines: 4,
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        overflow: TextOverflow.ellipsis,
                      ),
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
                    labelText: '请输入蓝奏云链接',
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
                child: const Text('开始解析'),
                onPressed: () {
                  _.getLzyUrl();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
