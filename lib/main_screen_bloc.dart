import 'dart:ffi';

import 'package:flutter/material.dart';

import 'main_screen_model.dart';

class MainScreenBloc with ChangeNotifier {
  final _notifiers = <ChangeNotifier>[];
  final vaccinList = ValueNotifier<List<Vaccin>>([]);
  final childBirthday = ValueNotifier<DateTime>(DateTime.now());
  final childName = ValueNotifier<String>('우주');

  MainScreenBloc() {
    _notifiers
      ..addAll([
        vaccinList,
        childBirthday,
        childName,
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

  void fetch() {
    vaccinList.value = [
      //0개월
      Vaccin(
        groupType: VaccinGroupType.month0,
        name: 'B형간염(1차)',
        dueDate: childBirthday.value,
        isComplete: true,
      ),
      Vaccin(
        groupType: VaccinGroupType.month0,
        name: '결핵(BCG)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),

      //1개월
      Vaccin(
        groupType: VaccinGroupType.month1,
        name: 'B형간염(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),

      //2개월
      Vaccin(
        groupType: VaccinGroupType.month2,
        name: '디프테리아/파상풍/백일해(DTap)(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month2,
        name: '소아마비(폴리오)(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month2,
        name: '뇌수막염(b형헤모필루스인플루엔자)(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month2,
        name: '폐구균(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month2,
        name: '로타바이러스(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
        etc: '금식',
      ),

      //4개월
      Vaccin(
        groupType: VaccinGroupType.month4,
        name: '디프테리아/파상풍/백일해(DTap)(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month4,
        name: '소아마비(폴리오)(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month4,
        name: '뇌수막염(b형헤모필루스인플루엔자)(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month4,
        name: '폐구균(2치)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month4,
        name: '로타바이러스(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),

      //6개월
      Vaccin(
        groupType: VaccinGroupType.month6,
        name: 'B형간염(3차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month6,
        name: '디프테리아/파상풍/백일해(DTap)(3차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month6,
        name: '뇌수막염(b형헤모필루스인플루엔자)(3차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month6,
        name: '폐구균(3차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month6,
        name: '로타바이러스(3차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),

      //6-18개월
      Vaccin(
        groupType: VaccinGroupType.month6_18,
        name: '소아마비(폴리오)(3차)',
        dueDate: childBirthday.value,
        isComplete: false,
        etc: '3차 접종은 생후 6~18개월까지 접종가능'
      ),

      //12~15개월
      Vaccin(
        groupType: VaccinGroupType.month12_15,
        name: '뇌수막염(b형헤모필루스인플루엔자)(4차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_15,
        name: '폐구균(4차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_15,
        name: 'MMR(홍역,유행성이하선염,풍진)(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_15,
        name: '수두(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),

      //12-23개월
      Vaccin(
        groupType: VaccinGroupType.month12_23,
        name: 'A형간염(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
          groupType: VaccinGroupType.month12_23,
        name: 'A형간염(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
        etc: 'A형간염(1차) 접종 후 6-12개월 사이'
      ),

      Vaccin(
        groupType: VaccinGroupType.month12_23,
        name: '일본뇌염(IJEV)(사백신)(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
          groupType: VaccinGroupType.month12_23,
          name: '일본뇌염(IJEV)(사백신)(2차)',
          dueDate: childBirthday.value,
          isComplete: false,
          etc: '일본뇌염(IJEV)(사백신)(1차) 접종 한달 후'
      ),
      Vaccin(
        groupType: VaccinGroupType.month12_23,
        name: '일본뇌염(LJEV)(생백신)(1차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),

      //15-18개월
      Vaccin(
        groupType: VaccinGroupType.month15_18,
        name: '디프테리아/파상풍/백일해(DTap)(4차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),

      //24-35개월
      Vaccin(
          groupType: VaccinGroupType.month24_35,
          name: '일본뇌염(IJEV)(사백신)(3차)',
          dueDate: childBirthday.value,
          isComplete: false,
          etc: '일본뇌염(IJEV)(사백신)(2차) 접종 1년 후'
      ),
      Vaccin(
        groupType: VaccinGroupType.month24_35,
        name: '일본뇌염(LJEV)(생백신)(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
        etc: '일본뇌염(LJEV)(생백신)(1차) 접종 1년 후'
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
        name: '디프테리아/파상풍/백일해(DTap)(5차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.age4_6,
        name: '소아마비(폴리오)(4차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.age4_6,
        name: 'MMR(홍역,유행성이하선염,풍진)(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),


      //만6세
      Vaccin(
          groupType: VaccinGroupType.age6,
          name: '일본뇌염(IJEV)(사백신)(4차)',
          dueDate: childBirthday.value,
          isComplete: false,
      ),

      //만11-12세
      Vaccin(
        groupType: VaccinGroupType.age11_12,
        name: '디프테리아/파상풍/백일해(Tdap혹은Td)(6차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.age11_12,
        name: '사람유두종바이러스(HPV)(1차)',

        dueDate: childBirthday.value,
        isComplete: false,
      ),
      Vaccin(
        groupType: VaccinGroupType.age11_12,
        name: '사람유두종바이러스(HPV)(2차)',
        dueDate: childBirthday.value,
        isComplete: false,
        etc: '사람유두종바이러스(HPV)(1차) 접종 후 6~12개월 간격'
      ),

      //만12세
      Vaccin(
        groupType: VaccinGroupType.age12,
        name: '일본뇌염(IJEV)(사백신)(5차)',
        dueDate: childBirthday.value,
        isComplete: false,
      ),
    ];

    vaccinList.notifyListeners();
  }

  void setChildBirthday(DateTime birthday) {
    childBirthday.value = birthday;
  }

  void setChildName(String name) {
    childName.value = name;
  }

  void setVaccinComplete(Vaccin vaccin, bool isComplete) {
    final index = vaccinList.value.indexOf(vaccin);
    vaccinList.value[index] =
        vaccinList.value[index].copyWith(isComplete: isComplete);
    vaccinList.notifyListeners();
  }

  void setVaccinDueDate(int index, DateTime duedate) {
    vaccinList.value[index] =
        vaccinList.value[index].copyWith(dueDate: duedate);
    vaccinList.notifyListeners();
  }
}
