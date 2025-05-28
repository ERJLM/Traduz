import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_word_copy_widget.dart' show VerifyWordCopyWidget;
import 'package:flutter/material.dart';

class VerifyWordCopyModel extends FlutterFlowModel<VerifyWordCopyWidget> {
  ///  State fields for stateful widgets in this page.

  List<DictionaryRecord> simpleSearchResults = [];
  // State field(s) for TextField-Search widget.
  final textFieldSearchKey = GlobalKey();
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? textFieldSearchSelectedOption;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSearchFocusNode?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
