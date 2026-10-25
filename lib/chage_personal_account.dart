import 'package:flutter/material.dart';

class CheckCircleButton extends StatefulWidget {
  const CheckCircleButton({super.key});

  @override
  State<CheckCircleButton> createState() => CheckCircleButtonState();
}

class CheckCircleButtonState extends State<CheckCircleButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 2),
          color: isChecked ? Colors.blue : Colors.white,
        ),
        child: isChecked
            ? Icon(Icons.check, size: 16, color: Colors.white)
            : null,
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenheight * 0.12,
        title: Container(
          child: Center(
            child: Column(
              children: [
                Text(
                  "회원 탈퇴",
                  style: TextStyle(
                    fontSize: 26,
                    color: const Color.fromARGB(255, 33, 169, 231),
                  ),
                ),
                Container(
                  child: Divider(color: Colors.blue),
                  width: screenWidth * 0.7,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "주의사항",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              "경고: 회원 탈퇴시 계정 정보, 작성한 글, 댓글, 관심 글 등 횐원 계정에 관한 정보들이 전부 영구적으로 삭제 되며, 복구가 불가능 합니다.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20),

            Text(
              "지금까지 어플 이용에 불편했던 사항들을 체크해주시고 개인적으로도 불편했던 사항들을 적어주시면 더 나은 ideamap이 되기 위해 노력하겠습니다.",
              style: TextStyle(fontSize: 15),
            ),

            SizedBox(height: 20),

            Container(
              width: screenWidth * 0.9,
              height: screenheight * 0.5,
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "탈퇴 사유",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      CheckCircleButton(),

                      SizedBox(width: 5),

                      Expanded(
                        child: Text("이용 빈도가 낮음(이 어플을 사용할 마땅한 컨텐츠나 기능들이 없음)"),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      CheckCircleButton(),

                      SizedBox(width: 5),

                      Expanded(
                        child: Text(
                          "컨텐츠 불만족(이벤트가 너무 부실하거나 부족함 또는 흥미있는 기능들이 부족함)",
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      CheckCircleButton(),

                      SizedBox(width: 5),

                      Expanded(child: Text("어플 완성도가 부족함(어플 렉, 완성도가 너무 부족함)")),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      CheckCircleButton(),

                      SizedBox(width: 5),

                      Expanded(child: Text("개인정보 침해 또는 해킹 우려")),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      CheckCircleButton(),

                      SizedBox(width: 5),

                      Expanded(
                        child: Text(
                          "다른 서비스 이용(ideamap 보다 더 나은 컨텐츠와 기능이 있는 어플을 사용중임)",
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      CheckCircleButton(),

                      SizedBox(width: 5),

                      Text("기타"),

                      SizedBox(width: 5),

                      Expanded(
                        child: SizedBox(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "불편했던 사항들을 적어주세요",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              "그래도 탈퇴 하시겠습니까?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 10),

            Container(
              width: screenWidth * 0.5,
              height: screenheight * 0.1,
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
                      Container(
                        child: Row(
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
                              child: Column(
                                children: [
                                  Text(
                                    "예",
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
                      ),
                    ],
                  ),
                  SizedBox(
                    child: VerticalDivider(color: Colors.blue),
                    height: screenheight * 0.7,
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "아니오",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
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
