import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/apis/apis.dart';

import 'controller.dart';

class GetOutIconPage extends StatelessWidget {
  const GetOutIconPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("恶搞qq头像表情包"),
      ),
      body: GetBuilder<GetOutIconPageController>(
        init: GetOutIconPageController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: PageView(
                    children: [
                      _.getOutQid.value == ''
                          ? const Text('您输入的qq号码有误,请检查后重新输入')
                          : Image.network(getOutIcon + _.getOutQid.value),
                      _.getOutQid.value == ''
                          ? const Text('您输入的qq号码有误,请检查后重新输入')
                          : Image.network(getZanIcon + _.getOutQid.value),
                      _.getOutQid.value == ''
                          ? const Text('您输入的qq号码有误,请检查后重新输入')
                          : Image.network(getDiuIcon + _.getOutQid.value),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text('左右滑动看看'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: TextField(
                  controller: _.textEditingController,
                  decoration: InputDecoration(
                    labelText: '请输入QQ号',
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
                child: const Text('生成表情包'),
                onPressed: () {
                  _.changeQid();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
