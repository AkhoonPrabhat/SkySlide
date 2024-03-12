// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProgressCollection on Isar {
  IsarCollection<Progress> get progress => this.collection();
}

const ProgressSchema = CollectionSchema(
  name: r'Progress',
  id: 4416052739984182258,
  properties: {
    r'coinStored': PropertySchema(
      id: 0,
      name: r'coinStored',
      type: IsarType.long,
    ),
    r'trashStored': PropertySchema(
      id: 1,
      name: r'trashStored',
      type: IsarType.long,
    )
  },
  estimateSize: _progressEstimateSize,
  serialize: _progressSerialize,
  deserialize: _progressDeserialize,
  deserializeProp: _progressDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _progressGetId,
  getLinks: _progressGetLinks,
  attach: _progressAttach,
  version: '3.1.0+1',
);

int _progressEstimateSize(
  Progress object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _progressSerialize(
  Progress object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.coinStored);
  writer.writeLong(offsets[1], object.trashStored);
}

Progress _progressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Progress();
  object.coinStored = reader.readLong(offsets[0]);
  object.id = id;
  object.trashStored = reader.readLong(offsets[1]);
  return object;
}

P _progressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _progressGetId(Progress object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _progressGetLinks(Progress object) {
  return [];
}

void _progressAttach(IsarCollection<dynamic> col, Id id, Progress object) {
  object.id = id;
}

extension ProgressQueryWhereSort on QueryBuilder<Progress, Progress, QWhere> {
  QueryBuilder<Progress, Progress, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProgressQueryWhere on QueryBuilder<Progress, Progress, QWhereClause> {
  QueryBuilder<Progress, Progress, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Progress, Progress, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Progress, Progress, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Progress, Progress, QAfterWhereClause> idBetween(
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

extension ProgressQueryFilter
    on QueryBuilder<Progress, Progress, QFilterCondition> {
  QueryBuilder<Progress, Progress, QAfterFilterCondition> coinStoredEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coinStored',
        value: value,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterFilterCondition> coinStoredGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coinStored',
        value: value,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterFilterCondition> coinStoredLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coinStored',
        value: value,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterFilterCondition> coinStoredBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coinStored',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Progress, Progress, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Progress, Progress, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Progress, Progress, QAfterFilterCondition> trashStoredEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trashStored',
        value: value,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterFilterCondition>
      trashStoredGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trashStored',
        value: value,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterFilterCondition> trashStoredLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trashStored',
        value: value,
      ));
    });
  }

  QueryBuilder<Progress, Progress, QAfterFilterCondition> trashStoredBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trashStored',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProgressQueryObject
    on QueryBuilder<Progress, Progress, QFilterCondition> {}

extension ProgressQueryLinks
    on QueryBuilder<Progress, Progress, QFilterCondition> {}

extension ProgressQuerySortBy on QueryBuilder<Progress, Progress, QSortBy> {
  QueryBuilder<Progress, Progress, QAfterSortBy> sortByCoinStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinStored', Sort.asc);
    });
  }

  QueryBuilder<Progress, Progress, QAfterSortBy> sortByCoinStoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinStored', Sort.desc);
    });
  }

  QueryBuilder<Progress, Progress, QAfterSortBy> sortByTrashStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trashStored', Sort.asc);
    });
  }

  QueryBuilder<Progress, Progress, QAfterSortBy> sortByTrashStoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trashStored', Sort.desc);
    });
  }
}

extension ProgressQuerySortThenBy
    on QueryBuilder<Progress, Progress, QSortThenBy> {
  QueryBuilder<Progress, Progress, QAfterSortBy> thenByCoinStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinStored', Sort.asc);
    });
  }

  QueryBuilder<Progress, Progress, QAfterSortBy> thenByCoinStoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinStored', Sort.desc);
    });
  }

  QueryBuilder<Progress, Progress, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Progress, Progress, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Progress, Progress, QAfterSortBy> thenByTrashStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trashStored', Sort.asc);
    });
  }

  QueryBuilder<Progress, Progress, QAfterSortBy> thenByTrashStoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trashStored', Sort.desc);
    });
  }
}

