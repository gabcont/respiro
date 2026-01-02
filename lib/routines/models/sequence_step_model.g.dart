// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequence_step_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SequenceStepSchema = Schema(
  name: r'SequenceStep',
  id: -4443574220923763461,
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
    r'stepDuration': PropertySchema(
      id: 3,
      name: r'stepDuration',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.byte,
      enumMap: _SequenceSteptypeEnumValueMap,
    )
  },
  estimateSize: _sequenceStepEstimateSize,
  serialize: _sequenceStepSerialize,
  deserialize: _sequenceStepDeserialize,
  deserializeProp: _sequenceStepDeserializeProp,
);

int _sequenceStepEstimateSize(
  SequenceStep object,
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
  return bytesCount;
}

void _sequenceStepSerialize(
  SequenceStep object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.localizationKey);
  writer.writeString(offsets[1], object.rawDescription);
  writer.writeString(offsets[2], object.rawName);
  writer.writeLong(offsets[3], object.stepDuration);
  writer.writeByte(offsets[4], object.type.index);
}

SequenceStep _sequenceStepDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SequenceStep(
    localizationKey: reader.readStringOrNull(offsets[0]),
    rawDescription: reader.readStringOrNull(offsets[1]),
    rawName: reader.readStringOrNull(offsets[2]),
    stepDuration: reader.readLongOrNull(offsets[3]) ?? 0,
    type: _SequenceSteptypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        StepType.inhale,
  );
  return object;
}

P _sequenceStepDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (_SequenceSteptypeValueEnumMap[reader.readByteOrNull(offset)] ??
          StepType.inhale) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SequenceSteptypeEnumValueMap = {
  'inhale': 0,
  'exhale': 1,
  'hold': 2,
  'meditate': 3,
};
const _SequenceSteptypeValueEnumMap = {
  0: StepType.inhale,
  1: StepType.exhale,
  2: StepType.hold,
  3: StepType.meditate,
};

extension SequenceStepQueryFilter
    on QueryBuilder<SequenceStep, SequenceStep, QFilterCondition> {
  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      localizationKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localizationKey',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      localizationKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localizationKey',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      localizationKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localizationKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      localizationKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localizationKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      localizationKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localizationKey',
        value: '',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      localizationKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localizationKey',
        value: '',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawDescription',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawDescription',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawName',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawName',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
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

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawName',
        value: '',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      rawNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawName',
        value: '',
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      stepDurationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stepDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      stepDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stepDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      stepDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stepDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      stepDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stepDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition> typeEqualTo(
      StepType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition>
      typeGreaterThan(
    StepType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition> typeLessThan(
    StepType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<SequenceStep, SequenceStep, QAfterFilterCondition> typeBetween(
    StepType lower,
    StepType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SequenceStepQueryObject
    on QueryBuilder<SequenceStep, SequenceStep, QFilterCondition> {}
