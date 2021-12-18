import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final bool? fullscreenDialog;
  final Function? onTap;
  final List<Widget>? actions;
  final bool? isLeading;
  final Color? titleColor;

  const CustomAppBar({
    Key? key,
    @required this.title,
    this.backgroundColor,
    this.fullscreenDialog = false,
    this.onTap,
    this.actions,
    this.isLeading = true,
    this.titleColor,
  }) : super(key: key);

  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: isLeading,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: isLeading!
          ? CustomCupertinoButton(
              margin: EdgeInsets.only(left: 10),
              onTap: () => Navigator.of(context).pop(),
              child: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
            )
          : null,
      title: Text(
        '$title',
        style: TextStyle(
          color: titleColor ?? Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(
          color: Color(0xffEBEBEB),
          height: 1,
        ),
      ),
      actions: actions ?? [],
    );
  }
}
