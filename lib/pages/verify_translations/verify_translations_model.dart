import '/flutter_flow/flutter_flow_util.dart';
import 'verify_translations_widget.dart' show VerifyTranslationsWidget;
import 'package:flutter/material.dart';

class VerifyTranslationsModel
    extends FlutterFlowModel<VerifyTranslationsWidget> {
  ///  Local state fields for this page.

  String solution = 'Galinha';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
