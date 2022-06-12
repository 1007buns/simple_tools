import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class YiYanPage extends StatelessWidget {
  const YiYanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('随机一言'),
      ),
      body: GetBuilder<YiYanController>(
        init: YiYanController(),
        initState: (_) {},
        builder: (_) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _.msg.value,
                style: const TextStyle(fontSize: 25.0),
              ),
            ),
          );
        },
      ),
      floatingActionButton: GetBuilder<YiYanController>(
        init: YiYanController(),
        initState: (_) {},
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              _.getYiYan();
            },
            child: const Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}
