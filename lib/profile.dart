import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const new({super.key});

  @override
  State<profile> createState() => _prifileState();
}

class _prifileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("이것은 프로필 화면")));
  }
}
