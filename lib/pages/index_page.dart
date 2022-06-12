import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'information_pages/infomation.dart';
import 'utils_pages/yi_api_utils.dart';

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Tools'),
        elevation: 0.0,
      ),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
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

  final _tabImage = [
    'https://files.flutter-io.cn/cms/static/ed2e069ee37807f5975a.jpg',
    'https://files.flutter-io.cn/cms/static/d07045a740a55d36323e.jpg',
    'https://files.flutter-io.cn/cms/static/d07045a740a55d36323e.jpg',
  ];
  SliverPersistentHeader buildSliverPersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: TabBar(
          labelStyle:
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          physics: const BouncingScrollPhysics(),
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
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                _tabImage[index],
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: _tabImage.length,
          viewportFraction: 0.8,
          scale: 0.9,
        ),
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: const <Widget>[
        YiApiUtils(),
        Infomation(),
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
      child: child,
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
