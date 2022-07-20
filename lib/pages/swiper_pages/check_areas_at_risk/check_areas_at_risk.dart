import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CheckAreasAtRiskPage extends StatefulWidget {
  const CheckAreasAtRiskPage({Key? key}) : super(key: key);

  @override
  State<CheckAreasAtRiskPage> createState() => _CheckAreasAtRiskPageState();
}

class _CheckAreasAtRiskPageState extends State<CheckAreasAtRiskPage>
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
        title: const Text('疫情风险地区查询'),
        bottom: TabBar(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          tabs: [
            GetBuilder<CheckAreasAtRiskController>(
              init: CheckAreasAtRiskController(),
              initState: (_) {},
              builder: (_) {
                return Tab(text: '高风险等级地区(${_.high_count.value})');
              },
            ),
            GetBuilder<CheckAreasAtRiskController>(
              init: CheckAreasAtRiskController(),
              initState: (_) {},
              builder: (_) {
                return Tab(text: '中风险等级地区(${_.middle_count.value})');
              },
            ),
          ],
        ),
      ),
      body: GetBuilder<CheckAreasAtRiskController>(
        init: CheckAreasAtRiskController(),
        initState: (_) {},
        builder: (_) {
          return TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                itemCount: _.high_list.length,
                itemBuilder: (c, index) {
                  var list = _.high_list[index]['communitys'];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          _.high_list[index]['area_name'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 24, 78, 123),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Column(
                        children: List.generate(
                          list.length,
                          (i) => ListTile(
                            title: Text('${list[i]}'),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ListView.builder(
                itemCount: _.middle_list.length,
                itemBuilder: (c, index) {
                  // print(_.middle_list.value[index]['communitys']);
                  var list = _.middle_list[index]['communitys'];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          _.middle_list[index]['area_name'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 24, 78, 123),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Column(
                        children: List.generate(
                          list.length,
                          (i) => ListTile(
                            title: Text('${list[i]}'),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
