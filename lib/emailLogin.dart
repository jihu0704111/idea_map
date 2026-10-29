import 'package:flutter/material.dart';
import 'package:idea_map/main.dart';
import 'package:idea_map/post.dart';
import 'package:idea_map/screen.dart';

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
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.4,
        title: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "LinkLocal",
                style: TextStyle(fontSize: 48, color: Color(0xFF2FB475)),
              ),
              SizedBox(height: 50),
              Container(
                color: Color(0xFF2FB475),
                width: screenwidth * 0.6,
                height: 1,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: screenwidth * 0.7,
          height: screenHeight * 1,
          //color: Colors.amber,
          child: Column(
            children: [
              SizedBox(height: 5),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "아이디",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _passwordController,
                obscureText: isPassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "비밀번호",
                  border: OutlineInputBorder(),
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
              SizedBox(height: 40),
              SizedBox(
                width: 500,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2FB475),
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
                      fontSize: 26,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (sheetcontext) {
                          return StatefulBuilder(
                            builder: (context, setModalState) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .bottom,
                                ),
                                child: Container(
                                  width: screenwidth * 0.8,
                                  height: screenHeight * 0.9,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(sheetcontext);
                                          },
                                          icon: Icon(Icons.close),
                                        ),
                                      ),
                                      SizedBox(height: 70),
                                      Text(
                                        "회원가입",
                                        style: TextStyle(fontSize: 26),
                                      ),
                                      SizedBox(height: 70),

                                      SizedBox(
                                        width: screenwidth * 0.65,
                                        child: TextField(
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.person),
                                            labelText: "Email",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 70),

                                      SizedBox(
                                        width: screenwidth * 0.65,
                                        child: TextField(
                                          controller: _passwordController,
                                          obscureText: isPassword,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock),
                                            labelText: "비밀번호",
                                            border: OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                isPassword
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                              ),
                                              onPressed: () {
                                                setModalState(() {
                                                  isPassword = !isPassword;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 70),
                                      SizedBox(
                                        width: 260,
                                        height: 60,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  62,
                                                  115,
                                                  158,
                                                ),
                                          ),
                                          onPressed: () async {
                                            try {
                                              final email = _emailController
                                                  .text
                                                  .trim();
                                              final password =
                                                  _passwordController.text
                                                      .trim();

                                              final response = await supabase
                                                  .auth
                                                  .signUp(
                                                    email: email,
                                                    password: password,
                                                  );
                                              if (response.user != null) {
                                                print("회원가입 성공");

                                                if (!mounted) return;
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          '회원가입이 완료되었습니다.',
                                                        ),
                                                      ),
                                                    );
                                              }
                                            } catch (e) {
                                              print("회원가입 실패 (기타): $e");
                                            }
                                          },
                                          child: Text(
                                            "회원가입",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text("회원가입", style: TextStyle(color: Colors.blue)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "아이디/비밀번호 찾기",
                      style: TextStyle(color: Colors.blue),
                    ),
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
