import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const new({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,  // 기존의 뒤로가기 버튼 삭제

        leading:   // 왼쪽에 아이콘 배치
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          }
        , icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          '회원 가입',style: 
          TextStyle(
            fontSize: 32,
            fontWeight:FontWeight.bold,
            color: Color(0xFF2Fb475)),),
            centerTitle: true,  //타이틀은 화면의 가운데정렬
      ),
    );
  }
}