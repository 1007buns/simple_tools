import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class TgrjPage extends StatelessWidget {
  const TgrjPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('舔狗日记'),
      ),
      body: GetBuilder<TgrjController>(
        init: TgrjController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Text(
                _.msg.value,
                style: const TextStyle(fontSize: 25.0),
              ),
              ElevatedButton(
                onPressed: () {
                  _.getTgrj();
                },
                child: const Text('下一条'),
              ),
            ],
          );
        },
      ),
    );
  }
}
