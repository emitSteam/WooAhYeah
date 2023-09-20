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
      Vaccin(
        group: 0,
          name: 'B형간염(1차)',
          dueDate: childBirthday.value,
          isComplete: true,
          guide: '생후 0~1주'),
      Vaccin(
          group: 1,
          name: 'BCG 결핵',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 0~4주'),
      Vaccin(
          group: 1,
          name: 'B형간염(2차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 1개월'),
      Vaccin(
          group: 2,
          name: 'DTap/소아마비 뇌수막염(1차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 2개월'),
      Vaccin(
          group: 2,
          name: '폐구균(1차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 2개월'),
      Vaccin(
          group: 2,
          name: '로타바이러스(1차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 2개월'), // 특이사항 금식
      Vaccin(
          group: 3,
          name: 'DTap/소아마비 뇌수막염(2차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 4개월'),
      Vaccin(
          group: 3,
          name: '폐구균(2치)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 4개월'),
      Vaccin(
          group: 3,
          name: '로타바이러스(2차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 4개월'),
      Vaccin(
          group: 4,
          name: 'B형간염(3차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 6개월'),
      Vaccin(
          group: 4,
          name: 'DTap/소아마비 뇌수막염(3차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 6개월'),
      Vaccin(
          group: 4,
          name: '로타바이러스(3차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 6개월'),
      Vaccin(
          group: 4,
          name: '폐구균(3차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 6개월'),
      Vaccin(
          group: 5,
          name: '수두/MMR',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 12~15개월'),
      Vaccin(
          group: 5,
          name: 'A형간염(1차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 12~15개월'),
      Vaccin(
          group: 5,
          name: '일본뇌염(1차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 12~15개월'),
      Vaccin(
          group: 6,
          name: '일본뇌염(2차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 12~15개월'),
      Vaccin(
          group: 7,
          name: '뇌수막염 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 12~15개월'),
      Vaccin(
          group: 7,
          name: '폐구균 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 12~15개월'),
      Vaccin(
          group: 8,
          name: 'DTap 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '생후 15~18개월'),
      Vaccin(
          group: 9,
          name: 'A형간염(2차)',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '1차 후 6개월 이상'),
      Vaccin(
          group: 10,
          name: '일본뇌염 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '1차 후 12개월 이상'),
      Vaccin(
          group: 11,
          name: 'DTap/소아마비 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '만 4~6세'),
      Vaccin(
          group: 11,
          name: 'MMR 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '만4~6세'),
      Vaccin(
          group: 11,
          name: '수두 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '만4~6세'),
      Vaccin(
          group: 12,
          name: '일본뇌염 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '만6세'),
      Vaccin(
          group: 13,
          name: '일본뇌염 추가',
          dueDate: childBirthday.value,
          isComplete: false,
          guide: '만 12세'),
    ];

    vaccinList.notifyListeners();
  }

  void setChildBirthday(DateTime birthday) {
    childBirthday.value = birthday;
  }

  void setChildName(String name) {
    childName.value = name;
  }

  void setComplete(int index, bool isComplete) {
    vaccinList.value[index] = vaccinList.value[index].copyWith(isComplete: isComplete);
    vaccinList.notifyListeners();
  }

  void setVaccinDueDate(int index, DateTime duedate) {
    vaccinList.value[index] = vaccinList.value[index].copyWith(dueDate: duedate);
    vaccinList.notifyListeners();
  }
}
