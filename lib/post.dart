import 'package:flutter/material.dart';
import 'package:idea_map/profile.dart';
import 'package:idea_map/write.dart';

class post extends StatefulWidget {
  const post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  List<Map<String, String>> datas = [];

  void goWrite() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return write(
            onUpload: (title, content) {
              setState(() {
                datas.insert(0, {"title": title, "content": content});
              });
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenwidth * 0.25,
        title: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              SizedBox(
                width: screenwidth * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "게시판",
                      style: TextStyle(
                        fontSize: 26,
                        color: const Color.fromARGB(255, 33, 169, 231),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      icon: Icon(
                        Icons.account_circle,
                        size: 30,
                        color: const Color.fromARGB(255, 33, 169, 231),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),
              Container(
                color: const Color.fromARGB(255, 55, 133, 153),
                width: screenwidth * 0.8,
                height: 1,
              ),
            ],
          ),
        ),
      ),

      // 매인 화면
      body: Column(
        children: [
          // 게시판 목록
          Expanded(
            child: ListView.builder(
              //게시글 개수 자동 계산 <-챗지피티 지리노ㅋㅋ
              itemCount: datas.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      // 사진
                      Container(
                        width: 80,
                        height: 80,

                        color: Colors.grey,

                        child: const Icon(Icons.image),
                      ),
                      // 제목
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(datas[index]["title"]!),
                            Text(datas[index]["content"]!),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          //글쓰기 버튼
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 30),
            child: Align(
              alignment: Alignment.centerRight,

              child: ElevatedButton(
                onPressed: goWrite,
                child: const Text("글쓰기"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
