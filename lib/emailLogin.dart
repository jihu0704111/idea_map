import 'package:flutter/material.dart';
import 'package:idea_map/main.dart';
import 'package:idea_map/post.dart';
import 'package:idea_map/screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idea_map/signUp.dart';

class emailLogin extends StatefulWidget {
  const new({super.key});

  @override
  State<emailLogin> createState() => _emailLoginState();
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class _emailLoginState extends State<emailLogin> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,  // 키보드가 올라오면 body 높이를 줄임
      backgroundColor: Colors.white,
      
      body: 
        
        SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenwidth * 0.85,
              //color: Colors.amber,
              child: Column(
                children: [
                  SizedBox(height: 80,),
                Image.asset('assets/images/Logo.png', width: 300, height: 300),
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
                      controller: _emailController, // 사용자가 입력한 이메일 저장
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
          
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Text('비밀번호', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: isPassword,
                    decoration: InputDecoration(
                      hintText: "비밀번호를 입력해주세요",
                      hintStyle: TextStyle(fontSize: 15, color: Color(0xffB6E5CE)),
                      filled: true, // 배경 색을 지정하겠다
                      fillColor: Color(0xffEFF9F4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 15,
                        bottom: 15,
                      ),
                      hoverColor: Colors.transparent,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "아이디 찾기",
                          style: TextStyle(color: Color(0xFF2FB475)),
                        ),
                      ),
                      Text('|', style: TextStyle(color: Color(0xFFE0F4EB))),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "비밀번호 찾기",
                          style: TextStyle(color: Color(0xFF2FB475)),
                        ),
                      ),
                    ],
                  ),
                  //Spacer(), // 입력창의 영역과 버튼 영역 사이의 남는 공간을 차지
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18, // 현재 화면 높이의 24퍼 만큼 공간 만듦
                  ),
                
                    // 밑에 딱 붙어있지 않게 바텀에 간격 주기
                    Column(
                      children: [
                        SizedBox(
                          // 로그인 버튼
                          width: 300,
                          height: 60,
          
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF2FB475),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
          
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Screen()),
                              );
                            }, //async {
                            //   try {
                            //     final id = _emailController.text.trim();
                            //     final password = _passwordController.text.trim();
          
                            //     final response = await supabase.auth.signInWithPassword(
                            //       email: id,
                            //       password: password,
                            //     );
          
                            //     if (response.user != null) {
                            //       Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute(builder: (context) => post()),
                            //       );
                            //     }
                            //   } catch (e) {
                            //     print("로그인 실패: $e");
                            //   }
                            // },
                            child: Text(
                              "로그인",
                              style: TextStyle(
                                fontSize: 24,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>Signup()));
                          },
                          child: Text(
                            '회원가입',
                            style: TextStyle(color: Color(0xFF2FB475)),
                          ),
                        ),
                      ],
                    ),
                  
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}
