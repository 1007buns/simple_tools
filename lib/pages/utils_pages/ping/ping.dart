import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class PingPage extends StatelessWidget {
  const PingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
      fontSize: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('ping域名'),
      ),
      body: GetBuilder<PingController>(
        init: PingController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Text('域名: ${_.textEditingController.text}', style: _textStyle),
              Text('ip地址: ${_.ip.value}'),
              Text(_.maxDelay.value),
              Text(_.minDelay.value),
              Text('地理位置: ${_.local.value}', style: _textStyle),
              Text('测试时间: ${_.nowTime.value}', style: _textStyle),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: TextField(
                  controller: _.textEditingController,
                  decoration: InputDecoration(
                    labelText: '请输入域名',
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
                child: const Text('Ping'),
                onPressed: () {
                  _.getPing();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
