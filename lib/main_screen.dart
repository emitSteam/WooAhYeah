import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:woo_ah_yeah/main_screen_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainScreenBloc>(
      create: (context) {
        return MainScreenBloc()..fetch();
      },
      child: Builder(
        builder: (context) {
          final childBirthday =
              context.watch<MainScreenBloc>().childBirthday.value;
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              toolbarHeight: 100,

              ///// 예방접종표
              title: Text(
                  '${context.select((MainScreenBloc bloc) => bloc.childName.value)}의 예방접종'),
              actions: [
                ///// 태어난 날짜
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: childBirthday,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        if (!context.mounted) return;
                        context
                            .read<MainScreenBloc>()
                            .setChildBirthday(selectedDate);
                      }
                    },
                    child: Text(
                        '${DateFormat('yyyy-MM-dd').format(childBirthday)} 출생'),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
            ),
            body: Builder(
              builder: (context) {
                final vaccinList =
                    context.watch<MainScreenBloc>().vaccinList.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final item = vaccinList[index];

                      ///// 예방접종 정보
                      return GestureDetector(
                        onDoubleTap: () {
                          context.read<MainScreenBloc>().setComplete(index, !item.isComplete);
                        },
                        child: Row(
                          children: [
                            ///// 접종완료 여부
                            Text(
                              item.isComplete ? '접종완료' : '',
                              style: TextStyle(
                                color:
                                    item.isComplete ? Colors.green : Colors.grey,
                                fontSize: 16,
                                fontWeight: item.isComplete
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),

                            ///// 여백
                            const SizedBox(
                              width: 10,
                            ),

                            ///// 백신이름
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            ///// 여백
                            const SizedBox(
                              width: 10,
                            ),

                            ///// 백신 접종일
                            GestureDetector(
                              onTap: () async {
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: childBirthday,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now(),
                                );
                                if (selectedDate != null) {
                                  if (!context.mounted) return;
                                  context
                                      .read<MainScreenBloc>()
                                      .setVaccinDueDate(index, selectedDate);
                                }
                              },
                              child: Text(
                                DateFormat('yyyy-MM-dd').format(item.dueDate),
                                style: const TextStyle(
                                  color: Color(0xff393939),
                                ),
                              ),
                            ),

                            ///// 여백
                            const SizedBox(
                              width: 3,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: vaccinList.length,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
