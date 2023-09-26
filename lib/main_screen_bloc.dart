import 'package:flutter/material.dart';
import 'main_screen_model.dart';

class MainScreenBloc with ChangeNotifier {
  final _notifiers = <ChangeNotifier>[];
  final vaccinListNotifier = ValueNotifier<List<Vaccin>>([]);
  final childBirthdayNotifier = ValueNotifier<DateTime>(DateTime.now());
  final childNameNotifier = ValueNotifier<String>('');

  ///// 가이드용
  final guideCompleteNotifier = ValueNotifier<bool>(false);
  final guideMemoNotifier = ValueNotifier<String>('한번 탭하여 최대 20자 메모도 적을 수 있어요.');
  final guideDueDateNotifier = ValueNotifier<DateTime>(DateTime.now());

  MainScreenBloc() {
    _notifiers
      ..addAll([
        vaccinListNotifier,
        childBirthdayNotifier,
        childNameNotifier,
        guideCompleteNotifier,
        guideMemoNotifier,
        guideDueDateNotifier,
      ])
      ..forEach((element) {
        element.addListener(notifyListeners);
      });
  }

  @override
  void dispose() {
    for (var element in _notifiers) {
      element.removeListener(notifyListeners);
      element.dispose();
    }
    super.dispose();
  }

