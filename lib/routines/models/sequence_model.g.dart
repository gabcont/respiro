// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequence_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSequenceCollection on Isar {
  IsarCollection<Sequence> get sequences => this.collection();
}

const SequenceSchema = CollectionSchema(
  name: r'Sequence',
  id: 1222559783107676580,
  properties: {
    r'localizationKey': PropertySchema(
      id: 0,
      name: r'localizationKey',
      type: IsarType.string,
    ),
    r'rawDescription': PropertySchema(
      id: 1,
      name: r'rawDescription',
      type: IsarType.string,
    ),
    r'rawName': PropertySchema(
      id: 2,
      name: r'rawName',
      type: IsarType.string,
    ),
    r'steps': PropertySchema(
      id: 3,
      name: r'steps',
      type: IsarType.objectList,
      target: r'SequenceStep',
    ),
    r'totalDuration': PropertySchema(
      id: 4,
      name: r'totalDuration',
      type: IsarType.long,
    )
  },
  estimateSize: _sequenceEstimateSize,
  serialize: _sequenceSerialize,
  deserialize: _sequenceDeserialize,
  deserializeProp: _sequenceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'SequenceStep': SequenceStepSchema},
  getId: _sequenceGetId,
  getLinks: _sequenceGetLinks,
  attach: _sequenceAttach,
  version: '3.1.0+1',
);

int _sequenceEstimateSize(
  Sequence object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.localizationKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rawDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rawName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.steps.length * 3;
  {
    final offsets = allOffsets[SequenceStep]!;
    for (var i = 0; i < object.steps.length; i++) {
      final value = object.steps[i];
      bytesCount += SequenceStepSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _sequenceSerialize(
  Sequence object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.localizationKey);
  writer.writeString(offsets[1], object.rawDescription);
  writer.writeString(offsets[2], object.rawName);
  writer.writeObjectList<SequenceStep>(
    offsets[3],
    allOffsets,
    SequenceStepSchema.serialize,
    object.steps,
  );
  writer.writeLong(offsets[4], object.totalDuration);
}

Sequence _sequenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Sequence(
    localizationKey: reader.readStringOrNull(offsets[0]),
    rawDescription: reader.readStringOrNull(offsets[1]),
    rawName: reader.readStringOrNull(offsets[2]),
    steps: reader.readObjectList<SequenceStep>(
          offsets[3],
          SequenceStepSchema.deserialize,
          allOffsets,
          SequenceStep(),
        ) ??
        const [],
  );
  object.id = id;
  return object;
}

P _sequenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<SequenceStep>(
            offset,
            SequenceStepSchema.deserialize,
            allOffsets,
            SequenceStep(),
          ) ??
          const []) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sequenceGetId(Sequence object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sequenceGetLinks(Sequence object) {
  return [];
}

void _sequenceAttach(IsarCollection<dynamic> col, Id id, Sequence object) {
  object.id = id;
}

extension SequenceQueryWhereSort on QueryBuilder<Sequence, Sequence, QWhere> {
  QueryBuilder<Sequence, Sequence, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SequenceQueryWhere on QueryBuilder<Sequence, Sequence, QWhereClause> {
  QueryBuilder<Sequence, Sequence, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Sequence, Sequence, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterWhereClause> idBetween(
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

extension SequenceQueryFilter
    on QueryBuilder<Sequence, Sequence, QFilterCondition> {
  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localizationKey',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localizationKey',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localizationKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localizationKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localizationKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      localizationKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localizationKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawDescription',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawDescription',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawDescriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      rawDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawName',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawName',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawName',
        value: '',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> rawNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawName',
        value: '',
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> stepsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> stepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> stepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> stepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      stepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> stepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> totalDurationEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition>
      totalDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> totalDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> totalDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SequenceQueryObject
    on QueryBuilder<Sequence, Sequence, QFilterCondition> {
  QueryBuilder<Sequence, Sequence, QAfterFilterCondition> stepsElement(
      FilterQuery<SequenceStep> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'steps');
    });
  }
}

extension SequenceQueryLinks
    on QueryBuilder<Sequence, Sequence, QFilterCondition> {}

extension SequenceQuerySortBy on QueryBuilder<Sequence, Sequence, QSortBy> {
  QueryBuilder<Sequence, Sequence, QAfterSortBy> sortByLocalizationKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localizationKey', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> sortByLocalizationKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localizationKey', Sort.desc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> sortByRawDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawDescription', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> sortByRawDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawDescription', Sort.desc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> sortByRawName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawName', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> sortByRawNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawName', Sort.desc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> sortByTotalDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDuration', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> sortByTotalDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDuration', Sort.desc);
    });
  }
}

