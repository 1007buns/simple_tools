import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'controller.dart';

class CloudVillagePage extends StatelessWidget {
  const CloudVillagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网易云村'),
      ),
      body: GetBuilder<CloudVillageController>(
        init: CloudVillageController(),
        initState: (_) {},
        builder: (_) {
          return _.isInitialized.value
              ? Center(
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _.videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_.videoPlayerController),
                      ),
                      Positioned(
                        top: 0,
                        child: SizedBox(
                          height: 60,
                          width: 500,
                          child: ListTile(
                            textColor: Colors.white,
                            leading: Image.network(_.avatarurl.value),
                            title: Text(
                              _.title.value,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            subtitle: Text(_.nickname.value),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: GetBuilder<CloudVillageController>(
        init: CloudVillageController(),
        initState: (_) {},
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              _.getCloudVillage();
            },
            child: const Icon(Icons.restart_alt_outlined),
          );
        },
      ),
    );
  }
}
