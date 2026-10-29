import 'package:flutter/material.dart';
import 'package:idea_map/loginstart.dart';
import 'package:idea_map/post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.4,
        title: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "IdeaMap",
                style: TextStyle(
                  fontSize: 48,
                  color: const Color.fromARGB(255, 33, 169, 231),
                ),
              ),
              SizedBox(height: 50),
              Container(
                color: const Color.fromARGB(255, 55, 133, 153),
                width: screenwidth * 0.6,
                height: 1,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 50,
              color: const Color(0xFFFEE500),
              child: Center(child: Text("카카오로 시작하기")),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),

                border: Border.all(color: Colors.black, width: 0.5),
              ),
              width: 300,
              height: 50,
              child: Center(child: Text("Google로 시작하기")),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 50,
              color: Color(0xFF000000),
              child: Center(
                child: Text(
                  "Apple로 시작하기",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),

            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => loginstart()),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                color: const Color.fromARGB(255, 33, 169, 231),
                child: Center(child: Text("Email로 시작하기")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
