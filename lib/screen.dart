import 'package:flutter/material.dart';
import 'package:idea_map/post.dart';
import 'package:idea_map/profile.dart';

class Screen extends StatefulWidget {
  const new({super.key});

  @override
  
  State<Screen> createState() => _ScreenState();
  
}


class _ScreenState extends State<Screen> {

  
  @override
  int selectedIndex = 0;
  bool menuOpen = false;



  final List<Widget> pages = [
  post(),
  Profile()
];

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        title:
        
         
        Text('LinkLocal',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
           color: Color(0xFF2FB475)),),
        actions: [
          IconButton(
            onPressed: (){},
             icon: Icon(Icons.search_outlined,size: 35,)),
          IconButton(
            onPressed: (){},
             icon: Icon(Icons.notifications_none,size: 35,))
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black
            )
          )
        ),
        height: 70,
        child: BottomNavigationBar(
          showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,

        onTap: (index){
          setState(() {
            selectedIndex = index;
            menuOpen = false;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: ''
          )
        ]
        ),
        ),
    );
  }
}