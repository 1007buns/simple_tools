import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexSwiper extends StatelessWidget {
  IndexSwiper({
    Key? key,
  }) : super(key: key);

  final _tabImage = [
    'http://bmfw.www.gov.cn/yqfxdjcx/source/PC/images/banner.png',
    'https://files.flutter-io.cn/cms/static/d07045a740a55d36323e.jpg',
    'https://files.flutter-io.cn/cms/static/d07045a740a55d36323e.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper.children(
      children: [
        Stack(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(15),
            //   child: Image.network(
            //     _tabImage[0],
            //     fit: BoxFit.cover,
            //   ),
            // ),
            InkWell(
              onTap: () {
                Get.toNamed('/check_areas_at_risk');
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      _tabImage[0],
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 8.0,
              bottom: 8,
              child: Text(
                '疫情风险地区查询',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            _tabImage[1],
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            _tabImage[2],
            fit: BoxFit.cover,
          ),
        ),
      ],
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }
}
