// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DicWordListStruct extends FFFirebaseStruct {
  DicWordListStruct({
    List<DictionaryWordStruct>? water,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _water = water,
        super(firestoreUtilData);

  // "Water" field.
  List<DictionaryWordStruct>? _water;
  List<DictionaryWordStruct> get water => _water ?? const [];
  set water(List<DictionaryWordStruct>? val) => _water = val;

  void updateWater(Function(List<DictionaryWordStruct>) updateFn) {
    updateFn(_water ??= []);
  }

  bool hasWater() => _water != null;

  static DicWordListStruct fromMap(Map<String, dynamic> data) =>
      DicWordListStruct(
        water: getStructList(
          data['Water'],
          DictionaryWordStruct.fromMap,
        ),
      );

  static DicWordListStruct? maybeFromMap(dynamic data) => data is Map
      ? DicWordListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Water': _water?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Water': serializeParam(
          _water,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DicWordListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DicWordListStruct(
        water: deserializeStructParam<DictionaryWordStruct>(
          data['Water'],
          ParamType.DataStruct,
          true,
          structBuilder: DictionaryWordStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DicWordListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DicWordListStruct &&
        listEquality.equals(water, other.water);
  }

  @override
  int get hashCode => const ListEquality().hash([water]);
}

DicWordListStruct createDicWordListStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DicWordListStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DicWordListStruct? updateDicWordListStruct(
  DicWordListStruct? dicWordList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dicWordList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDicWordListStructData(
  Map<String, dynamic> firestoreData,
  DicWordListStruct? dicWordList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dicWordList == null) {
    return;
  }
  if (dicWordList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dicWordList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dicWordListData =
      getDicWordListFirestoreData(dicWordList, forFieldValue);
  final nestedData =
      dicWordListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dicWordList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDicWordListFirestoreData(
  DicWordListStruct? dicWordList, [
  bool forFieldValue = false,
]) {
  if (dicWordList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dicWordList.toMap());

  // Add any Firestore field values
  dicWordList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDicWordListListFirestoreData(
  List<DicWordListStruct>? dicWordLists,
) =>
    dicWordLists?.map((e) => getDicWordListFirestoreData(e, true)).toList() ??
    [];
