import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kikongo_portuguese_dictionary_copy_widget.dart'
    show KikongoPortugueseDictionaryCopyWidget;
import 'package:flutter/material.dart';

class KikongoPortugueseDictionaryCopyModel
    extends FlutterFlowModel<KikongoPortugueseDictionaryCopyWidget> {
  ///  State fields for stateful widgets in this page.

  List<DictionaryRecord> simpleSearchResults = [];
  // State field(s) for TextField-Search widget.
  final textFieldSearchKey = GlobalKey();
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? textFieldSearchSelectedOption;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSearchFocusNode?.dispose();
  }
}
