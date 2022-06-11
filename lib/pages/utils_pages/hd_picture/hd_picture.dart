import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/utils/clipboard_tool/clipboard_tool.dart';

import 'controller.dart';

class HDPicturePage extends StatelessWidget {
  const HDPicturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('高清图片'),
      ),
      body: GetBuilder<HDPictureController>(
        init: HDPictureController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  _.changeIsExpanded();
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: ((context, isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(_.lx.value),
                      );
                    }),
                    body: Column(
                      children: _.list
                          .map((e) => InkWell(
                                onTap: (() {
                                  _.lx.value = e;
                                  _.getHDPicture();

                                  _.changeIsExpanded();
                                }),
                                child: ListTile(
                                  title: Text(e),
                                ),
                              ))
                          .toList(),
                    ),
                    isExpanded: _.isExpanded.value,
                  )
                ],
              ),
              _.pic.value.isNotEmpty
                  ? Stack(
                      children: [
                        Image.network(_.pic.value),
                        Positioned(
                            right: 3,
                            child: ElevatedButton(
                              onPressed: () {
                                ClipboardTool.setDataToast(_.pic.value);
                              },
                              child: const Text('复制图片链接'),
                            ))
                      ],
                    )
                  : const Center(
                      child: Text('加载中'),
                    ),
            ],
          );
        },
      ),
      floatingActionButton: GetBuilder<HDPictureController>(
        init: HDPictureController(),
        initState: (_) {},
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              _.getHDPicture();
            },
            child: const Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}
