import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:woo_ah_yeah/main_screen_bloc.dart';
import 'package:woo_ah_yeah/main_screen_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const horizonPadding = 20.0;

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
            backgroundColor: const Color(0xfff4f3f9),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              toolbarHeight: 70,
              centerTitle: false,
              backgroundColor: const Color(0xfff4f3f9),
              elevation: 0,
              scrolledUnderElevation: 3,
              surfaceTintColor: Colors.transparent,
              titleSpacing: 0,

              ///// 예방접종표
              title: Padding(
                padding: const EdgeInsets.only(left: horizonPadding),
                child: Text(
                  '${context.select((MainScreenBloc bloc) => bloc.childName.value)}의 예방접종',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              actions: [
                ///// 태어난 날짜
                Padding(
                  padding: const EdgeInsets.only(right: horizonPadding),
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
                      '${DateFormat('yyyy-MM-dd').format(childBirthday)} 출생',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {

              },
              child: const Icon(Icons.add),
            ), //
            body: Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizonPadding,
                  ),
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    itemCount: VaccinGroupType.values.length,
                    itemBuilder: (BuildContext context, int groupIndex) {
                      final vaccinListByGroup = context
                          .watch<MainScreenBloc>()
                          .vaccinList
                          .value
                          .where((element) =>
                              element.groupType ==
                              VaccinGroupType.values[groupIndex])
                          .toList();

                      return SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 7,
                                horizontal: 25,
                              ),
                              child: Text(
                                vaccinListByGroup.first.groupType.monthString,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),

                              ///// 백신 그룹별 리스트
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: vaccinListByGroup.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final item = vaccinListByGroup[index];
                                  return GestureDetector(
                                    onDoubleTap: () {
                                      context
                                          .read<MainScreenBloc>()
                                          .setVaccinComplete(
                                              item, !item.isComplete);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ///// 접종완료 여부
                                          if (item.isComplete) ...{
                                            const Text(
                                              '완료!',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            ///// 여백
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          },

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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
                                                  final selectedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: childBirthday,
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime.now(),
                                                  );
                                                  if (selectedDate != null) {
                                                    if (!context.mounted) {
                                                      return;
                                                    }
                                                    context
                                                        .read<MainScreenBloc>()
                                                        .setVaccinDueDate(index,
                                                            selectedDate);
                                                  }
                                                },
                                                child: Text(
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(item.dueDate),
                                                  style: const TextStyle(
                                                    color: Color(0xff393939),
                                                  ),
                                                ),
                                              ),

                                              // etc
                                              if (item.etc.isNotEmpty) ...{
                                                Text(
                                                  item.etc,
                                                  style: const TextStyle(
                                                    color: Color(0xff393939),
                                                  ),
                                                ),
                                              }
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider(
                                    indent: 20,
                                    color: Color(0xfff4f3f9),
                                    height: 0,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
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
