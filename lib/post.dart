import 'package:flutter/material.dart';
import 'package:idea_map/profile.dart';
import 'package:idea_map/searchscreen.dart';
import 'package:idea_map/write.dart';

class post extends StatefulWidget {
  const post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  List<Map<String, String>> datas = [];
  void deletePost(int index) {
    setState(() {
      datas.removeAt(index);
    });
  }

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),

      // 매인 화면
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "게시판",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),

                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "최신 순",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              color: Colors.grey,
              width: screenWidth * 0.95,
              height: 2,
            ),
          ),

          // 게시판 목록
          Expanded(
            child: ListView.builder(
              //게시글 개수 자동 계산 <-챗지피티 지리노ㅋㅋ
              itemCount: datas.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 제목
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                datas[index]["title"]!,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Text(
                                datas[index]["content"]!,
                                style: TextStyle(fontSize: 16),
                              ),

                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_outline),
                                  ),

                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.comment_outlined),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 사진
                      Container(
                        width: 80,
                        height: 80,

                        decoration: BoxDecoration(
                          color: Colors.grey,

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: const Icon(Icons.image),
                      ),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.ios_share),
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                          ),
                        ],
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
