import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/widgets/utils_list_title.dart';
import 'package:simple_tools/pages/utils_pages/get_out_icon/get_out_icon.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        elevation: 0.0,
      ),
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            buildSliverAppBar(),
            buildSliverPersistentHeader(),
          ];
        },
        body: buildTabBarView(),
      ),
    );
  }

  SliverPersistentHeader buildSliverPersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: TabBar(
          physics: BouncingScrollPhysics(),
          labelColor: Colors.black,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: '工具'),
            Tab(text: '资讯'),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 230.0,
      pinned: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: PageView(
          children: const [
            Center(
              child: Icon(Icons.flutter_dash),
            ),
            Center(
              child: Icon(Icons.flutter_dash_outlined),
            ),
            Center(
              child: Icon(Icons.flutter_dash_rounded),
            ),
          ],
        ),
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        ListView(
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
          ],
        ),
        Container(
          color: Colors.red,
        ),
      ],
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
