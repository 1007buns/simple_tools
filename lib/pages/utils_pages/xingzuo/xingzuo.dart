import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class XingZuoPage extends StatelessWidget {
  const XingZuoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('星座运势'),
      ),
      body: GetBuilder<XingZuoController>(
        init: XingZuoController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              ExpansionPanelList(
                elevation: 0.0,
                expansionCallback: (panelIndex, isExpanded) {
                  _.changeIsExpanded();
                },
                children: [
                  ExpansionPanel(
                    isExpanded: _.isExpanded.value,
                    headerBuilder: ((context, isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _.xingzuo.value,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      );
                    }),
                    body: SizedBox(
                      height: 120,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                        ),
                        itemBuilder: (c, i) {
                          return ChoiceChip(
                            elevation: 0.0,
                            label: Text(
                              _.xingZuoList[i],
                              style: const TextStyle(fontSize: 12.0),
                            ),
                            selected: _.selectIndex.value == i,
                            onSelected: (v) {
                              _.changeIsExpanded();
                              _.getXingZuo(selectXingZuo: _.xingZuoList[i]);
                            },
                          );
                        },
                        itemCount: _.xingZuoList.length,
                      ),
                    ),
                  )
                ],
              ),
              _.pic.value.isNotEmpty
                  ? Image.network(_.pic.value)
                  : const Text('加载中'),
              Text(_.msg.value),
            ],
          );
        },
      ),
    );
  }
}
