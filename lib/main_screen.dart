import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:woo_ah_yeah/main_screen_bloc.dart';
import 'package:woo_ah_yeah/main_screen_model.dart';
import 'package:woo_ah_yeah/webview_screen.dart';

class MainScreen extends StatefulWidget {
  final DateTime? childBirthday;
  final String? childName;

  const MainScreen({
    Key? key,
    this.childBirthday,
    this.childName,
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
        return MainScreenBloc()
          ..fetch(
            childBirthday: widget.childBirthday,
            childName: widget.childName,
          );
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0xfff4f3f9),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 90,
              centerTitle: false,
              backgroundColor: const Color(0xfff4f3f9),
              elevation: 0,
              scrolledUnderElevation: 3,
              surfaceTintColor: Colors.transparent,
              titleSpacing: 0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///// 우리 아이 예방접종
                    const Text(
                      '우리 아이 예방접종',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),

                    ///// 출생일
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///// 아이 이름
                        Text(
                          context
                              .read<MainScreenBloc>()
                              .childNameNotifier
                              .value,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        ///// 구분점
                        const Text(
                          ' · ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        ///// 출생일
                        Text(
                          '${DateFormat('yyyy-MM-dd').format(
                            context
                                .read<MainScreenBloc>()
                                .childBirthdayNotifier
                                .value,
                          )} 출생',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    ///// 앱바와 body 사이 간격
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
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
                          .vaccinListNotifier
                          .value
                          .where((element) =>
                              element.groupType ==
                              VaccinGroupType.values[groupIndex])
                          .toList();

                      return Column(
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
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
                                    ///// 완료 처리
                                    context
                                        .read<MainScreenBloc>()
                                        .setVaccinComplete(
                                            item, !item.isComplete);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
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

                                      ///// 예방접종명, 날짜, etc
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ///// 백신이름
                                          Text(
                                            (item.round > 0
                                                ? '${item.vaccinType.name} ${item.round}차'
                                                : item.vaccinType.name),
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
                                                initialDate: item.dueDate,
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime.now(),
                                              );
                                              if (selectedDate != null) {
                                                if (!context.mounted) {
                                                  return;
                                                }
                                                context
                                                    .read<MainScreenBloc>()
                                                    .setVaccinDueDate(
                                                        index, selectedDate);
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

                                          if (item.etc.isNotEmpty) ...{
                                            Text(
                                              item.etc,
                                              style: const TextStyle(
                                                color: Color(0xff393939),
                                              ),
                                            ),
                                          },
                                        ],
                                      ),

                                      ///// 여백
                                      const Spacer(),

                                      ///// info
                                      GestureDetector(
                                        onTap: () {
                                          ///// 질병관리청 정보 페이지 이동
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WebViewScreen(vaccin: item),
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          'assets/image/information.svg',
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  indent: 20,
                                  color: Color(0xfff4f3f9),
                                  height: 20,
                                );
                              },
                            ),
                          ),
                        ],
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
