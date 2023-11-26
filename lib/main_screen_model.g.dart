// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVaccinCollection on Isar {
  IsarCollection<Vaccin> get vaccins => this.collection();
}

const VaccinSchema = CollectionSchema(
  name: r'Vaccin',
  id: -2789448084035858595,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 1,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'groupType': PropertySchema(
      id: 2,
      name: r'groupType',
      type: IsarType.byte,
      enumMap: _VaccingroupTypeEnumValueMap,
    ),
    r'isComplete': PropertySchema(
      id: 3,
      name: r'isComplete',
      type: IsarType.bool,
    ),
    r'memo': PropertySchema(
      id: 4,
      name: r'memo',
      type: IsarType.string,
    ),
    r'round': PropertySchema(
      id: 5,
      name: r'round',
      type: IsarType.long,
    ),
    r'vaccinType': PropertySchema(
      id: 6,
      name: r'vaccinType',
      type: IsarType.byte,
      enumMap: _VaccinvaccinTypeEnumValueMap,
    )
  },
  estimateSize: _vaccinEstimateSize,
  serialize: _vaccinSerialize,
  deserialize: _vaccinDeserialize,
  deserializeProp: _vaccinDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _vaccinGetId,
  getLinks: _vaccinGetLinks,
  attach: _vaccinAttach,
  version: '3.1.0',
);

int _vaccinEstimateSize(
  Vaccin object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.memo.length * 3;
  return bytesCount;
}

void _vaccinSerialize(
  Vaccin object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeDateTime(offsets[1], object.dueDate);
  writer.writeByte(offsets[2], object.groupType.index);
  writer.writeBool(offsets[3], object.isComplete);
  writer.writeString(offsets[4], object.memo);
  writer.writeLong(offsets[5], object.round);
  writer.writeByte(offsets[6], object.vaccinType.index);
}

Vaccin _vaccinDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Vaccin(
    description: reader.readString(offsets[0]),
    dueDate: reader.readDateTime(offsets[1]),
    groupType:
        _VaccingroupTypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
            VaccinGroupType.month0,
    isComplete: reader.readBool(offsets[3]),
    memo: reader.readStringOrNull(offsets[4]) ?? '',
    round: reader.readLongOrNull(offsets[5]) ?? 0,
    vaccinType:
        _VaccinvaccinTypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
            VaccinType.BCG,
  );
  object.id = id;
  return object;
}

P _vaccinDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (_VaccingroupTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          VaccinGroupType.month0) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 6:
      return (_VaccinvaccinTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          VaccinType.BCG) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VaccingroupTypeEnumValueMap = {
  'month0': 0,
  'month1': 1,
  'month2': 2,
  'month4': 3,
  'month6': 4,
  'month6_18': 5,
  'month12_15': 6,
  'month12_23': 7,
  'month15_18': 8,
  'month24_35': 9,
  'age4_6': 10,
  'age6': 11,
  'age11_12': 12,
  'age12': 13,
};
const _VaccingroupTypeValueEnumMap = {
  0: VaccinGroupType.month0,
  1: VaccinGroupType.month1,
  2: VaccinGroupType.month2,
  3: VaccinGroupType.month4,
  4: VaccinGroupType.month6,
  5: VaccinGroupType.month6_18,
  6: VaccinGroupType.month12_15,
  7: VaccinGroupType.month12_23,
  8: VaccinGroupType.month15_18,
  9: VaccinGroupType.month24_35,
  10: VaccinGroupType.age4_6,
  11: VaccinGroupType.age6,
  12: VaccinGroupType.age11_12,
  13: VaccinGroupType.age12,
};
const _VaccinvaccinTypeEnumValueMap = {
  'BCG': 0,
  'HepB': 1,
  'DTaP': 2,
  'IPV': 3,
  'Hib': 4,
  'PCV': 5,
  'Rotavirus': 6,
  'MMR': 7,
  'VAR': 8,
  'HepA': 9,
  'IJEV': 10,
  'LJEV': 11,
  'HPV': 12,
};
const _VaccinvaccinTypeValueEnumMap = {
  0: VaccinType.BCG,
  1: VaccinType.HepB,
  2: VaccinType.DTaP,
  3: VaccinType.IPV,
  4: VaccinType.Hib,
  5: VaccinType.PCV,
  6: VaccinType.Rotavirus,
  7: VaccinType.MMR,
  8: VaccinType.VAR,
  9: VaccinType.HepA,
  10: VaccinType.IJEV,
  11: VaccinType.LJEV,
  12: VaccinType.HPV,
};

