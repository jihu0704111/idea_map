import 'package:flutter/material.dart';

class write extends StatefulWidget {
  const write({super.key});

  @override
  State<write> createState() => _writeState();
}

class _writeState extends State<write> {
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
              decoration: InputDecoration(
                hintText: "제목을 작성 해 주세요",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            const Text("설명"),

            const SizedBox(height: 10),

            TextField(
              maxLines: 5,

              decoration: InputDecoration(
                hintText: "설명 입력",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 60),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

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
