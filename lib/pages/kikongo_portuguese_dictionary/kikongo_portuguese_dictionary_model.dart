import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kikongo_portuguese_dictionary_widget.dart'
    show KikongoPortugueseDictionaryWidget;
import 'package:flutter/material.dart';

class KikongoPortugueseDictionaryModel
    extends FlutterFlowModel<KikongoPortugueseDictionaryWidget> {
  ///  State fields for stateful widgets in this page.

  List<String> simpleSearchResults = [];
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
