import 'package:flutter/material.dart';
import 'package:idea_map/emailLogin.dart';
import 'package:idea_map/main.dart';
import 'package:idea_map/signUp2.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signup extends StatefulWidget {
  const new({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isPassword1 = true;
  bool isPassword2 = true;
  final idcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        centerTitle: true, //타이틀은 화면의 가운데정렬
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenwidth * 0.85,
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  '계정 정보를 입력해주세요!',
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
                      Text('아이디', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  child: TextField(
                    controller: idcontroller,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "아이디를 입력해주세요",
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
                      Text('비밀번호', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  child: TextField(
                    obscureText: isPassword1, // 패스워드 숨기기
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "영문, 숫자, 특수문자 조합 8~32자",
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassword1 ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isPassword1 = !isPassword1;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Text('비밀번호 확인', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  child: TextField(
                    controller: passwordcontroller,
                    obscureText: isPassword2,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "영문, 숫자, 특수문자 조합 8~32자",
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassword2 ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isPassword2 = !isPassword2;
                          });
                        },
                      ),
                    ),
                  ),
                ),
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

           onPressed: () async {
              final email = idcontroller.text.trim();
              final password = passwordcontroller.text.trim();
              try {
                final response = await supabase.auth.signUp(
                  email: email,
                  password:password,
                );
                if (response.user != null ) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => emailLogin()),
                  );
                }
              } 
              on AuthException catch(e){
                print("회원가입 실패: ${e.message}");
              }              
              catch (e) {
                print('회원가입 실패${e}');
              }
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
