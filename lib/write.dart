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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("글쓰기")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text("제목"),

            const SizedBox(height: 10),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "제목을 작성 해 주세요",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            const Text("설명"),

            const SizedBox(height: 10),

            TextField(
              controller: contentController,
              maxLines: 5,

              decoration: InputDecoration(
                hintText: "설명 입력",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 60),

            Center(
              child: ElevatedButton(
                onPressed: uploadPost,

                child: const Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Icon(Icons.star),

                    SizedBox(width: 5),

                    Text("글 올리기"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
