import 'package:flutter/material.dart';
import 'package:idea_map/emailLogin.dart';
import 'dart:async';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
       MaterialPageRoute(
        builder: (context) => emailLogin(),
       ),);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('LinkLocal',style: TextStyle(fontSize: 36,color: Color(0xFF2FB475),fontWeight: FontWeight.w800,)),
      ),
    );
  }
}