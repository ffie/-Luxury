// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/calendar/Model/calender.dart';
import 'package:flutter_application_1/widget/app_bar.dart';
import 'package:flutter_application_1/widget/button.dart';
import 'package:flutter_application_1/widget/route.dart';
import 'package:flutter_application_1/widget/size.dart';
import '../memo/memo.dart';

import '../../widget/alert.dart';
import '../../widget/inkwell.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({key}) : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

int monthCount = DateTime.now().month;
int yearCount = DateTime.now().year;
int day = DateTime.now().day;

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isLeading: false,
        title: 'CALENDER TEST APP',
        titleColor: Colors.blueGrey,
      ),
      body: SizedBox(
        width: customWidth(context),
        height: customHeight(context),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 12.0,
                    ),
                    onPressed: () {
                      setState(() {
                        monthCount--;
                        if (monthCount == 0) {
                          monthCount = 12;
                          yearCount--;
                        }
                      });
                    },
                  ),
                  Text("$yearCount" "년" "$monthCount" "월"),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 12.0,
                    ),
                    onPressed: () {
                      setState(() {
                        monthCount++;
                        if (monthCount == 13) {
                          monthCount = 1;
                          yearCount++;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              child: Row(
                children: <String>["일", "월", "화", "수", "목", "금", "토"]
                    .map<Widget>((String title) => Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              title,
                              style: TextStyle(
                                color: title == '일' ? Colors.red : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 300,
              child: CalendarList(monthCount, yearCount),
            )
          ],
        ),
      ),
    );
  }
}

class CalendarList extends StatefulWidget {
  final monthCount;
  final yearCount;
  const CalendarList(this.monthCount, this.yearCount, {key}) : super(key: key);

  @override
  _CalendarListVIewState createState() => _CalendarListVIewState();
}

class _CalendarListVIewState extends State<CalendarList> {
  @override
  Widget build(BuildContext context) {
    double a = weekDay(yearCount, monthCount, 1);
    int nSpace = a.round();

    return Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, month) {
          return Container(
            child: Column(
              children: new List<int>.generate(6, (int i) => i)
                  .map<Widget>(
                    (int e) => Row(
                      children: new List<int>.generate(7, (int v) => v)
                          .map<Widget>(
                            (int t) => Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: ((spaceDay(e, t) - (nSpace) > 31) ||
                                        (spaceDay(e, t)) < (nSpace + 1) &&
                                            (nSpace != 7))
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: CustomInkWell(
                                          onLongPress: () {},
                                          onTap: () {
                                            customConfirmAlert(
                                              context,
                                              title: '비어있는 날짜입니다.',
                                              onTap: () {},
                                            );
                                          },
                                          child: Center(
                                            child: Text(
                                              '',
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: CustomInkWell(
                                            child: Text(nNowDay(e, t, nSpace)
                                                .toString()),
                                            onLongPress: () {},
                                            onTap: () {
                                              customRoute(
                                                context,
                                                MemoPage(
                                                    data: "$yearCount"
                                                            "년 "
                                                            "$monthCount"
                                                            "월 " +
                                                        nNowDay(e, t, nSpace)
                                                            .toString()),
                                              );
                                            }),
                                      ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
