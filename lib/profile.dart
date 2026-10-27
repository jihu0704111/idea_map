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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Icon(Icons.account_circle, size: 100, color: Color(0xFF2FB475)),

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
      ),
    );
  }
}
