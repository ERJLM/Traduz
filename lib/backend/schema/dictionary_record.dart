import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DictionaryRecord extends FirestoreRecord {
  DictionaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Portuguese" field.
  String? _portuguese;
  String get portuguese => _portuguese ?? '';
  bool hasPortuguese() => _portuguese != null;

  // "Kikongo" field.
  String? _kikongo;
  String get kikongo => _kikongo ?? '';
  bool hasKikongo() => _kikongo != null;

  // "Kimbundo" field.
  String? _kimbundo;
  String get kimbundo => _kimbundo ?? '';
  bool hasKimbundo() => _kimbundo != null;

  // "English" field.
  String? _english;
  String get english => _english ?? '';
  bool hasEnglish() => _english != null;

  // "wordType" field.
  String? _wordType;
  String get wordType => _wordType ?? '';
  bool hasWordType() => _wordType != null;

  // "definitionPortuguese" field.
  String? _definitionPortuguese;
  String get definitionPortuguese => _definitionPortuguese ?? '';
  bool hasDefinitionPortuguese() => _definitionPortuguese != null;

  // "Preview" field.
  String? _preview;
  String get preview => _preview ?? '';
  bool hasPreview() => _preview != null;

  // "Verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  // "showDef" field.
  bool? _showDef;
  bool get showDef => _showDef ?? false;
  bool hasShowDef() => _showDef != null;

  void _initializeFields() {
    _portuguese = snapshotData['Portuguese'] as String?;
    _kikongo = snapshotData['Kikongo'] as String?;
    _kimbundo = snapshotData['Kimbundo'] as String?;
    _english = snapshotData['English'] as String?;
    _wordType = snapshotData['wordType'] as String?;
    _definitionPortuguese = snapshotData['definitionPortuguese'] as String?;
    _preview = snapshotData['Preview'] as String?;
    _verified = snapshotData['Verified'] as bool?;
    _showDef = snapshotData['showDef'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Dictionary');

  static Stream<DictionaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DictionaryRecord.fromSnapshot(s));

  static Future<DictionaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DictionaryRecord.fromSnapshot(s));

  static DictionaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DictionaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DictionaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DictionaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DictionaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DictionaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDictionaryRecordData({
  String? portuguese,
  String? kikongo,
  String? kimbundo,
  String? english,
  String? wordType,
  String? definitionPortuguese,
  String? preview,
  bool? verified,
  bool? showDef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Portuguese': portuguese,
      'Kikongo': kikongo,
      'Kimbundo': kimbundo,
      'English': english,
      'wordType': wordType,
      'definitionPortuguese': definitionPortuguese,
      'Preview': preview,
      'Verified': verified,
      'showDef': showDef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DictionaryRecordDocumentEquality implements Equality<DictionaryRecord> {
  const DictionaryRecordDocumentEquality();

  @override
  bool equals(DictionaryRecord? e1, DictionaryRecord? e2) {
    return e1?.portuguese == e2?.portuguese &&
        e1?.kikongo == e2?.kikongo &&
        e1?.kimbundo == e2?.kimbundo &&
        e1?.english == e2?.english &&
        e1?.wordType == e2?.wordType &&
        e1?.definitionPortuguese == e2?.definitionPortuguese &&
        e1?.preview == e2?.preview &&
        e1?.verified == e2?.verified &&
        e1?.showDef == e2?.showDef;
  }

  @override
  int hash(DictionaryRecord? e) => const ListEquality().hash([
        e?.portuguese,
        e?.kikongo,
        e?.kimbundo,
        e?.english,
        e?.wordType,
        e?.definitionPortuguese,
        e?.preview,
        e?.verified,
        e?.showDef
      ]);

  @override
  bool isValidKey(Object? o) => o is DictionaryRecord;
}
