import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_map/emailLogin.dart';
import 'package:idea_map/main.dart';

class Signup2 extends StatefulWidget {
  final String email, password; // signup에 있는 변수 가져오기
  const Signup2({
    super.key,
    required this.email,
    required this.password,
  }); // signup에 있는 변수 가져오기

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  bool manSelected = false;
  bool womanSelected = false;
  bool calender = false;
  String years = "생년월일을 알려주세요!";
  int selectedyear = 70;
  int selectedmonth = 6;
  int selectedday = 15;

  /*int get year => selectedyear + 1930;  // get : 변수 값을 다시 계산하는 식일때는 값이 바뀔때마다 현재값을 변경시켜주는 get을 사용
  int get month => selectedmonth + 1;
  int get day => selectedday + 1;*/

  @override
  Widget build(BuildContext context) {
    Widget manunselectedBox = Container(
      decoration: BoxDecoration(
        color: Color(0xFFE0F3EA),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 160,
      height: 60,
      child: Center(child: Text('남성', style: TextStyle(fontSize: 16))),
    );
    Widget manselectedBox = Container(
      decoration: BoxDecoration(
        color: Color(0xFFE0F3EA),
        border: Border.all(
          // 외곽선
          color: Color(0xFF2Fb475),
          width: 2, //외곽선 두깨
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 160,
      height: 60,

      child: Center(child: Text('남성', style: TextStyle(fontSize: 16))),
    );
    Widget womanselectedBox = Container(
      decoration: BoxDecoration(
        color: Color(0xFFE0F3EA),
        border: Border.all(
          // 외곽선
          color: Color(0xFF2Fb475),
          width: 2, //외곽선 두깨
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 160,
      height: 60,

      child: Center(child: Text('여성', style: TextStyle(fontSize: 16))),
    );
    Widget womanunselectedBox = Container(
      decoration: BoxDecoration(
        color: Color(0xFFE0F3EA),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 160,
      height: 60,
      child: Center(child: Text('여성', style: TextStyle(fontSize: 16))),
    );
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 기존의 뒤로가기 버튼 삭제

        leading: // 왼쪽에 아이콘 배치
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          '회원 가입',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2Fb475),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenwidth * 0.85,
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  '사용자 정보를 입력해주세요!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffBEBEBE),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Text('닉네임', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "특수문자 X",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xffB6E5CE),
                      ),
                      filled: true, // 배경 색을 지정하겠다
                      fillColor: Color(0xffEFF9F4),
                      contentPadding: EdgeInsets.only(
                        left: 20, // 안쪽의 힌트 텍스트 위치조절
                        top: 15, // 위
                        bottom: 15, // 아래 박스 크기 조절
                      ), // 텍스트필드 조절
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), //모서리 둥글게
                        borderSide: BorderSide.none, // 외곽선 삭제
                      ),

                      hoverColor: Colors.transparent, // 커서 갖다대면 뜨는 이펙트 삭제
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Text('성별', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Row(
                    // 성별 선택 카드 가로배치
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            manSelected = !manSelected; // 누르면 true -> false, false -> true 로 바뀜
                            womanSelected = false; // 남자를 누르면 여자가 꺼짐
                          });
                        },
                        child: manSelected ? manselectedBox : manunselectedBox, // 삼항 연산자(isSelected 가 true 면 ? 실행, false 면 : 실행)
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            womanSelected = !womanSelected;
                            manSelected = false; //여자를 누르면 남자가 꺼짐
                          });
                        },
                        child: womanSelected
                            ? womanselectedBox
                            : womanunselectedBox,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Text('생년월일', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 5),

                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      // 생년월일 선택 시트
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            StatefulBuilder(
                              // 바텀 시트 내부에서 setState 사용하려면 적용
                              builder: (context, setModalState) {
                                return Container(
                                  height: 400,
                                  width: 450,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        // 출생년도
                                        child: SizedBox(
                                          height: 150,
                                          child: CupertinoPicker(
                                            //드래그로 숫자 선택
                                            itemExtent: 50, // 항목당 차지하는 높이
                                            scrollController:
                                                FixedExtentScrollController(
                                                  initialItem: selectedyear, // 전에 선택해놓으면 선택한곳부터 시작
                                                ),
                                            onSelectedItemChanged: (index) {
                                              setModalState(() {
                                                // setState 사용하면 버그남 - 모델 바텀시트 안에서 화면을 바꿀때는 이걸 사용
                                                selectedyear =
                                                    index; // 선택될 때마다 인덱스 변경
                                              });
                                            },
                                            children: List.generate(
                                              90, // 인덱스 갯수
                                              (index) => Center(
                                                child: Text(
                                                  '${index + 1930}',
                                                  style: TextStyle(
                                                    color: selectedyear == index
                                                        ? Color(0xFF2FB475)
                                                        : Color.fromARGB(
                                                            255,
                                                            0,
                                                            0,
                                                            0,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        // 출생 월
                                        child: SizedBox(
                                          height: 150,
                                          child: CupertinoPicker(
                                            scrollController:
                                                FixedExtentScrollController(
                                                  initialItem: selectedmonth,
                                                ),
                                            //드래그로 숫자 선택
                                            itemExtent: 50,
                                            onSelectedItemChanged: (index) {
                                              setModalState(() {
                                                selectedmonth =
                                                    index; // 선택될 때마다 인덱스 변경
                                              });
                                            },
                                            children: List.generate(
                                              12,
                                              (index) => Center(
                                                child: Text(
                                                  '${index + 1}',
                                                  style: TextStyle(
                                                    color:
                                                        selectedmonth == index
                                                        ? Color(0xFF2FB475)
                                                        : Color.fromARGB(
                                                            255,
                                                            0,
                                                            0,
                                                            0,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        // 출생 일
                                        child: SizedBox(
                                          height: 150,
                                          child: CupertinoPicker(
                                            scrollController:
                                                FixedExtentScrollController(
                                                  initialItem: selectedday,
                                                ),
                                            //드래그로 숫자 선택
                                            itemExtent: 50,
                                            onSelectedItemChanged: (index) {
                                              setModalState(() {
                                                selectedday = index;
                                              });
                                            },
                                            children: List.generate(
                                              31,
                                              (index) => Center(
                                                child: Text(
                                                  '${index + 1}',
                                                  style: TextStyle(
                                                    color: selectedday == index
                                                        ? Color(0xFF2FB475)
                                                        : Color.fromARGB(
                                                            255,
                                                            0,
                                                            0,
                                                            0,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              // 다음 버튼

                              height: 60,
                              width: 250,

                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF2FB475),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),

                                onPressed: () {
                                  setState(() {
                                    years =
                                        '${selectedyear + 1930}년 '
                                        '${selectedmonth + 1}월 '
                                        '${selectedday + 1}일';
                                  });

                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "다음",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffEFF9F4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(width: 20), // 생년월일 입력 버튼
                          Text(
                            years,
                            style: TextStyle(
                              fontSize: 16,
                              color: years == "생년월일을 알려주세요!"
                                  ? Color(0xffB6E5CE)
                                  : Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentGeometry.centerRight,
                              child: Icon(Icons.keyboard_arrow_down),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
        child: SizedBox(
          // 다음 버튼

          height: 60,

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2FB475),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            onPressed: () async {
              try {
                final response = await supabase.auth.signUp(
                  email: widget.email,
                  password: widget.password,
                );
                if (response.user != null ) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => emailLogin()),
                  );
                }
              } catch (e) {
                print('회원가입 실패${e}');
              }
            },
            child: Text(
              "다음",
              style: TextStyle(
                fontSize: 24,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
