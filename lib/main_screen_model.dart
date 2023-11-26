
import 'package:isar/isar.dart';

part 'main_screen_model.g.dart';

@collection
class Vaccin {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.ordinal)
  final VaccinGroupType groupType;

  final String description;

  final DateTime dueDate;

  final bool isComplete;

  final String memo;

  @Enumerated(EnumType.ordinal)
  final VaccinType vaccinType;

  final int round; // 몇차

  Vaccin({
    required this.groupType,
    required this.description,
    required this.dueDate,
    required this.isComplete,
    this.memo = '',
    required this.vaccinType,
    this.round = 0,
  });

  Vaccin copyWith({
    VaccinGroupType? groupType,
    String? description,
    bool? mandatory,
    DateTime? dueDate,
    bool? isComplete,
    String? memo,
    VaccinType? vaccinType,
    int? round,
  }) {
    return Vaccin(
      groupType: groupType ?? this.groupType,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isComplete: isComplete ?? this.isComplete,
      memo: memo ?? this.memo,
      vaccinType: vaccinType ?? this.vaccinType,
      round: round ?? this.round,
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

enum VaccinType {
  BCG(
    '결핵(BCG)',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1201',
  ),
  HepB(
    'B형간염',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1202',
  ),
  DTaP(
    '디프테리아/파상풍/백일해(DTap)',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1203',
  ),
  IPV(
    '소아마비(폴리오)',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1204',
  ),
  Hib(
    '뇌수막염(b형헤모필루스인플루엔자)',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1205',
  ),
  PCV(
    '폐렴구균',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1206',
  ),
  Rotavirus(
    '로타바이러스',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1215',
  ),
  MMR(
    'MMR(홍역,유행성이하선염,풍진)',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1207',
  ),
  VAR(
    '수두',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1208',
  ),
  HepA(
    'A형간염',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1209',
  ),
  IJEV(
    '일본뇌염(IJEV)(사백신)',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1210',
  ),
  LJEV(
    '일본뇌염(LJEV)(생백신)',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1210',
  ),
  HPV(
    '사람유두종바이러스(HPV)',
    'https://nip.kdca.go.kr/irhp/infm/goVcntInfo.do?menuLv=1&menuCd=1211',
  ),
  ;

  const VaccinType(
    this.name,
    this.siteAddress,
  );

  final String name;
  final String siteAddress;
}
