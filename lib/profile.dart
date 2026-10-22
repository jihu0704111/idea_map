import 'package:flutter/material.dart';

class prifile extends StatefulWidget {
  const new({super.key});

  @override
  State<prifile> createState() => _prifileState();
}

class _prifileState extends State<prifile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("이것은 프로필 화면")));
  }
}
