class Vaccin {
  final VaccinGroupType groupType;
  final String name;
  final DateTime dueDate;
  final bool isComplete;
  final String etc;

  Vaccin({
    required this.groupType,
    required this.name,
    required this.dueDate,
    required this.isComplete,
    this.etc = '',
  });

  Vaccin copyWith({
    VaccinGroupType? groupType,
    String? name,
    bool? mandatory,
    DateTime? dueDate,
    bool? isComplete,
    String? etc,
  }) {
    return Vaccin(
      groupType: groupType ?? this.groupType,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      isComplete: isComplete ?? this.isComplete,
      etc: etc ?? this.etc,
    );
  }
}

enum VaccinGroupType {
  month0('0개월'),
  month1('1개월'),
  month2('2개월'),
  month4('4개월'),
  month6('6개월'),
  month6_18('6-18개월'),
  month12_15('12-15개월'),
  month12_23('12-23개월'),
  month15_18('15-18개월'),
  month24_35('24-35개월'),
  age4_6('만4-6세'),
  age6('만6세'),
  age11_12('만11-12세'),
  age12('만12세');

  const VaccinGroupType(this.monthString);

  final String monthString;
}
