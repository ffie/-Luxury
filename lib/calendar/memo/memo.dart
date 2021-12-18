// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/app_bar.dart';

class MemoPage extends StatefulWidget {
  String data;
  MemoPage({Key? key, required this.data}) : super(key: key);

  @override
  State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '메모',
      ),
      body: Center(
        child: Text(widget.data.toString() + "일"),
      ),
    );
  }
}
