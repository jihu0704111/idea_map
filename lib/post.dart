import 'package:flutter/material.dart';
import 'package:idea_map/profile.dart';
import 'package:idea_map/searchscreen.dart';
import 'package:idea_map/write.dart';
import 'package:idea_map/board.dart';

class post extends StatefulWidget {
  const post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  String FormatDateTime(DateTime date) {
    String year = (date.year % 100).toString();
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String hour = date.hour.toString().padLeft(2, '0');
    String minute = date.minute.toString().padLeft(2, '0');

    return "$year/$month/$day $hour:$minute";
  }

  // 게시글 데이터 저장
  List<Map<String, String>> datas = [];

  // 게시글 삭제
  void deletePost(int index) {
    setState(() {
      datas.removeAt(index);
    });
  }

  // 글쓰기 화면 이동
  void goWrite() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return write(
            onUpload: (title, content) {
              setState(() {
                // 새 게시글을 맨 위에 추가
                datas.insert(0, {
                  "title": title,
                  "content": content,
                  "createdAt": FormatDateTime(DateTime.now()),
                });
              });
            },
          );
        },
      ),
    );
  }

  // 게시글 상세 화면 이동
  void goDetail(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return board(
            title: datas[index]["title"]!,
            content: datas[index]["content"]!,
            createdAt: datas[index]["createdAt"]!,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),

      // 메인 화면
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
              itemCount: datas.length,

              itemBuilder: (context, index) {
                return InkWell(
                  // 게시글을 누르면 상세 화면으로 이동
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return board(
                            title: datas[index]["title"]!,
                            content: datas[index]["content"]!,
                            createdAt: datas[index]["createdAt"]!,
                          );
                        },
                      ),
                    );
                  },

                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 제목 및 내용
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

                        // 공유 및 더보기
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
                  ),
                );
              },
            ),
          ),

          // 글쓰기 버튼
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
