import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsListTitleWidget extends StatelessWidget {
  Function() onTap;
  Widget leading;
  String title;
  String subtitle;
  Widget trailing;

  UtilsListTitleWidget(
      {Key? key,
      required this.onTap,
      required this.leading,
      required this.trailing,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: leading,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          onPressed: onTap,
          icon: trailing,
        ),
      ),
    );
  }
}
