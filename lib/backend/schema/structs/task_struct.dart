// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TaskStruct extends FFFirebaseStruct {
  TaskStruct({
    String? answer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _answer = answer,
        super(firestoreUtilData);

  // "Answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  static TaskStruct fromMap(Map<String, dynamic> data) => TaskStruct(
        answer: data['Answer'] as String?,
      );

  static TaskStruct? maybeFromMap(dynamic data) =>
      data is Map ? TaskStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskStruct(
        answer: deserializeParam(
          data['Answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskStruct && answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([answer]);
}

TaskStruct createTaskStruct({
  String? answer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaskStruct(
      answer: answer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TaskStruct? updateTaskStruct(
  TaskStruct? task, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    task
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTaskStructData(
  Map<String, dynamic> firestoreData,
  TaskStruct? task,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (task == null) {
    return;
  }
  if (task.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && task.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taskData = getTaskFirestoreData(task, forFieldValue);
  final nestedData = taskData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = task.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTaskFirestoreData(
  TaskStruct? task, [
  bool forFieldValue = false,
]) {
  if (task == null) {
    return {};
  }
  final firestoreData = mapToFirestore(task.toMap());

  // Add any Firestore field values
  task.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaskListFirestoreData(
  List<TaskStruct>? tasks,
) =>
    tasks?.map((e) => getTaskFirestoreData(e, true)).toList() ?? [];
