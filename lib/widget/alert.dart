import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/inkwell.dart';
import 'package:flutter_application_1/widget/size.dart';

void customAlert(
  BuildContext context, {
  String title = '',
  @required String? content,
  Function? onTap,
  Function? whenComplete,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: <Widget>[
            title.isNotEmpty
                ? Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Text(
                      '$title',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(top: title.isNotEmpty ? 25 : 50),
              child: Text(
                '$content',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: title.isNotEmpty ? 25 : 40),
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: CustomInkWell(
                      onLongPress: () {},
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '취소',
                          style: TextStyle(
                            color: Color(0xffE02020),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Color(0xffEEEEEE),
                  ),
                  Flexible(
                    child: CustomInkWell(
                      onLongPress: () {},
                      onTap: () {
                        Navigator.of(context).pop();

                        if (onTap != null) {
                          onTap();
                        }
                      },
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '확인',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  ).whenComplete(
    () {
      if (whenComplete != null) {
        whenComplete();
      }
    },
  );
}

void customConfirmAlert(
  BuildContext context, {
  @required String? title,
  Function? onTap,
}) {
  showDialog(
    context: context,
    //barrierDismissible: onTap!,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Text(
                '$title',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            CustomInkWell(
              onLongPress: () {},
              onTap: () => Navigator.of(context).pop(),
              padding: EdgeInsets.only(top: 20, bottom: 20),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Center(
                child: Text(
                  '확인',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void customAlertOk(
  BuildContext context, {
  String title = '',
  @required String? content,
  Function? onTap,
  Function? whenComplete,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: <Widget>[
            title.isNotEmpty
                ? Container(
                    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Text(
                      '$title',
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(top: title.isNotEmpty ? 25 : 50),
              child: Text(
                '$content',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: title.isNotEmpty ? 25 : 40),
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            Container(
              height: 60,
              child: CustomInkWell(
                onLongPress: () {},
                onTap: () {
                  Navigator.of(context).pop();

                  if (onTap != null) {
                    onTap();
                  }
                },
                padding: EdgeInsets.only(top: 20, bottom: 20),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '확인',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  ).whenComplete(
    () {
      if (whenComplete != null) {
        whenComplete();
      }
    },
  );
}

void customContentAlert(
  BuildContext context, {
  @required String? title,
  String icon = '',
  Function? onTap,
  @required String? content,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text(
                '$title',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            icon.isNotEmpty
                ? Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Image.asset(icon),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text(
                '$content',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            CustomInkWell(
              onLongPress: () {},
              onTap: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.only(top: 20, bottom: 20),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Center(
                child: Text(
                  '확인',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void customSelectAlert(
  BuildContext context, {
  @required String? title,
  @required List<String>? contents,
  @required List<Function>? onTaps,
  String content = '',
}) {
  String customContent = content;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text(
                '$title',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: contents!
                    .asMap()
                    .map(
                      (index, content) {
                        return MapEntry(
                          index,
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();

                              if (onTaps![index] != null) {
                                onTaps[index]();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              width: customWidth(context),
                              decoration: BoxDecoration(
                                border: contents.length == index + 1
                                    ? null
                                    : Border(
                                        bottom: BorderSide(
                                          color: Color(0xffEBEBEB),
                                        ),
                                      ),
                              ),
                              child: Center(
                                child: Text(
                                  '$content',
                                  style: TextStyle(
                                    color: customContent == content
                                        ? Colors.black
                                        : Color(0xff666666),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                    .values
                    .toList(),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void customCupertinoAlert(
  BuildContext context, {
  @required String? title,
  @required String? content,
  @required Function? onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(
          '$title',
          style: TextStyle(),
        ),
        content: Text(
          '$content',
          style: TextStyle(),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              '취소',
              style: TextStyle(),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();

              onPressed!();
            },
            child: Text(
              '확인',
              style: TextStyle(),
            ),
          )
        ],
      );
    },
  );
}
