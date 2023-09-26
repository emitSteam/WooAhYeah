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
                      overflow: TextOverflow.ellipsis,
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
                          overflow: TextOverflow.ellipsis,
                        ),

                        ///// 구분점
                        const Text(
                          ' · ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                          overflow: TextOverflow.ellipsis,
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
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///// 가이드
                    Builder(
                      builder: (context) {
                        final isComplete = context.select(
                            (MainScreenBloc bloc) =>
                                bloc.guideCompleteNotifier.value);
                        return _buildGuide(context, isComplete);
                      },
                    ),

                    ///// 여백
                    const SizedBox(
                      height: 20,
                    ),

                    ///// 백신 리스트
                    Builder(
                      builder: (context) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
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
                                ///// 개월 정보
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 7,
                                    horizontal: 25,
                                  ),
                                  child: Text(
                                    vaccinListByGroup
                                        .first.groupType.monthString,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                ///// 백신 그룹별 리스트
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
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: vaccinListByGroup.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final item = vaccinListByGroup[index];
                                      return GestureDetector(
                                        onTap: () {
                                          ///// 메모 입력
                                          showDialog(
                                            context: context,
                                            builder: (innerContext) {
                                              String memo = item.memo;
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                title: const Text("메모"),
                                                content: TextFormField(
                                                  initialValue: memo,
                                                  maxLines: 1,
                                                  maxLength: 20,
                                                  onChanged: (value) {
                                                    memo = value;
                                                  },
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text(
                                                      '취소',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(innerContext)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text(
                                                      '저장',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              MainScreenBloc>()
                                                          .setVaccinMemo(
                                                              index, memo);
                                                      Navigator.of(innerContext)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        onDoubleTap: () {
                                          ///// 완료 처리
                                          context
                                              .read<MainScreenBloc>()
                                              .setVaccinComplete(
                                                  item, !item.isComplete);
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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

                                              ///// 예방접종명, 날짜, 메모
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                                        initialDate:
                                                            item.dueDate,
                                                        firstDate: context
                                                            .read<
                                                                MainScreenBloc>()
                                                            .childBirthdayNotifier
                                                            .value,
                                                        lastDate: item.dueDate
                                                            .addYears(10),
                                                      );
                                                      if (selectedDate !=
                                                          null) {
                                                        if (!context.mounted) {
                                                          return;
                                                        }
                                                        context
                                                            .read<
                                                                MainScreenBloc>()
                                                            .setVaccinDueDate(
                                                                index,
                                                                selectedDate);
                                                      }
                                                    },
                                                    child: Text(
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(item.dueDate),
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff393939),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),

                                                  ///// 메모
                                                  if (item.memo.isNotEmpty) ...{
                                                    Text(
                                                      item.memo,
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff393939),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                          WebViewScreen(
                                                              vaccin: item),
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGuide(BuildContext context, bool isComplete) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 25,
          ),
          child: Text(
            '가이드',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        GestureDetector(
          ///// 가이드 더블탭 처리
          onDoubleTap: () {
            context.read<MainScreenBloc>().setGuideComplete(!isComplete);
          },

          ///// 가이드 탭 처리
          onTap: () {
            ///// 메모 입력
            showDialog(
              context: context,
              builder: (innerContext) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  title: const Text("메모"),
                  content: TextFormField(
                    initialValue:
                        context.read<MainScreenBloc>().guideMemoNotifier.value,
                    maxLines: 1,
                    maxLength: 20,
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text(
                        '취소',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(innerContext).pop();
                      },
                    ),
                    TextButton(
                      child: const Text(
                        '저장',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(innerContext).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
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
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ///// 가이드 접종완료 여부
                  if (context.select((MainScreenBloc bloc) =>
                      bloc.guideCompleteNotifier.value)) ...{
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

                  ///// 가이드 예방접종명, 날짜, 메모
                  Expanded(
                    child: Row(
                      // 얘가 없으면 Expanded로 textoverflow처리할때 메모영역이 이상해진다...
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///// 백신이름
                            const Text(
                              '더블탭하면 완료처리!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),

                            ///// 여백
                            const SizedBox(
                              width: 10,
                            ),

                            ///// 백신 접종일
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final guideDate = context
                                        .read<MainScreenBloc>()
                                        .childBirthdayNotifier
                                        .value;
                                    final selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: guideDate,
                                      firstDate: guideDate,
                                      lastDate: guideDate.addYears(10),
                                    );
                                    if (selectedDate != null) {
                                      if (!context.mounted) {
                                        return;
                                      }
                                      context
                                          .read<MainScreenBloc>()
                                          .setGuideVaccinDueDate(selectedDate);
                                    }
                                  },
                                  child: Text(
                                    DateFormat('yyyy-MM-dd').format(
                                        context.select((MainScreenBloc bloc) =>
                                            bloc.guideDueDateNotifier.value)),
                                    style: const TextStyle(
                                      color: Color(0xff393939),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Text(
                                  ' 날짜도 탭해서 설정해요.',
                                  style: TextStyle(
                                    color: Color(0xff393939),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),

                            ///// 메모
                            if (context
                                .select((MainScreenBloc bloc) =>
                                    bloc.guideMemoNotifier.value)
                                .isNotEmpty) ...{
                              Text(
                                context.select((MainScreenBloc bloc) =>
                                    bloc.guideMemoNotifier.value),
                                style: const TextStyle(
                                  color: Color(0xff393939),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            },

                            ///// 가이드 i 아이콘 설명
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/image/information.svg',
                                  width: 17,
                                  height: 17,
                                ),
                                const Text(
                                  ' 아이콘을 누르면 질병관리청 백신정보를 볼수있어요.',
                                  style: TextStyle(
                                    color: Color(0xff393939),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///// 여백
                  const Spacer(),

                  ///// info
                  GestureDetector(
                    onTap: () {
                      ///// 질병관리청 정보 페이지 이동
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (innerContext) => WebViewScreen(
                              vaccin: context
                                  .read<MainScreenBloc>()
                                  .vaccinListNotifier
                                  .value[0]),
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
            ),
          ),
        ),
      ],
    );
  }
}
