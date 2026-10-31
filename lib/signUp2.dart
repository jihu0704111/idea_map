import 'package:flutter/material.dart';

class Signup2 extends StatefulWidget {
  const new({super.key});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    Widget unselectedBox = Container(
                          decoration: BoxDecoration(
                          color: Color(0xFFE0F3EA),
                          borderRadius: BorderRadius.circular(15)
                          ),
                          width: 160,
                          height: 60,
                          child: Center(
                            child: Text('남성',style: TextStyle(
                              fontSize:16 
                            ),),
                          )
                        );
    Widget selectedBox = Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFE0F3EA),
                            border: Border.all(  // 외곽선
                              color:Color(0xFF2Fb475),
                              width: 2  //외곽선 두깨
                            ),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          width: 160,
                          height: 60,
                          
                          child: Center(
                            child: Text('남성',style: TextStyle(
                              fontSize:16 
                            ),),
                          )
                        );
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 기존의 뒤로가기 버튼 삭제

        leading: // 왼쪽에 아이콘 배치
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          '회원 가입',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2Fb475),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenwidth * 0.85,
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  '사용자 정보를 입력해주세요!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffBEBEBE),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Text('닉네임', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "특수문자 X",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xffB6E5CE),
                      ),
                      filled: true, // 배경 색을 지정하겠다
                      fillColor: Color(0xffEFF9F4),
                      contentPadding: EdgeInsets.only(
                        left: 20, // 안쪽의 힌트 텍스트 위치조절
                        top: 15, // 위
                        bottom: 15, // 아래 박스 크기 조절
                      ), // 텍스트필드 조절
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), //모서리 둥글게
                        borderSide: BorderSide.none, // 외곽선 삭제
                      ),

                      hoverColor: Colors.transparent, // 커서 갖다대면 뜨는 이펙트 삭제
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Text('성별', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  child: Row( // 성별 선택 카드 가로배치
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                            setState(() {
                              isSelected = true;
                            });
                          
                          
                        },
                        child: isSelected ? selectedBox : unselectedBox,
                      ),
                      
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          decoration: BoxDecoration(
                          color: Color(0xFFE0F3EA),
                          borderRadius: BorderRadius.circular(15)
                          ),
                          width: 160,
                          height: 60,
                          child: Center(
                            child: Text('여성',style: TextStyle(
                              fontSize:16 
                            ),),
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
        child: SizedBox(
          // 로그인 버튼
          
          height: 60,

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2FB475),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            onPressed: () {
              /*Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Signup2()),
              );*/
            },
            child: Text(
              "다음",
              style: TextStyle(
                fontSize: 24,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

