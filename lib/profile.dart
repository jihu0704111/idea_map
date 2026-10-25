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
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.25,
        title: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "프로필",
                  style: TextStyle(
                    fontSize: 26,
                    color: const Color.fromARGB(255, 33, 169, 231),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Divider(color: Colors.blue),
                  width: screenWidth * 0.7,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "user1",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Container(
              width: screenWidth * 0.7,
              height: screenheight * 0.2,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text(
                              "작성 글",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),

                            Text(
                              "7",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    child: VerticalDivider(color: Colors.blue),
                    height: screenheight * 0.7,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text(
                              "관심 글",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),

                            Text(
                              "52",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NextScreen(),
                        ),
                      );
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.logout),
                          Text("회원 탈퇴", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.crop_rotate),
                          Text("개인정보 변경", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
