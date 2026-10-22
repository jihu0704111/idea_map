import 'package:flutter/material.dart';
import 'package:idea_map/post.dart';

class login extends StatefulWidget {
  const new({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(toolbarHeight: screenHeight *0.4,
        title:
        Center(
          child: 
          Column(
            children: [
              SizedBox(
             
                height: 50,
              ),
              Text("IdeaMap",
              style: TextStyle(
                fontSize: 48,color: const Color.fromARGB(255, 33, 169, 231)
                ),
                ),
                SizedBox(height: 50,),
                Container(
                  color: const Color.fromARGB(255, 55, 133, 153),
                  width: screenwidth*0.6,
                  height: 1,
                  
                )
            ],
          ),
        ),
        
        
      ),
      body: Center(
        child: Container(
          width: screenwidth*0.7,
          height: screenHeight*1,
          //color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "아이디", 
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                obscureText: isPassword,
                decoration: InputDecoration(
                  
                  prefixIcon: Icon(Icons.lock),
                  labelText: "비밀번호", 
                  border: OutlineInputBorder(),
                  suffixIcon:  IconButton(
                    icon: Icon(
                      isPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    ),
                    onPressed: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  )
                ),
              ),
              SizedBox(height: 40,),
              SizedBox(
                
                width: 500,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 62, 115, 158)
                  ),
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => post()),
                        );
                  },
                  child: Text("로그인",style: TextStyle(fontSize: 26,color: const Color.fromARGB(255, 255, 255, 255)),),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: (){},
                     child: Text("회원가입",style: TextStyle(color: Colors.blue),)),
                     TextButton(
                    onPressed: (){},
                     child: Text("아이디/비밀번호 찾기",style: TextStyle(color: Colors.blue),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}