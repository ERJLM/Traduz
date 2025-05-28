// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DictionaryWordStruct extends FFFirebaseStruct {
  DictionaryWordStruct({
    /// Word in Portuguese
    String? portuguese,

    /// Word in English
    String? english,

    ///
    /// Word in Kikongo
    String? kikongo,
    String? kimbundo,

    /// "Noun, Verb, Adjective,..."
    String? wordType,

    /// Definition in Portuguese
    String? definitionPortuguese,
    String? preview,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _portuguese = portuguese,
        _english = english,
        _kikongo = kikongo,
        _kimbundo = kimbundo,
        _wordType = wordType,
        _definitionPortuguese = definitionPortuguese,
        _preview = preview,
        super(firestoreUtilData);

  // "Portuguese" field.
  String? _portuguese;
  String get portuguese => _portuguese ?? '';
  set portuguese(String? val) => _portuguese = val;

  bool hasPortuguese() => _portuguese != null;

  // "English" field.
  String? _english;
  String get english => _english ?? '';
  set english(String? val) => _english = val;

  bool hasEnglish() => _english != null;

  // "Kikongo" field.
  String? _kikongo;
  String get kikongo => _kikongo ?? '';
  set kikongo(String? val) => _kikongo = val;

  bool hasKikongo() => _kikongo != null;

  // "Kimbundo" field.
  String? _kimbundo;
  String get kimbundo => _kimbundo ?? '';
  set kimbundo(String? val) => _kimbundo = val;

  bool hasKimbundo() => _kimbundo != null;

  // "wordType" field.
  String? _wordType;
  String get wordType => _wordType ?? '';
  set wordType(String? val) => _wordType = val;

  bool hasWordType() => _wordType != null;

  // "definitionPortuguese" field.
  String? _definitionPortuguese;
  String get definitionPortuguese => _definitionPortuguese ?? '';
  set definitionPortuguese(String? val) => _definitionPortuguese = val;

  bool hasDefinitionPortuguese() => _definitionPortuguese != null;

  // "Preview" field.
  String? _preview;
  String get preview => _preview ?? '';
  set preview(String? val) => _preview = val;

  bool hasPreview() => _preview != null;

  static DictionaryWordStruct fromMap(Map<String, dynamic> data) =>
      DictionaryWordStruct(
        portuguese: data['Portuguese'] as String?,
        english: data['English'] as String?,
        kikongo: data['Kikongo'] as String?,
        kimbundo: data['Kimbundo'] as String?,
        wordType: data['wordType'] as String?,
        definitionPortuguese: data['definitionPortuguese'] as String?,
        preview: data['Preview'] as String?,
      );

  static DictionaryWordStruct? maybeFromMap(dynamic data) => data is Map
      ? DictionaryWordStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Portuguese': _portuguese,
        'English': _english,
        'Kikongo': _kikongo,
        'Kimbundo': _kimbundo,
        'wordType': _wordType,
        'definitionPortuguese': _definitionPortuguese,
        'Preview': _preview,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Portuguese': serializeParam(
          _portuguese,
          ParamType.String,
        ),
        'English': serializeParam(
          _english,
          ParamType.String,
        ),
        'Kikongo': serializeParam(
          _kikongo,
          ParamType.String,
        ),
        'Kimbundo': serializeParam(
          _kimbundo,
          ParamType.String,
        ),
        'wordType': serializeParam(
          _wordType,
          ParamType.String,
        ),
        'definitionPortuguese': serializeParam(
          _definitionPortuguese,
          ParamType.String,
        ),
        'Preview': serializeParam(
          _preview,
          ParamType.String,
        ),
      }.withoutNulls;

  static DictionaryWordStruct fromSerializableMap(Map<String, dynamic> data) =>
      DictionaryWordStruct(
        portuguese: deserializeParam(
          data['Portuguese'],
          ParamType.String,
          false,
        ),
        english: deserializeParam(
          data['English'],
          ParamType.String,
          false,
        ),
        kikongo: deserializeParam(
          data['Kikongo'],
          ParamType.String,
          false,
        ),
        kimbundo: deserializeParam(
          data['Kimbundo'],
          ParamType.String,
          false,
        ),
        wordType: deserializeParam(
          data['wordType'],
          ParamType.String,
          false,
        ),
        definitionPortuguese: deserializeParam(
          data['definitionPortuguese'],
          ParamType.String,
          false,
        ),
        preview: deserializeParam(
          data['Preview'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DictionaryWordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DictionaryWordStruct &&
        portuguese == other.portuguese &&
        english == other.english &&
        kikongo == other.kikongo &&
        kimbundo == other.kimbundo &&
        wordType == other.wordType &&
        definitionPortuguese == other.definitionPortuguese &&
        preview == other.preview;
  }

  @override
  int get hashCode => const ListEquality().hash([
        portuguese,
        english,
        kikongo,
        kimbundo,
        wordType,
        definitionPortuguese,
        preview
      ]);
}

DictionaryWordStruct createDictionaryWordStruct({
  String? portuguese,
  String? english,
  String? kikongo,
  String? kimbundo,
  String? wordType,
  String? definitionPortuguese,
  String? preview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DictionaryWordStruct(
      portuguese: portuguese,
      english: english,
      kikongo: kikongo,
      kimbundo: kimbundo,
      wordType: wordType,
      definitionPortuguese: definitionPortuguese,
      preview: preview,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DictionaryWordStruct? updateDictionaryWordStruct(
  DictionaryWordStruct? dictionaryWord, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dictionaryWord
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDictionaryWordStructData(
  Map<String, dynamic> firestoreData,
  DictionaryWordStruct? dictionaryWord,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dictionaryWord == null) {
    return;
  }
  if (dictionaryWord.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dictionaryWord.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dictionaryWordData =
      getDictionaryWordFirestoreData(dictionaryWord, forFieldValue);
  final nestedData =
      dictionaryWordData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dictionaryWord.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDictionaryWordFirestoreData(
  DictionaryWordStruct? dictionaryWord, [
  bool forFieldValue = false,
]) {
  if (dictionaryWord == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dictionaryWord.toMap());

  // Add any Firestore field values
  dictionaryWord.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDictionaryWordListFirestoreData(
  List<DictionaryWordStruct>? dictionaryWords,
) =>
    dictionaryWords
        ?.map((e) => getDictionaryWordFirestoreData(e, true))
        .toList() ??
    [];
