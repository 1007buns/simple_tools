import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class XiaodajiChatPage extends StatelessWidget {
  const XiaodajiChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('王者小妲己聊天'),
      ),
      body: GetBuilder<XiaodajiChatController>(
        init: XiaodajiChatController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  _.xiaodajiMsg.value,
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: TextField(
                  controller: _.textEditingController,
                  decoration: InputDecoration(
                    labelText: '请输入聊天内容',
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
                child: const Text('发送讯息'),
                onPressed: () async {
                  _.sendMsg();
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 48.0),
                child: Icon(
                  Icons.volume_up,
                  size: 80.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