  void fetch({String? childName, DateTime? childBirthday}) {
    if (childName != null) {
      setChildName(childName);
    }

    if (childBirthday != null) {
      setChildBirthday(childBirthday);
    }

    vaccinListNotifier.value = [
      //0개월
      Vaccin(
        groupType: VaccinGroupType.month0,
        description: 'B형간염(1차)',
        dueDate: childBirthdayNotifier.value,
        isComplete: false,
        vaccinType: VaccinType.HepB,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.month0,
        description: '결핵(BCG)',
        dueDate: childBirthdayNotifier.value,
        isComplete: false,
        vaccinType: VaccinType.BCG,
      ),

      //1개월
      Vaccin(
        groupType: VaccinGroupType.month1,
        description: 'B형간염(2차)',
        dueDate: childBirthdayNotifier.value.addMonths(1),
        isComplete: false,
        vaccinType: VaccinType.HepB,
        round: 2,
      ),

      //2개월
      Vaccin(
        groupType: VaccinGroupType.month2,
        description: '디프테리아/파상풍/백일해(DTap)(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(2),
        isComplete: false,
        vaccinType: VaccinType.DTaP,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.month2,
        description: '소아마비(폴리오)(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(2),
        isComplete: false,
        vaccinType: VaccinType.IPV,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.month2,
        description: '뇌수막염(b형헤모필루스인플루엔자)(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(2),
        isComplete: false,
        vaccinType: VaccinType.Hib,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.month2,
        description: '폐렴구균(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(2),
        isComplete: false,
        vaccinType: VaccinType.PCV,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.month2,
        description: '로타바이러스(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(2),
        isComplete: false,
        vaccinType: VaccinType.Rotavirus,
        round: 1,
      ),

      //4개월
      Vaccin(
        groupType: VaccinGroupType.month4,
        description: '디프테리아/파상풍/백일해(DTap)(2차)',
        dueDate: childBirthdayNotifier.value.addMonths(4),
        isComplete: false,
        vaccinType: VaccinType.DTaP,
        round: 2,
      ),
      Vaccin(
        groupType: VaccinGroupType.month4,
        description: '소아마비(폴리오)(2차)',
        dueDate: childBirthdayNotifier.value.addMonths(4),
        isComplete: false,
        vaccinType: VaccinType.IPV,
        round: 2,
      ),
      Vaccin(
        groupType: VaccinGroupType.month4,
        description: '뇌수막염(b형헤모필루스인플루엔자)(2차)',
        dueDate: childBirthdayNotifier.value.addMonths(4),
        isComplete: false,
        vaccinType: VaccinType.Hib,
        round: 2,
      ),
      Vaccin(
        groupType: VaccinGroupType.month4,
        description: '폐구균(2치)',
        dueDate: childBirthdayNotifier.value.addMonths(4),
        isComplete: false,
        vaccinType: VaccinType.PCV,
        round: 2,
      ),
      Vaccin(
        groupType: VaccinGroupType.month4,
        description: '로타바이러스(2차)',
        dueDate: childBirthdayNotifier.value.addMonths(4),
        isComplete: false,
        vaccinType: VaccinType.Rotavirus,
        round: 2,
      ),

      //6개월
      Vaccin(
        groupType: VaccinGroupType.month6,
        description: 'B형간염(3차)',
        dueDate: childBirthdayNotifier.value.addMonths(6),
        isComplete: false,
        vaccinType: VaccinType.HepB,
        round: 3,
      ),
      Vaccin(
        groupType: VaccinGroupType.month6,
        description: '디프테리아/파상풍/백일해(DTap)(3차)',
        dueDate: childBirthdayNotifier.value.addMonths(6),
        isComplete: false,
        vaccinType: VaccinType.DTaP,
        round: 3,
      ),
      Vaccin(
        groupType: VaccinGroupType.month6,
        description: '뇌수막염(b형헤모필루스인플루엔자)(3차)',
        dueDate: childBirthdayNotifier.value.addMonths(6),
        isComplete: false,
        vaccinType: VaccinType.Hib,
        round: 3,
      ),
      Vaccin(
        groupType: VaccinGroupType.month6,
        description: '폐구균(3차)',
        dueDate: childBirthdayNotifier.value.addMonths(6),
        isComplete: false,
        vaccinType: VaccinType.PCV,
        round: 3,
      ),
      Vaccin(
        groupType: VaccinGroupType.month6,
        description: '로타바이러스(3차)',
        dueDate: childBirthdayNotifier.value.addMonths(6),
        isComplete: false,
        vaccinType: VaccinType.Rotavirus,
        round: 3,
      ),

      //6-18개월
      Vaccin(
        groupType: VaccinGroupType.month6_18,
        description: '소아마비(폴리오)(3차)',
        dueDate: childBirthdayNotifier.value.addMonths(6),
        isComplete: false,
        memo: '3차 접종은 생후 6~18개월까지 접종가능',
        vaccinType: VaccinType.IPV,
        round: 3,
      ),

      //12~15개월
      Vaccin(
        groupType: VaccinGroupType.month12_15,
        description: '뇌수막염(b형헤모필루스인플루엔자)(4차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        vaccinType: VaccinType.Hib,
        round: 4,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_15,
        description: '폐구균(4차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        vaccinType: VaccinType.PCV,
        round: 4,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_15,
        description: 'MMR(홍역,유행성이하선염,풍진)(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        vaccinType: VaccinType.MMR,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_15,
        description: '수두(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        vaccinType: VaccinType.VAR,
        round: 1,
      ),

      //12-23개월
      Vaccin(
        groupType: VaccinGroupType.month12_23,
        description: 'A형간염(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        vaccinType: VaccinType.HepA,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_23,
        description: 'A형간염(2차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        memo: 'A형간염(1차) 접종 후 6-12개월 사이',
        vaccinType: VaccinType.HepA,
        round: 2,
      ),

      Vaccin(
        groupType: VaccinGroupType.month12_23,
        description: '일본뇌염(IJEV)(사백신)(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        vaccinType: VaccinType.IJEV,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_23,
        description: '일본뇌염(IJEV)(사백신)(2차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        memo: '일본뇌염(IJEV)(사백신)(1차) 접종 한달 후',
        vaccinType: VaccinType.IJEV,
        round: 2,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_23,
        description: '일본뇌염(LJEV)(생백신)(1차)',
        dueDate: childBirthdayNotifier.value.addMonths(12),
        isComplete: false,
        vaccinType: VaccinType.LJEV,
        round: 1,
      ),

      //15-18개월
      Vaccin(
        groupType: VaccinGroupType.month15_18,
        description: '디프테리아/파상풍/백일해(DTap)(4차)',
        dueDate: childBirthdayNotifier.value.addMonths(15),
        isComplete: false,
        vaccinType: VaccinType.DTaP,
        round: 4,
      ),

      //24-35개월
      Vaccin(
        groupType: VaccinGroupType.month24_35,
        description: '일본뇌염(IJEV)(사백신)(3차)',
        dueDate: childBirthdayNotifier.value.addMonths(24),
        isComplete: false,
        memo: '일본뇌염(IJEV)(사백신)(2차) 접종 1년 후',
        vaccinType: VaccinType.IJEV,
        round: 3,
      ),
      Vaccin(
        groupType: VaccinGroupType.month24_35,
        description: '일본뇌염(LJEV)(생백신)(2차)',
        dueDate: childBirthdayNotifier.value.addMonths(24),
        isComplete: false,
        memo: '일본뇌염(LJEV)(생백신)(1차) 접종 1년 후',
        vaccinType: VaccinType.LJEV,
        round: 2,
      ),

      //24-만12세 -- 잘 모르겠음
      // Vaccin(
      //   groupType: VaccinGroupType.month24_age12,
      //   name: 'DTap/소아마비 추가',
      //   mandatory: true,
      //   dueDate: childBirthday.value,
      //   isComplete: false,
      // ),

      // 만4-6세
      Vaccin(
        groupType: VaccinGroupType.age4_6,
        description: '디프테리아/파상풍/백일해(DTap)(5차)',
        dueDate: childBirthdayNotifier.value.addYears(4),
        isComplete: false,
        vaccinType: VaccinType.DTaP,
        round: 5,
      ),
      Vaccin(
        groupType: VaccinGroupType.age4_6,
        description: '소아마비(폴리오)(4차)',
        dueDate: childBirthdayNotifier.value.addYears(4),
        isComplete: false,
        vaccinType: VaccinType.IPV,
        round: 4,
      ),
      Vaccin(
        groupType: VaccinGroupType.age4_6,
        description: 'MMR(홍역,유행성이하선염,풍진)(2차)',
        dueDate: childBirthdayNotifier.value.addYears(4),
        isComplete: false,
        vaccinType: VaccinType.MMR,
        round: 2,
      ),

      //만6세
      Vaccin(
        groupType: VaccinGroupType.age6,
        description: '일본뇌염(IJEV)(사백신)(4차)',
        dueDate: childBirthdayNotifier.value.addYears(6),
        isComplete: false,
        vaccinType: VaccinType.IJEV,
        round: 4,
      ),

      //만11-12세
      Vaccin(
        groupType: VaccinGroupType.age11_12,
        description: '디프테리아/파상풍/백일해(Tdap혹은Td)(6차)',
        dueDate: childBirthdayNotifier.value.addYears(11),
        isComplete: false,
        vaccinType: VaccinType.DTaP,
        round: 6,
      ),
      Vaccin(
        groupType: VaccinGroupType.age11_12,
        description: '사람유두종바이러스(HPV)(1차)',
        dueDate: childBirthdayNotifier.value.addYears(11),
        isComplete: false,
        vaccinType: VaccinType.HPV,
        round: 1,
      ),
      Vaccin(
        groupType: VaccinGroupType.age11_12,
        description: '사람유두종바이러스(HPV)(2차)',
        dueDate: childBirthdayNotifier.value.addYears(11),
        isComplete: false,
        memo: '사람유두종바이러스(HPV)(1차) 접종 후 6~12개월 간격',
        vaccinType: VaccinType.HPV,
        round: 2,
      ),

      //만12세
      Vaccin(
        groupType: VaccinGroupType.age12,
        description: '일본뇌염(IJEV)(사백신)(5차)',
        dueDate: childBirthdayNotifier.value.addYears(12),
        isComplete: false,
        vaccinType: VaccinType.IJEV,
        round: 5,
      ),
    ];

    vaccinListNotifier.notifyListeners();
  }

