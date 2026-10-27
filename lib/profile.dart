import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_map/chage_personal_account.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Profile()));
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Color(0xFF2FB475),
                      ),

                      SizedBox(width: 50),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  "닉네임",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(CupertinoIcons.pencil, size: 25),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 25),

              Container(
                color: Colors.grey,
                width: screenWidth * 0.95,
                height: 2,
              ),

              SizedBox(height: 40),

              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "내 활동",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.89,
                        height: screenheight * 0.26,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "내가 쓴 글",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(Icons.chevron_right),
                                ],
                              ),
                            ),

                            SizedBox(height: 9),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Container(
                                color: Colors.grey,
                                width: screenWidth * 0.8,
                                height: 2,
                              ),
                            ),

                            SizedBox(height: 9),

                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "좋아요 누른 글",
                                    style: TextStyle(fontSize: 20),
                                  ),

                                  Icon(Icons.chevron_right),
                                ],
                              ),
                            ),

                            SizedBox(height: 9),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Container(
                                color: Colors.grey,
                                width: screenWidth * 0.8,
                                height: 2,
                              ),
                            ),

                            SizedBox(height: 9),

                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text("댓글 관리", style: TextStyle(fontSize: 20)),
                                  Icon(Icons.chevron_right),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "환결 설정",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.89,
                        height: screenheight * 0.18,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "내 정보 관리",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(Icons.chevron_right),
                                ],
                              ),
                            ),

                            SizedBox(height: 9),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Container(
                                color: Colors.grey,
                                width: screenWidth * 0.8,
                                height: 2,
                              ),
                            ),

                            SizedBox(height: 9),

                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text("계정 탈퇴", style: TextStyle(fontSize: 20)),

                                  Icon(Icons.chevron_right),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
