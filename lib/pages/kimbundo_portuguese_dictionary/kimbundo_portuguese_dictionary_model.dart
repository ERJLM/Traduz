import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kimbundo_portuguese_dictionary_widget.dart'
    show KimbundoPortugueseDictionaryWidget;
import 'package:flutter/material.dart';

class KimbundoPortugueseDictionaryModel
    extends FlutterFlowModel<KimbundoPortugueseDictionaryWidget> {
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