extension ProgressQueryWhereDistinct
    on QueryBuilder<Progress, Progress, QDistinct> {
  QueryBuilder<Progress, Progress, QDistinct> distinctByCoinStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coinStored');
    });
  }

  QueryBuilder<Progress, Progress, QDistinct> distinctByTrashStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trashStored');
    });
  }
}

extension ProgressQueryProperty
    on QueryBuilder<Progress, Progress, QQueryProperty> {
  QueryBuilder<Progress, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Progress, int, QQueryOperations> coinStoredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coinStored');
    });
  }

  QueryBuilder<Progress, int, QQueryOperations> trashStoredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trashStored');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTerrainCollection on Isar {
  IsarCollection<Terrain> get terrains => this.collection();
}

const TerrainSchema = CollectionSchema(
  name: r'Terrain',
  id: 3532745865988120157,
  properties: {
    r'maxDistanceTravelled': PropertySchema(
      id: 0,
      name: r'maxDistanceTravelled',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _terrainEstimateSize,
  serialize: _terrainSerialize,
  deserialize: _terrainDeserialize,
  deserializeProp: _terrainDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _terrainGetId,
  getLinks: _terrainGetLinks,
  attach: _terrainAttach,
  version: '3.1.0+1',
);

int _terrainEstimateSize(
  Terrain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _terrainSerialize(
  Terrain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.maxDistanceTravelled);
  writer.writeString(offsets[1], object.name);
}

Terrain _terrainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Terrain();
  object.id = id;
  object.maxDistanceTravelled = reader.readLong(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _terrainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _terrainGetId(Terrain object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _terrainGetLinks(Terrain object) {
  return [];
}

void _terrainAttach(IsarCollection<dynamic> col, Id id, Terrain object) {
  object.id = id;
}

extension TerrainQueryWhereSort on QueryBuilder<Terrain, Terrain, QWhere> {
  QueryBuilder<Terrain, Terrain, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TerrainQueryWhere on QueryBuilder<Terrain, Terrain, QWhereClause> {
  QueryBuilder<Terrain, Terrain, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Terrain, Terrain, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterWhereClause> idBetween(
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

extension TerrainQueryFilter
    on QueryBuilder<Terrain, Terrain, QFilterCondition> {
  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition>
      maxDistanceTravelledEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxDistanceTravelled',
        value: value,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition>
      maxDistanceTravelledGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxDistanceTravelled',
        value: value,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition>
      maxDistanceTravelledLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxDistanceTravelled',
        value: value,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition>
      maxDistanceTravelledBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxDistanceTravelled',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension TerrainQueryObject
    on QueryBuilder<Terrain, Terrain, QFilterCondition> {}

extension TerrainQueryLinks
    on QueryBuilder<Terrain, Terrain, QFilterCondition> {}

extension TerrainQuerySortBy on QueryBuilder<Terrain, Terrain, QSortBy> {
  QueryBuilder<Terrain, Terrain, QAfterSortBy> sortByMaxDistanceTravelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDistanceTravelled', Sort.asc);
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterSortBy>
      sortByMaxDistanceTravelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDistanceTravelled', Sort.desc);
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension TerrainQuerySortThenBy
    on QueryBuilder<Terrain, Terrain, QSortThenBy> {
  QueryBuilder<Terrain, Terrain, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterSortBy> thenByMaxDistanceTravelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDistanceTravelled', Sort.asc);
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterSortBy>
      thenByMaxDistanceTravelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDistanceTravelled', Sort.desc);
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Terrain, Terrain, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension TerrainQueryWhereDistinct
    on QueryBuilder<Terrain, Terrain, QDistinct> {
  QueryBuilder<Terrain, Terrain, QDistinct> distinctByMaxDistanceTravelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxDistanceTravelled');
    });
  }

  QueryBuilder<Terrain, Terrain, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension TerrainQueryProperty
    on QueryBuilder<Terrain, Terrain, QQueryProperty> {
  QueryBuilder<Terrain, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Terrain, int, QQueryOperations> maxDistanceTravelledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxDistanceTravelled');
    });
  }

  QueryBuilder<Terrain, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