extension SequenceQuerySortThenBy
    on QueryBuilder<Sequence, Sequence, QSortThenBy> {
  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByLocalizationKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localizationKey', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByLocalizationKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localizationKey', Sort.desc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByRawDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawDescription', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByRawDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawDescription', Sort.desc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByRawName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawName', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByRawNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawName', Sort.desc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByTotalDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDuration', Sort.asc);
    });
  }

  QueryBuilder<Sequence, Sequence, QAfterSortBy> thenByTotalDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDuration', Sort.desc);
    });
  }
}

extension SequenceQueryWhereDistinct
    on QueryBuilder<Sequence, Sequence, QDistinct> {
  QueryBuilder<Sequence, Sequence, QDistinct> distinctByLocalizationKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localizationKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sequence, Sequence, QDistinct> distinctByRawDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sequence, Sequence, QDistinct> distinctByRawName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sequence, Sequence, QDistinct> distinctByTotalDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDuration');
    });
  }
}

extension SequenceQueryProperty
    on QueryBuilder<Sequence, Sequence, QQueryProperty> {
  QueryBuilder<Sequence, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Sequence, String?, QQueryOperations> localizationKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localizationKey');
    });
  }

  QueryBuilder<Sequence, String?, QQueryOperations> rawDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawDescription');
    });
  }

  QueryBuilder<Sequence, String?, QQueryOperations> rawNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawName');
    });
  }

  QueryBuilder<Sequence, List<SequenceStep>, QQueryOperations> stepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'steps');
    });
  }

  QueryBuilder<Sequence, int, QQueryOperations> totalDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDuration');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EmbeddedSequenceSchema = Schema(
  name: r'EmbeddedSequence',
  id: 7759335543549573326,
  properties: {
    r'localizationKey': PropertySchema(
      id: 0,
      name: r'localizationKey',
      type: IsarType.string,
    ),
    r'rawDescription': PropertySchema(
      id: 1,
      name: r'rawDescription',
      type: IsarType.string,
    ),
    r'rawName': PropertySchema(
      id: 2,
      name: r'rawName',
      type: IsarType.string,
    ),
    r'steps': PropertySchema(
      id: 3,
      name: r'steps',
      type: IsarType.objectList,
      target: r'SequenceStep',
    ),
    r'totalDuration': PropertySchema(
      id: 4,
      name: r'totalDuration',
      type: IsarType.long,
    )
  },
  estimateSize: _embeddedSequenceEstimateSize,
  serialize: _embeddedSequenceSerialize,
  deserialize: _embeddedSequenceDeserialize,
  deserializeProp: _embeddedSequenceDeserializeProp,
);

int _embeddedSequenceEstimateSize(
  EmbeddedSequence object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.localizationKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rawDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rawName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.steps.length * 3;
  {
    final offsets = allOffsets[SequenceStep]!;
    for (var i = 0; i < object.steps.length; i++) {
      final value = object.steps[i];
      bytesCount += SequenceStepSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _embeddedSequenceSerialize(
  EmbeddedSequence object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.localizationKey);
  writer.writeString(offsets[1], object.rawDescription);
  writer.writeString(offsets[2], object.rawName);
  writer.writeObjectList<SequenceStep>(
    offsets[3],
    allOffsets,
    SequenceStepSchema.serialize,
    object.steps,
  );
  writer.writeLong(offsets[4], object.totalDuration);
}

EmbeddedSequence _embeddedSequenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmbeddedSequence(
    localizationKey: reader.readStringOrNull(offsets[0]),
    rawDescription: reader.readStringOrNull(offsets[1]),
    rawName: reader.readStringOrNull(offsets[2]),
    steps: reader.readObjectList<SequenceStep>(
          offsets[3],
          SequenceStepSchema.deserialize,
          allOffsets,
          SequenceStep(),
        ) ??
        const [],
  );
  return object;
}

P _embeddedSequenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<SequenceStep>(
            offset,
            SequenceStepSchema.deserialize,
            allOffsets,
            SequenceStep(),
          ) ??
          const []) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EmbeddedSequenceQueryFilter
    on QueryBuilder<EmbeddedSequence, EmbeddedSequence, QFilterCondition> {
  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localizationKey',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localizationKey',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localizationKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localizationKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localizationKey',
        value: '',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      localizationKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localizationKey',
        value: '',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawDescription',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawDescription',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawName',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawName',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawName',
        value: '',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      rawNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawName',
        value: '',
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      stepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      stepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      stepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      stepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      stepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      stepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      totalDurationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      totalDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      totalDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      totalDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EmbeddedSequenceQueryObject
    on QueryBuilder<EmbeddedSequence, EmbeddedSequence, QFilterCondition> {
  QueryBuilder<EmbeddedSequence, EmbeddedSequence, QAfterFilterCondition>
      stepsElement(FilterQuery<SequenceStep> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'steps');
    });
  }
}
