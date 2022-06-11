import 'package:get/get.dart';
import 'package:simple_tools/pages/index_page.dart';
import 'package:simple_tools/pages/utils_pages/changba/changba.dart';
import 'package:simple_tools/pages/utils_pages/changya/changya.dart';
import 'package:simple_tools/pages/utils_pages/get_out_icon/get_out_icon.dart';
import 'package:simple_tools/pages/utils_pages/guess_image/guess_image.dart';
import 'package:simple_tools/pages/utils_pages/gztp/gztp.dart';
import 'package:simple_tools/pages/utils_pages/lzy/lzy.dart';
import 'package:simple_tools/pages/utils_pages/maijiaxiu/maijiaxiu.dart';
import 'package:simple_tools/pages/utils_pages/pazhan/pazhan.dart';
import 'package:simple_tools/pages/utils_pages/ping/ping.dart';
import 'package:simple_tools/pages/utils_pages/tgrj/tgrj.dart';
import 'package:simple_tools/pages/utils_pages/weather/weather.dart';
import 'package:simple_tools/pages/utils_pages/xiaoai_chat/xiaoai_chat.dart';
import 'package:simple_tools/pages/utils_pages/xiaodaji_chat/xiaodaji_chat.dart';

import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const IndexPage(),
    ),
    GetPage(
      name: AppRoutes.PA,
      page: () => const GetOutIconPage(),
    ),
    GetPage(
      name: AppRoutes.GUESS_IMAGE,
      page: () => const GuessImagePage(),
    ),
    GetPage(
      name: AppRoutes.XIAOAI_CHAT,
      page: () => const XiaoAiChatPage(),
    ),
    GetPage(
      name: AppRoutes.XIAODAJI_CHAT,
      page: () => const XiaodajiChatPage(),
    ),
    GetPage(
      name: AppRoutes.CHANGYA,
      page: () => const ChangYaPage(),
    ),
    GetPage(
      name: AppRoutes.CHANGBA,
      page: () => const ChangBaPage(),
    ),
    GetPage(
      name: AppRoutes.PAZHAN,
      page: () => const PaZhanPage(),
    ),
    GetPage(
      name: AppRoutes.GZTP,
      page: () => const GztpPage(),
    ),
    GetPage(
      name: AppRoutes.MAIJIAXIU,
      page: () => const MaiJiaXiuPage(),
    ),
    GetPage(
      name: AppRoutes.PING,
      page: () => const PingPage(),
    ),
    GetPage(
      name: AppRoutes.LZY,
      page: () => const LzyPage(),
    ),
    GetPage(
      name: AppRoutes.TGRJ,
      page: () => const TgrjPage(),
    ),
    GetPage(
      name: AppRoutes.WEATHER,
      page: () => const WeatherPage(),
    ),
  ];
}
