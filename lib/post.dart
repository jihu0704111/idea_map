import 'package:flutter/material.dart';
import 'package:idea_map/profile.dart';

class post extends StatefulWidget {
  const new({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(toolbarHeight: screenwidth*0.25,
        title: Center(
          
          child: Column(
      
            children: [
              SizedBox(height: 30,),
              SizedBox(
                width: screenwidth*0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Text("게시판",style: TextStyle(fontSize: 26,color: const Color.fromARGB(255, 33, 169, 231)),),
                   IconButton(onPressed: (){
                      Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => profile()),
                        );
                   }, 
                   icon: Icon(Icons.account_circle,size: 30,color: const Color.fromARGB(255, 33, 169, 231))),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              
              SizedBox(height: 20,),
              Container(
                  color: const Color.fromARGB(255, 55, 133, 153),
                  width: screenwidth*0.8,
                  height: 1,
                  
                )
            ],
          )),
        ),
        
    );
  }
}
