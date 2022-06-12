import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/widgets/web_view.dart';

import 'controller.dart';

class XiaoShuoPage extends StatelessWidget {
  const XiaoShuoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索小说'),
      ),
      body: GetBuilder<XiaoShuoController>(
        init: XiaoShuoController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    width: 150,
                    height: 200,
                    child: _.msg.value.isNotEmpty
                        ? Image.network(
                            _.imageUrl.value,
                            fit: BoxFit.cover,
                          )
                        : const Center(
                            child: Text(
                              '请输入小说名',
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                  ),
                  Stack(
                    children: [
                      Text(_.msg.value),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(
                              WebViewPage(
                                url: _.url.value,
                                title: _.title.value,
                              ),
                            );
                          },
                          child: const Text('进入阅读'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: TextField(
                  controller: _.textEditingController,
                  decoration: InputDecoration(
                    labelText: '请输入小说名字',
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
                    _.getXiaoShuo();
                  },
                  child: const Text('搜索小说')),
            ],
          );
        },
      ),
    );
  }
}