  void setChildBirthday(DateTime birthday) {
    childBirthdayNotifier.value = birthday;
    fetch();
  }

  void setChildName(String name) {
    childNameNotifier.value = name;
  }

  void setVaccinComplete(Vaccin vaccin, bool isComplete) {
    final index = vaccinListNotifier.value.indexOf(vaccin);
    vaccinListNotifier.value[index] =
        vaccinListNotifier.value[index].copyWith(isComplete: isComplete);
    vaccinListNotifier.notifyListeners();
  }

  void setVaccinDueDate(int index, DateTime duedate) {
    vaccinListNotifier.value[index] =
        vaccinListNotifier.value[index].copyWith(dueDate: duedate);
    vaccinListNotifier.notifyListeners();
  }

  void setVaccinMemo(int index, String memo) {
    vaccinListNotifier.value[index] =
        vaccinListNotifier.value[index].copyWith(memo: memo);
    vaccinListNotifier.notifyListeners();
  }

  /////////// 가이드용 ///////////
  void setGuideVaccinDueDate(DateTime duedate) {
    guideDueDateNotifier.value = duedate;
  }

  void setGuideComplete(bool isComplete) {
    guideCompleteNotifier.value = isComplete;
  }
}

extension DateHelpers on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime addYears(int years) {
    return copyWith(year: year + years);
  }

  DateTime addMonths(int months) {
    return copyWith(month: month + months);
  }

  DateTime addWeeks(int weeks) {
    return copyWith(day: day + weeks * 7);
  }

  DateTime addDays(int days) {
    return copyWith(day: day + days);
  }
}