Id _vaccinGetId(Vaccin object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vaccinGetLinks(Vaccin object) {
  return [];
}

void _vaccinAttach(IsarCollection<dynamic> col, Id id, Vaccin object) {
  object.id = id;
}

extension VaccinQueryWhereSort on QueryBuilder<Vaccin, Vaccin, QWhere> {
  QueryBuilder<Vaccin, Vaccin, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VaccinQueryWhere on QueryBuilder<Vaccin, Vaccin, QWhereClause> {
  QueryBuilder<Vaccin, Vaccin, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VaccinQueryFilter on QueryBuilder<Vaccin, Vaccin, QFilterCondition> {
  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> dueDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> dueDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> dueDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> dueDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> groupTypeEqualTo(
      VaccinGroupType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupType',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> groupTypeGreaterThan(
    VaccinGroupType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupType',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> groupTypeLessThan(
    VaccinGroupType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupType',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> groupTypeBetween(
    VaccinGroupType lower,
    VaccinGroupType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> isCompleteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> memoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> roundEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'round',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> roundGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'round',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> roundLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'round',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> roundBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'round',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> vaccinTypeEqualTo(
      VaccinType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vaccinType',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> vaccinTypeGreaterThan(
    VaccinType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vaccinType',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> vaccinTypeLessThan(
    VaccinType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vaccinType',
        value: value,
      ));
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterFilterCondition> vaccinTypeBetween(
    VaccinType lower,
    VaccinType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vaccinType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VaccinQueryObject on QueryBuilder<Vaccin, Vaccin, QFilterCondition> {}

extension VaccinQueryLinks on QueryBuilder<Vaccin, Vaccin, QFilterCondition> {}

extension VaccinQuerySortBy on QueryBuilder<Vaccin, Vaccin, QSortBy> {
  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByGroupType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupType', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByGroupTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupType', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByIsCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'round', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'round', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByVaccinType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaccinType', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> sortByVaccinTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaccinType', Sort.desc);
    });
  }
}

extension VaccinQuerySortThenBy on QueryBuilder<Vaccin, Vaccin, QSortThenBy> {
  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByGroupType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupType', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByGroupTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupType', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByIsCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'round', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'round', Sort.desc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByVaccinType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaccinType', Sort.asc);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QAfterSortBy> thenByVaccinTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vaccinType', Sort.desc);
    });
  }
}

extension VaccinQueryWhereDistinct on QueryBuilder<Vaccin, Vaccin, QDistinct> {
  QueryBuilder<Vaccin, Vaccin, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<Vaccin, Vaccin, QDistinct> distinctByGroupType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupType');
    });
  }

  QueryBuilder<Vaccin, Vaccin, QDistinct> distinctByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isComplete');
    });
  }

  QueryBuilder<Vaccin, Vaccin, QDistinct> distinctByMemo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Vaccin, Vaccin, QDistinct> distinctByRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'round');
    });
  }

  QueryBuilder<Vaccin, Vaccin, QDistinct> distinctByVaccinType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vaccinType');
    });
  }
}

extension VaccinQueryProperty on QueryBuilder<Vaccin, Vaccin, QQueryProperty> {
  QueryBuilder<Vaccin, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Vaccin, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Vaccin, DateTime, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<Vaccin, VaccinGroupType, QQueryOperations> groupTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupType');
    });
  }

  QueryBuilder<Vaccin, bool, QQueryOperations> isCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isComplete');
    });
  }

  QueryBuilder<Vaccin, String, QQueryOperations> memoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memo');
    });
  }

  QueryBuilder<Vaccin, int, QQueryOperations> roundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'round');
    });
  }

  QueryBuilder<Vaccin, VaccinType, QQueryOperations> vaccinTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vaccinType');
    });
  }
}
