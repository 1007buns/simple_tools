import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/widgets/web_view.dart';

import 'infomation_controller.dart';

class Infomation extends StatefulWidget {
  const Infomation({Key? key}) : super(key: key);

  @override
  State<Infomation> createState() => _InfomationState();
}

class _InfomationState extends State<Infomation>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return InfomationWidget();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class InfomationWidget extends StatelessWidget {
  const InfomationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfomationController>(
      init: InfomationController(),
      initState: (_) {},
      builder: (_) {
        return ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _.name.value.isNotEmpty
                    ? Text(
                        _.name.value,
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : const Text(
                        '换一个站点试试吧~',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                  _.typeInfoList.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChoiceChip(
                        label: Text(_.info[index]),
                        selected: _.selectIndex.value == index,
                        onSelected: (v) {
                          _.onSelectedChanged(index);
                          _.getInfo(info: _.typeInfoList[_.selectIndex.value]);
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _.last_update.value,
                textAlign: TextAlign.end,
              ),
            ),
            _.infoList.isNotEmpty
                ? Column(
                    children: List.generate(
                      // ignore: invalid_use_of_protected_member
                      _.infoList.length,
                      (index) {
                        final title = _.infoList.value[index]['title'];
                        final link = _.infoList.value[index]['link'];
                        return InkWell(
                          onTap: () {
                            Get.to(WebViewPage(url: link, title: title));
                          },
                          child: ListTile(
                            title: Text(title),
                            subtitle: Text(
                              link,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            trailing: Text(_.infoList.value[index]['other']),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text(
                        '暂无数据',
                        style: TextStyle(fontSize: 28.0),
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
