import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('天气查询'),
      ),
      body: GetBuilder<WeatherController>(
        init: WeatherController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Text(_.local.value),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: TextField(
                  onChanged: ((v) {
                    _.getWeather();
                  }),
                  onSubmitted: (v) {
                    _.getWeather();
                    FocusScope.of(context).requestFocus(_.focusNode);

                    print("获取：$v相关天气");
                  },
                  textInputAction: TextInputAction.search,
                  controller: _.localController,
                  decoration: InputDecoration(
                    labelText: '请输入地区',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _.localController.text = '';
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: TextField(
                  focusNode: _.focusNode,
                  keyboardType: TextInputType.number,
                  controller: _.localSelectController,
                  onSubmitted: (v) {
                    _.getWeather2();
                  },
                  decoration: InputDecoration(
                    labelText: '请输入序号',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _.localSelectController.text = '';
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _.getWeather2();
                },
                child: const Text('获取天气'),
              ),
              Text(_.localSelect.value),
            ],
          );
        },
      ),
    );
  }
}
