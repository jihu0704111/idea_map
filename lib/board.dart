import 'package:flutter/material.dart';

class board extends StatefulWidget {
  final String title;
  final String content;
  final String createdAt;

  const board({
    super.key,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  bool isMuted = false;
  bool isLiked = false;
  final TextEditingController commentController = TextEditingController();

  List<String> comments = [];

  void toggleNotification() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void addComment() {
    String comment = commentController.text.trim();

    if (comment.isEmpty) {
      return;
    }

    setState(() {
      comments.insert(0, comment);
    });

    commentController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: toggleNotification,
            icon: Icon(
              isMuted
                  ? Icons.notifications_off_outlined
                  : Icons.notifications_none_outlined,
              color: isMuted ? Colors.grey.shade300 : Colors.black87,
              size: 21,
            ),
          ),
          IconButton(
            onPressed: () {},

            icon: const Icon(Icons.ios_share, color: Colors.black87, size: 20),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            itemBuilder: (context) => [
              const PopupMenuItem(value: "report", child: Text("신고하기")),
            ],
            onSelected: (value) {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 작성자 프로필
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0xFF32B875),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 21,
                          ),
                        ),

                        const SizedBox(width: 9),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "닉네임",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              widget.createdAt,
                              style: const TextStyle(
                                fontSize: 9,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.content,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: OutlinedButton.icon(
                      onPressed: toggleLike,

                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: const Color(0xFF32B875),
                      ),

                      label: Text(
                        isLiked ? "공감 취소" : "공감하기",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF32B875),
                        ),
                      ),

                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        side: const BorderSide(color: Color(0xFF32B875)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Divider(thickness: 1, color: Color(0xFFDDDDDD)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(
                      "댓글 ${comments.length}",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (comments.isEmpty)
                    SizedBox(
                      width: double.infinity,
                      height: 230,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.chat_bubble_outline,
                            size: 65,
                            color: Colors.black,
                          ),

                          const SizedBox(height: 15),

                          Text(
                            "첫 댓글을 작성해보세요!",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ...List.generate(comments.length, (index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFEEEEEE)),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 13,
                            backgroundColor: Color(0xFF32B875),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "닉네임 ${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  comments[index],
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),

                          const Icon(
                            Icons.favorite_border,
                            size: 15,
                            color: Colors.grey,
                          ),

                          const SizedBox(width: 5),

                          const Text(
                            "0",
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),

                          const SizedBox(width: 8),

                          const Icon(
                            Icons.more_vert,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: commentController,

                  decoration: InputDecoration(
                    hintText: "댓글을 입력해주세요.",
                    hintStyle: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFE5E5E5),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),

                  onSubmitted: (_) {
                    addComment();
                  },
                ),
              ),

              IconButton(
                onPressed: addComment,
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.comment, color: Colors.grey, size: 19),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
