import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/pages/utils_pages/changba/controller.dart';

class ChangBaPage extends StatelessWidget {
  const ChangBaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('唱吧随机用户歌曲'),
      ),
      body: GetBuilder<ChangBaController>(
        init: ChangBaController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 500,
                    // margin: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_.userImage.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '原唱: ${_.nickName.value}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 24.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _.getChangBa();
                      _.nextPlay();
                    },
                    child: const Text('获取唱吧随机用户歌曲'),
                  )
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: GetBuilder<ChangBaController>(
        init: ChangBaController(),
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
