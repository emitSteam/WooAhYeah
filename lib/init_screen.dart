import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:woo_ah_yeah/main_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final birthdayTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  DateTime childBirthday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f3f9),
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: false,
        backgroundColor: const Color(0xfff4f3f9),
        elevation: 0,
        scrolledUnderElevation: 3,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///// 우리 아이 예방접종
              Text(
                '우리 아이 예방접종',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              ///// 앱바와 body 사이 간격
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 50,
        ),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///// 이름 입력
            SizedBox(
              height: 70,
              child: TextFormField(
                controller: nameTextEditingController,
                maxLength: 3,
                decoration: InputDecoration(
                  labelText: '아이 이름',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),

            ///// 간격
            const SizedBox(
              height: 20,
            ),

            ///// 출생 입력
            SizedBox(
              height: 70,
              child: TextFormField(
                controller: birthdayTextEditingController,
                decoration: InputDecoration(
                  labelText: '출생',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: childBirthday,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate == null) {
                    return;
                  }
                  if (!context.mounted) {
                    return;
                  }
                  childBirthday = selectedDate;
                  birthdayTextEditingController.text =
                      DateFormat('yyyy-MM-dd').format(selectedDate);
                },
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            ///// next 버튼
            GestureDetector(
              onTap: () {
                if (nameTextEditingController.text.isEmpty) {
                  Fluttertoast.showToast(msg: '아이 이름을 입력해주세요.');
                  return;
                }
                if (birthdayTextEditingController.text.isEmpty) {
                  Fluttertoast.showToast(msg: '아이 생일을 입력해주세요.');
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MainScreen(
                        childName: nameTextEditingController.text,
                        childBirthday: childBirthday,
                      ),
                    ),
                    (route) => false);
              },
              child: Container(
                height: 63,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.yellow,
                ),
                padding: const EdgeInsets.all(
                  10,
                ),
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
