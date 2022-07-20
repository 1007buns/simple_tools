import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/widgets/utils_list_title.dart';

class YiApiUtils extends StatefulWidget {
  const YiApiUtils({Key? key}) : super(key: key);

  @override
  State<YiApiUtils> createState() => _YiApiUtilsState();
}

class _YiApiUtilsState extends State<YiApiUtils>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return YiApiUtilsWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class YiApiUtilsWidget extends StatelessWidget {
  const YiApiUtilsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '恶搞qq头像表情包',
          subtitle: '#pa',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/pa');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '看图猜成语',
          subtitle: '#guess',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/guess_image');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '小爱同学聊天',
          subtitle: '#xiaoaichat',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/xiaoai_chat');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '王者小妲己聊天',
          subtitle: '#xiaodaji_chat',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/xiaodaji_chat');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '唱鸭随机用户歌曲',
          subtitle: '#changya',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/changya');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '唱吧随机用户歌曲',
          subtitle: '#changba',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/changba');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '扒站',
          subtitle: '#pazhan',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/pazhan');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '各种图片',
          subtitle: '#gztp',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/gztp');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '淘宝买家秀',
          subtitle: '#miajia_xiu',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/maijia_xiu');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: 'ping域名',
          subtitle: '#ping',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/ping');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '蓝奏云解析',
          subtitle: '#lzy',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/lzy');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '舔狗日记',
          subtitle: '#tgrj',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/tgrj');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '天气查询',
          subtitle: '#weather',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/weather');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '高清图片',
          subtitle: '#hd_picture',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/hd_picture');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '星座运势',
          subtitle: '#xingzuo',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/xingzuo');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '搜索小说',
          subtitle: '#xiaoshuo',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/xiaoshuo');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '随机一言',
          subtitle: '#yiyan',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/yiyan');
          },
        ),
        UtilsListTitleWidget(
          leading: const Icon(Icons.child_care),
          title: '网易云村',
          subtitle: '#cloud_village',
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Get.toNamed('/cloud_village');
          },
        ),
      ],
    );
  }
}
