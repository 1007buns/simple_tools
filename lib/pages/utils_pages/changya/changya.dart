import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ChangYaPage extends StatelessWidget {
  const ChangYaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('唱鸭随机用户歌曲'),
      ),
      body: GetBuilder<ChangYaController>(
        init: ChangYaController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(150),
                      image: DecorationImage(
                        image: NetworkImage(_.userImage.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    '昵称: ${_.nickName.value}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _.getChangYa();
                      _.nextPlay();
                    },
                    child: const Text('获取唱鸭随机用户歌曲'),
                  )
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: GetBuilder<ChangYaController>(
        init: ChangYaController(),
        initState: (_) {},
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              _.changePlay();

              print(_.isPlay.value);
            },
            child: _.isPlay.value
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow),
          );
        },
      ),
    );
  }
}
