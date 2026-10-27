import 'package:flutter/material.dart';

class write extends StatefulWidget {
  final Function(String, String) onUpload;
  const write({super.key, required this.onUpload});

  @override
  State<write> createState() => _writeState();
}

class _writeState extends State<write> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  void uploadPost() {
    String title = titleController.text.trim();

    String content = contentController.text.trim();

    widget.onUpload(title, content);
    titleController.clear();
    contentController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("게시판에 등록되었습니다.")));
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  PreferredSizeWidget buildingAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: Colors.black),
          ),
          const Expanded(
            child: Center(
              child: Text(
                '글쓰기',
                style: TextStyle(
                  color: Color(0xFF32B875),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: uploadPost,
            child: const Text(
              '등록',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: Colors.black),
          ),
          const Expanded(
            child: Center(
              child: Text(
                '글쓰기',
                style: TextStyle(
                  color: Color(0xFF32B875),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: uploadPost,
            child: const Text('등록', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: '제목을 입력해주세요',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF32B875)),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: TextField(
                  controller: contentController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    hintText: '내용을 입력해주세요. (#카페 #음식점)',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            Container(
              height: 54,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 1)),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 22,
                      color: Colors.black87,
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.videocam_outlined,
                      size: 22,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
