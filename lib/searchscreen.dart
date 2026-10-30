import 'package:flutter/material.dart';

class Searchscreen extends StatefulWidget {
  const new({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  int selectedTab = 0;

  List<String> searchHistory = [];

  void addSearchKeyword(String keyword) {
    if (keyword.isNotEmpty) {
      setState(() {
        searchHistory.remove(keyword);

        searchHistory.insert(0, keyword);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "찾고 싶은 게시글 검색",
            hintStyle: TextStyle(color: Color(0xFFACACAC)),
            prefixIcon: Icon(Icons.search_outlined),
            filled: true,
            fillColor: Color(0xFFE3E3E3),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onSubmitted: (value) {
            addSearchKeyword(value);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Container(height: 20),
              Row(
                children: [
                  Text("최근 검색어"),

                  Spacer(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        searchHistory.clear();
                      });
                    },
                    child: Text(
                      "전체 삭제",
                      style: TextStyle(
                        fontSize: 15,
                        color: (Color(0xFFACACAC)),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              ListView.builder(
                shrinkWrap: true,
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchHistory[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.close, size: 15),
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),

                      onPressed: () {
                        setState(() {
                          if (index < searchHistory.length) {
                            searchHistory.removeAt(index);
                          }
                        });

                        setState(() {
                          if (index < searchHistory.length) {
                            searchHistory.remove(index);
                          }
                        });
                      },
                    ),
                  );
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  color: Colors.black,
                  width: screenWidth * 0.8,
                  height: 2,
                ),
              ),

              SizedBox(height: 25),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: selectedTab == 0
                                ? const Color(0xFF2FB475)
                                : Colors.white,
                            side: const BorderSide(
                              color: Color(0xFF2FB475),
                              width: 1,
                            ),
                          ),
                          child: Row(children: [Text("#요즘 많이 사용중인 키워드")]),
                        ),

                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },

                          style: TextButton.styleFrom(
                            backgroundColor: selectedTab == 1
                                ? const Color(0xFF2FB475)
                                : Colors.white,
                            side: const BorderSide(
                              color: Color(0xFF2FB475),
                              width: 1,
                            ),
                          ),
                          child: Row(children: [Text("#인기 검색어")]),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Container(
                      child: selectedTab == 0
                          ? const Center(
                              child: Text(
                                "한정선",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : const Center(
                              child: Text(
                                "고디바",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
